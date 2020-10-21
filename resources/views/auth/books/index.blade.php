@extends('auth.authLayouts.main')
@section('title', 'Books')
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
  <h1 class="h3 mb-2 text-gray-800">Books</h1>
  <div class="row justify-content-center">
    <div class="col-lg-12">
      <!-- Basic Card Example -->
      <div class="card shadow mb-4">
        <div class="card-header">
          Add Book
        </div>
        <div class="card-body">
            <form method="post" action="{{ route('admin.books.store') }}" enctype="multipart/form-data">
            @csrf 
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group ">
                            <select class="form-control form-control-user @error('category_name') is-invalid @enderror" name="category_name" id="exampleInputName" value="{{ old('category_name') }}">
                                <option value="">- Select Category -</option>
                                @foreach($category as $c)
                                <option value="{{ $c->id }}">{{ $c->category }}</option>
                                @endforeach
                            </select>
                            @error('category_name')
                            <span class="invalid-feedback" role="alert">
                                <strong>{{ $message }}</strong>
                            </span>
                            @enderror
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group ">
                            <input type="text" class="form-control form-control-user @error('book_name') is-invalid @enderror" name="book_name" id="exampleInputName" placeholder="Book Name" value="{{ old('book_name') }}">
                            @error('book_name')
                            <span class="invalid-feedback" role="alert">
                                <strong>{{ $message }}</strong>
                            </span>
                            @enderror
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group ">
                            <input type="text" class="form-control form-control-user @error('author_name') is-invalid @enderror" name="author_name" id="exampleInputName" placeholder="Author Name" value="{{ old('author_name') }}">
                            @error('author_name')
                            <span class="invalid-feedback" role="alert">
                                <strong>{{ $message }}</strong>
                            </span>
                            @enderror
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group ">
                            <input type="file" class="form-control form-control-user @error('book_pdf') is-invalid @enderror" name="book_pdf">
                            @error('book_pdf')
                            <span class="invalid-feedback" role="alert">
                                <strong>{{ $message }}</strong>
                            </span>
                            @enderror
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-12 text-center">
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
              <th>Action</th>
            </tr>
          </thead>
          <tfoot>
            <tr>
              <th>Sr. No.</th>
              <th>Category Name</th>
              <th>Book Name</th>
              <th>Author Name</th>
              <th>Book Pdf</th>
              <th>Action</th>
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
                <a href="{{ URL::to('/') }}/Pdf/{{$b->book_pdf}}" target="_blank" class="btn btn-success btn-circle">
                  <i class="fas fa-file"></i>
                </a>
              </td>
              <td>
                <a href="{{ route('admin.books.edit', $b->id) }}" class="btn btn-warning btn-circle">
                  <i class="fas fa-edit"></i>
                </a>
                <a href="javascript:void(0)" onclick="$(this).parent().find('form').submit()" class="btn btn-danger btn-circle">
                  <i class="fas fa-trash"></i>
                </a>
                <form action="{{ route('admin.books.destroy', $b->id) }}" method="post">
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