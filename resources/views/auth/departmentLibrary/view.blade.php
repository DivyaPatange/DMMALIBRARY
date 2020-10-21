@extends('auth.authLayouts.main')
@section('title', 'Department Library')
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
  <h1 class="h3 mb-2 text-gray-800">{{ $department->department }}</h1>
  <div class="row justify-content-center">
    <div class="col-lg-6">
      <!-- Basic Card Example -->
      <div class="card shadow mb-4">
        <div class="card-header">
          Add Book 
        </div>
        <div class="card-body">
          <form method="post" action="{{ route('admin.departmentLibrary.store') }}">
          @csrf 
            
            <div class="form-group ">
              <label>Book Code</label>
              <input type="text" class="form-control form-control-user @error('book_code') is-invalid @enderror" name="book_code" id="book_code" placeholder="Enter Book Code" value="{{ old('book_code') }}">
              @error('book_code')
              <span class="invalid-feedback" role="alert">
                <strong>{{ $message }}</strong>
              </span>
              @enderror
            </div>
            <div class="form-group ">
                <h5 id="book_name"></h5>
            </div>
            <input type="hidden" name="department_id" value="{{ $department->id }}">
            <button type="submit" class="btn btn-primary btn-user btn-block">
              Add
            </button>
          </form>
        </div>
      </div>
    </div>
  </div>
  <!-- DataTales Example -->
  <div class="card shadow mb-4">
    <div class="card-header py-3">
      <h6 class="m-0 font-weight-bold text-primary">{{ $department->department }} Department Books</h6>
    </div>
    <div class="card-body">
      <div class="table-responsive">
        <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
          <thead>
            <tr>
              <th>Sr. No.</th>
              <th>Book No.</th>
              <th>Book Name</th>
              <th>Allocation Date</th>
            </tr>
          </thead>
          <tfoot>
            <tr>
              <th>Sr. No.</th>
              <th>Book No.</th>
              <th>Book Name</th>
              <th>Allocation Date</th>
            </tr>
          </tfoot>
          <tbody>
          @foreach($departmentBook as $key=>$dB)
          <tr>
            <td>{{ ++$key }}</td>
            <td>{{ $dB->book_no }}</td>
            <?php
              $bookName = DB::table('library_books')->where('book_no', $dB->book_no)->first();
            ?>
            <td>@if(isset($bookName) && !empty($bookName)){{ $bookName->book_name }}@endif</td>
            <td>{{ $dB->allocation_date }}</td>
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
<script>
$(document).ready(function () {
    // keyup function looks at the keys typed on the search box
    $('#book_code').on('keyup',function() {
        // the text typed in the input field is assigned to a variable 
        var query = $(this).val();
        // call to an ajax function
        $.ajax({
            // assign a controller function to perform search action - route name is search
            url:"{{ route('admin.searchBookCode') }}",
            // since we are getting data methos is assigned as GET
            type:"GET",
            // data are sent the server
            data:{'book_code':query},
            // if search is succcessfully done, this callback function is called
            success:function (data) {
                // print the search results in the div called country_list(id)
                $('#book_name').html(data);
            }
        })
        // end of ajax call
    });
})
</script>
<script>
   $.ajaxSetup({
  headers: {
    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
  }
});
</script>
@endsection