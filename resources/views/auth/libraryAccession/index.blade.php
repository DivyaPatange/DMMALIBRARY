@extends('auth.authLayouts.main')
@section('title', 'Library Accession')
@section('customcss')
<link data-require="sweet-alert@*" data-semver="0.4.2" rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />
  <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
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
    <h1 class="h3 mb-2 text-gray-800">Library Accession</h1>
    <div class="row justify-content-center">
        <div class="col-lg-6">
            <!-- Basic Card Example -->
            <div class="card shadow mb-4">
                <div class="card-header">
                    Add Student Library Accession
                </div>
                <div class="card-body">
                    <form method="post" action="{{ route('admin.libraryAccession.store') }}">
                    @csrf 
                                <div class="form-group ">
                                    <label>BT Card No.</label>
                                    <input type="text" class="form-control form-control-user @error('BT_no') is-invalid @enderror" name="BT_no" id="BT_no" placeholder="Enter BT Card No." value="{{ old('BT_no') }}">
                                    @error('BT_no')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                    @enderror
                                </div>
                                <div class="form-group ">
                                   <h5 id="student_name"></h5>
                                </div>
                                    <div class="form-group ">
                                        <label>.</label>
                                        <input type="datetime-local" class="form-control form-control-user start_time @error('start_time') is-invalid @enderror" name="start_time" id="start_date" placeholder="Start Time" value="{{ old('start_time') }}">
                                        @error('start_time')
                                        <span class="invalid-feedback" role="alert">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                        @enderror
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
        <div class="col-md-6">
          <h6 class="m-0 font-weight-bold text-primary">Library Accession List</h6>
        </div>
        <div class="col-md-6">
          <?php   
          $month = date('m');
          $day = date('d');
          $year = date('Y');

          $today = $year . '-' . $month . '-' . $day;
          // dd($today);
          ?>
          <input type="date" value="{{ $today }}" class="form-control form-control-user @error('accession_date') is-invalid @enderror" name="accession_date" id="accession_date" placeholder="Select Date">
        </div>
      </div>
    </div>
    <div class="card-body">
      <div class="table-responsive">
        <table class="table table-bordered" id="data_table" width="100%" cellspacing="0">
          <thead>
            <tr>
              <th>Sr. No.</th>
              <th>BT Card No.</th>
              <th>Name</th>
              <th>Start Time</th>
              <th>End Time</th>
              <th>Action</th>
            </tr>
          </thead>
          <tfoot>
            <tr>
            <th>Sr. No.</th>
              <th>BT Card No.</th>
              <th>Name</th>
              <th>Start Time</th>
              <th>End Time</th>
              <th>Action</th>
            </tr>
          </tfoot>
          <tbody id="accession_record">
          
          </tbody>
        </table>
      </div>
    </div>
  </div>
</div>
<!-- /.container-fluid -->
@endsection
@section('customjs')
<!-- <script src="{{ asset('adminAsset/js/bootstrap-datetimepicker.js') }}"></script> -->
<!-- <script>
$(function () {
  $(".accession_end_time").datetimepicker({
      format : 'YYYY-MM-DD H:m:s',
      locale : 'en',
  });
});
</script>
<script>
$(function () {
  $('.start_time').datetimepicker({
      format : 'YYYY-MM-DD H:m:s',
      locale : 'en',
  });
});
</script> -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
   $.ajaxSetup({
  headers: {
    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
  }
});
</script>
<script>
$("#accession_record").on("click",".submit",function(){
    let deleteButton = $(this);
    let id = deleteButton.data('id');
    let end_time = $(".end_time").val();
    // alert(end_time);
		$.ajax({
			url: "{{ url('admin/updateLibraryAccessionTime') }}",
			method:"POST",
			data:{id:id, end_time:end_time},
			success:function(data)
			{
        Swal.fire(
          'End Time Mentioned Successfully!',
          )
        setTimeout(() => {
            location.reload();
        }, 1000);

			}
		});
});
</script>
<!-- Page level plugins -->
<script src="{{ asset('adminAsset/vendor/datatables/jquery.dataTables.min.js') }}"></script>
<script src="{{ asset('adminAsset/vendor/datatables/dataTables.bootstrap4.min.js') }}"></script>

<!-- Page level custom scripts -->
<script src="{{ asset('adminAsset/js/demo/datatables-demo.js') }}"></script>

<script type="text/javascript">
$(document).ready(function(){
  fetch_data();
  function fetch_data(academic = '')
  {
    // alert(academic_year = '');
    $('#data_table').DataTable({
    processing: true,
    serverSide: true,
    ajax: {
      url: "{{ route('admin.libraryAccession.index') }}",
      data: {academic:academic}
    },
    columns: [
    { data: 'id', name: 'id' },
    { data: 'BT_no', name: 'BT_no' },
    { data: 'name', name: 'name' },
    { data: 'start_time', name: 'start_time' },
    { data: 'end_time', name: 'end_time' , orderable: false},
    {data: 'action', name: 'action', orderable: false},
    ],
    order: [[0, 'asc']],
    });
  }
  $('#accession_date').change(function(){
  var academic_id = $('#accession_date').val();
//  alert(academic_id);

  $('#data_table').DataTable().destroy();
 
  fetch_data(academic_id);
 });
  
});
</script>
<script>
$(document).ready(function () {
    // keyup function looks at the keys typed on the search box
    $('#BT_no').on('keyup',function() {
        // the text typed in the input field is assigned to a variable 
        var query = $(this).val();
        // call to an ajax function
        $.ajax({
            // assign a controller function to perform search action - route name is search
            url:"{{ route('admin.searchStudentBTCard') }}",
            // since we are getting data methos is assigned as GET
            type:"GET",
            // data are sent the server
            data:{'BT_no':query},
            // if search is succcessfully done, this callback function is called
            success:function (data) {
                // print the search results in the div called country_list(id)
                $('#student_name').html(data);
            }
        })
        // end of ajax call
    });
})
</script>
@endsection
