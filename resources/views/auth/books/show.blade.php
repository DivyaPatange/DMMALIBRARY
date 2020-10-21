@extends('auth.authLayouts.main')
@section('title', 'Books')
@section('customcss')

<link href="{{ asset('adminAsset/vendor/datatables/dataTables.bootstrap4.min.css') }}" rel="stylesheet">
<script>
$(function(){
    $('#download').hide();
});
</script>
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
  <h1 class="h3 mb-2 text-gray-800">Books</h1>
  
  <!-- DataTales Example -->
  <div class="card shadow mb-4">
    <div class="card-header py-3">
      <h6 class="m-0 font-weight-bold text-primary">Book List</h6>
    </div>
    <div class="card-body">
      <div class="table-responsive">
        <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
          <thead>
            <tr>
              <th>Sr. No.</th>
              <th>Category Name</th>
              <th>Book Name</th>
              <th>Author Name</th>
              <th>Book Pdf</th>
            </tr>
          </thead>
          <tfoot>
            <tr>
              <th>Sr. No.</th>
              <th>Category Name</th>
              <th>Book Name</th>
              <th>Author Name</th>
              <th>Book Pdf</th>
            </tr>
          </tfoot>
          <tbody>
          @foreach($books as $key => $b)
          <?php
            $categoryName = DB::table('categories')->where('id', $b->cat_id)->first();
          ?>
            <tr>
              <td>{{ ++$key }}</td>
              <td>@if($categoryName) {{ $categoryName->category }}  @endif</td>
              <td>{{ $b->book_name }}</td>
              <td>{{ $b->author_name }}</td>
              <td>
              
                <a href="{{ route('book.view', $b->id) }}" id="download" class="btn btn-success btn-circle">
                  <i class="fas fa-file"></i>
                </a>
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