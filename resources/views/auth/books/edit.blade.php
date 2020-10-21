@extends('auth.authLayouts.main')
@section('title', 'Edit Book')
@section('customcss')
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
          Edit Book
        </div>
        <div class="card-body">
            <form method="post" action="{{ route('admin.books.update', $book->id) }}" enctype="multipart/form-data">
            @csrf 
            @method('PUT')
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group ">
                            <select class="form-control form-control-user @error('category_name') is-invalid @enderror" name="category_name" id="exampleInputName" value="{{ old('category_name') }}">
                                <option value="">- Select Category -</option>
                                @foreach($category as $c)
                                <option value="{{ $c->id }}" {{ ($c->id == $book->cat_id) ? 'selected=selected' : '' }}>{{ $c->category }}</option>
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
                            <input type="text" class="form-control form-control-user @error('book_name') is-invalid @enderror" name="book_name" id="exampleInputName" placeholder="Book Name" value="{{ $book->book_name }}">
                            @error('book_name')
                            <span class="invalid-feedback" role="alert">
                                <strong>{{ $message }}</strong>
                            </span>
                            @enderror
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group ">
                            <input type="text" class="form-control form-control-user @error('author_name') is-invalid @enderror" name="author_name" id="exampleInputName" placeholder="Author Name" value="{{ $book->author_name }}">
                            @error('author_name')
                            <span class="invalid-feedback" role="alert">
                                <strong>{{ $message }}</strong>
                            </span>
                            @enderror
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group ">
                            <input type="file" class="form-control form-control-user @error('book_pdf') is-invalid @enderror" name="book_pdf">
                            @error('book_pdf')
                            <span class="invalid-feedback" role="alert">
                                <strong>{{ $message }}</strong>
                            </span>
                            @enderror
                        </div>
                    </div>
                    <div class="col-md-2">
                    @if($book->book_pdf)
                    <a href="{{ URL::to('/') }}/Pdf/{{$book->book_pdf}}" target="_blank"> Click to view</a>
                  @endif
                  <input type="hidden" name="hidden_image" value="{{$book->book_pdf}}">
                  </div>
                </div>
                <div class="row">
                    <div class="col-12 text-center">
                        <button type="submit" class="btn btn-primary btn-user">
                            Update
                        </button>
                    </div>
                </div>
            </form>
        </div>
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