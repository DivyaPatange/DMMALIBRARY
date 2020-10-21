@extends('auth.authLayouts.main')
@section('title', 'Student BT Card')
@section('customcss')

<link href="{{ asset('adminAsset/vendor/datatables/dataTables.bootstrap4.min.css') }}" rel="stylesheet">
@endsection
@section('content')
<!-- Begin Page Content -->
<div class="container-fluid">
    @if ($message = Session::get('success'))
    <div class="alert alert-success alert-block mt-4">
        <button type="button" class="close" data-dismiss="alert">×</button>	
            <strong>{{ $message }}</strong>
    </div>
    @endif
    @if ($message = Session::get('danger'))
    <div class="alert alert-danger alert-block mt-4">
        <button type="button" class="close" data-dismiss="alert">×</button>	
            <strong>{{ $message }}</strong>
    </div>
    @endif
    <!-- Page Heading -->
    <h1 class="h3 mb-2 text-gray-800">Student BT Card</h1>
    <div class="row justify-content-center">
        <div class="col-lg-12">
            <!-- Basic Card Example -->
            <div class="card shadow mb-4">
                <div class="card-header">
                    Add Student BT Card
                </div>
                <div class="card-body">
                    <form method="post" action="{{ route('admin.student-bt-card.store') }}">
                    @csrf 
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group ">
                                    <label>Name</label>
                                    <input type="text" class="form-control form-control-user @error('name') is-invalid @enderror" name="name" id="exampleInputName" placeholder="Enter Name" value="{{ old('name') }}">
                                    @error('name')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                    @enderror
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group ">
                                    <label>Class</label>
                                    <select class="form-control form-control-user @error('class') is-invalid @enderror" name="class" id="exampleInputName">
                                        <option value="">- Select Class -</option>
                                        @foreach($course as $c)
                                        <option value="{{ $c->id }}">{{ $c->course_name }}</option>
                                        @endforeach
                                    </select>
                                    @error('class')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                    @enderror
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group ">
                                    <label>Department</label>
                                    <select class="form-control form-control-user @error('department') is-invalid @enderror" name="department" id="exampleInputName">
                                        <option value="">- Select Department -</option>
                                        @foreach($department as $d)
                                        <option value="{{ $d->id }}">{{ $d->department }}</option>
                                        @endforeach
                                    </select>
                                    @error('department')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                    @enderror
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group ">
                                    <label>Session</label>
                                    <select class="form-control form-control-user @error('session') is-invalid @enderror" name="session" id="exampleInputName">
                                        <option value="">- Select Session -</option>
                                        @foreach($academicYear as $a)
                                        <option value="{{ $a->id }}">({{ $a->from_academic_year }}) - ({{ $a->to_academic_year }})</option>
                                        @endforeach
                                    </select>
                                    @error('session')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                    @enderror
                                </div>
                            </div>
                            <div class="col-md-4">
                            <div class="form-check">
                            <input type="checkbox" name="book_bank" class="form-check-input" id="exampleCheck1" value="1">
                            <label class="form-check-label" for="exampleCheck1">Book Bank</label>
                            </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12 text-center">
                                <button type="submit" class="btn btn-primary btn-user">
                                Add
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
  <!-- DataTales Example -->
  <div class="card shadow mb-4">
    <div class="card-header py-3">
    <div class="row">
        <div class="col-md-8">
          <h6 class="m-0 font-weight-bold text-primary">Student BT Card List</h6>
        </div>
        <div class="col-md-4">
        <?php
            $date = date('Y-m-d');
        ?>
          <select class="form-control form-control-user @error('academic_year') is-invalid @enderror" name="academic_year" id="academic_year">
            <option value="">- Select Academic Year -</option>
            @foreach($academicYear as $a)
            <option value="{{ $a->id }}" @if (($date >= $a->from_academic_year) && ($date <= $a->to_academic_year)) selected @endif
  >({{ $a->from_academic_year }}) - ({{ $a->to_academic_year }})</option>
            @endforeach
          </select>
        </div>
      </div>
    </div>
    <div class="card-body">
      <div class="table-responsive">
        <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
          <thead>
            <tr>
              <th>Sr. No.</th>
              <th>BT Card No.</th>
              <th>Name</th>
              <th>Class</th>
              <th>Department</th>
              <th>Session</th>
              <th>Action</th>
            </tr>
          </thead>
          <tfoot>
            <tr>
              <th>Sr. No.</th>
              <th>BT Card No.</th>
              <th>Name</th>
              <th>Class</th>
              <th>Department</th>
              <th>Session</th>
              <th>Action</th>
            </tr>
          </tfoot>
          <tbody id="student_bt">
          @foreach($studentBT as $key => $s)
            <tr>
              <td>{{ ++$key }}</td>
              <td>{{ $s->BT_no }}</td>
              <td>{{ $s->name }}</td>
              <td>
              <?php
                $course = DB::table('courses')->where('id', $s->class)->first();
              ?>
              @if(isset($course) && !empty($course)){{ $course->course_name }}@endif</td>
              <td>
              <?php
                $department = DB::table('departments')->where('id', $s->department)->first();
              ?>
              @if(isset($department) && !empty($department)) {{ $department->department }} @endif</td>
              <td>
              <?php
                 $session = DB::table('academic_years')->where('id', $s->session)->first();
              ?>
              @if(isset($session) && !empty($session))
              ({{ $session->from_academic_year }}) - ({{ $session->to_academic_year }})
              @endif
              </td>
              <td>
                <a href="{{ route('admin.student-bt-card.edit', $s->id) }}" class="btn btn-warning btn-circle">
                  <i class="fas fa-edit"></i>
                </a>
                <a href="javascript:void(0)" onclick="$(this).parent().find('form').submit()" class="btn btn-danger btn-circle">
                  <i class="fas fa-trash"></i>
                </a>
                <form action="{{ route('admin.student-bt-card.destroy', $s->id) }}" method="post">
                  @method('DELETE')
                  <input type="hidden" name="_token" value="{{ csrf_token() }}">
                </form>
              </td>
            </tr>
          @endforeach
          </tbody>
        </table>
      </div>
    </div>
  </div>
</div>
<!-- /.container-fluid -->
@endsection
@section('customjs')

<script>
  // $(document).ready(function () {
  //   // keyup function looks at the keys typed on the search box
  //   $('#academic_year').on('change',function() {
  //       // the text typed in the input field is assigned to a variable 
  //       var query = $(this).val();
        
  //       $.ajax({
  //           // assign a controller function to perform search action - route name is search
  //           url:"{{ route('admin.studentBTRecord') }}",
  //           // since we are getting data methos is assigned as GET
  //           type:"GET",
  //           // data are sent the server
  //           data:{'academic_year':query},
  //           // if search is succcessfully done, this callback function is called
  //           success:function (data) {
  //               // print the search results in the div called country_list(id)
  //               $('#student_bt').append(data);
  //           }
  //       })

  //   });
  // });
  </script>
<!-- Page level plugins -->
<script src="{{ asset('adminAsset/vendor/datatables/jquery.dataTables.min.js') }}"></script>
<script src="{{ asset('adminAsset/vendor/datatables/dataTables.bootstrap4.min.js') }}"></script>

<!-- Page level custom scripts -->
<script src="{{ asset('adminAsset/js/demo/datatables-demo.js') }}"></script>
<script>
$(document).ready(function() {
        $('#dataTable').DataTable();
    } );
</script>


@endsection
