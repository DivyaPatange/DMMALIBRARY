@extends('auth.authLayouts.main')
@section('title', 'Edit Journal')
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
  <div class="row justify-content-center">
    <div class="col-lg-12">
      <!-- Basic Card Example -->
      <div class="card shadow mb-4">
        <div class="card-header">
          Edit Journal
        </div>
        <div class="card-body">
          <form method="post" action="{{ route('admin.journal.update', $journal->id) }}" enctype="multipart/form-data">
          @csrf 
          @method('PUT')
            <div class="row">
              <div class="col-md-6">
                <div class="form-group">
                  <label>Registration No.</label>
                  <input type="text" class="form-control form-control-user @error('registration_no') is-invalid @enderror" name="registration_no" id="exampleInputName" placeholder="Registration No." value="{{ $journal->registration_no }}">
                  @error('registration_no')
                  <span class="invalid-feedback" role="alert">
                    <strong>{{ $message }}</strong>
                  </span>
                  @enderror
                </div>
              </div>
              <div class="col-md-6">
                <div class="form-group ">
                  <label>Author Name</label>
                  <input type="text" class="form-control form-control-user @error('author_name') is-invalid @enderror" name="author_name" id="exampleInputName" placeholder="Author Name" value="{{ $journal->author_name }}">
                  @error('author_name')
                  <span class="invalid-feedback" role="alert">
                    <strong>{{ $message }}</strong>
                  </span>
                  @enderror
                </div>
              </div>
              <div class="col-md-6">
                <div class="form-group ">
                  <label>Name</label>
                  <input type="text" class="form-control form-control-user @error('name') is-invalid @enderror" name="name" id="exampleInputName" placeholder="Enter Name" value="{{ $journal->name }}">
                  @error('name')
                  <span class="invalid-feedback" role="alert">
                    <strong>{{ $message }}</strong>
                  </span>
                  @enderror
                </div>
              </div>
              <div class="col-md-6">
                <div class="form-group ">
                  <label>Publisher</label>
                  <input type="text" class="form-control form-control-user @error('publisher') is-invalid @enderror" name="publisher" id="exampleInputName" placeholder="Enter Publisher" value="{{ $journal->publisher }}">
                  @error('publisher')
                  <span class="invalid-feedback" role="alert">
                    <strong>{{ $message }}</strong>
                  </span>
                  @enderror
                </div>
              </div>
              <div class="col-md-4">
                <div class="form-group ">
                  <label>Price</label>
                  <input type="number" class="form-control form-control-user @error('price') is-invalid @enderror" name="publisher" id="exampleInputName" placeholder="Enter Price" value="{{ $journal->price }}">
                  @error('price')
                  <span class="invalid-feedback" role="alert">
                    <strong>{{ $message }}</strong>
                  </span>
                  @enderror
                </div>
              </div>
              <div class="col-md-4">
                <div class="form-group ">
                  <label>Pages</label>
                  <input type="number" class="form-control form-control-user @error('pages') is-invalid @enderror" name="pages" id="exampleInputName" placeholder="Enter Pages" value="{{ $journal->pages }}">
                  @error('pages')
                  <span class="invalid-feedback" role="alert">
                    <strong>{{ $message }}</strong>
                  </span>
                  @enderror
                </div>
              </div>
              <div class="col-md-4">
                <div class="form-group ">
                  <label>Bill No.</label>
                  <input type="text" class="form-control form-control-user @error('bill_no') is-invalid @enderror" name="bill_no" id="exampleInputName" placeholder="Enter Bill No." value="{{ $journal->bill_no }}">
                  @error('bill_no')
                  <span class="invalid-feedback" role="alert">
                    <strong>{{ $message }}</strong>
                  </span>
                  @enderror
                </div>
              </div>
              <div class="col-md-6">
                <div class="form-group ">
                  <label>Seller</label>
                  <input type="text" class="form-control form-control-user @error('seller') is-invalid @enderror" name="seller" id="exampleInputName" placeholder="Enter Seller" value="{{ $journal->seller }}">
                  @error('seller')
                  <span class="invalid-feedback" role="alert">
                    <strong>{{ $message }}</strong>
                  </span>
                  @enderror
                </div>
              </div>
              <div class="col-md-6">
                <div class="form-group ">
                  <label>Date</label>
                  <input type="date" class="form-control form-control-user @error('date') is-invalid @enderror" name="date" id="exampleInputName" placeholder="Enter Date" value="{{ $journal->date }}">
                  @error('date')
                  <span class="invalid-feedback" role="alert">
                    <strong>{{ $message }}</strong>
                  </span>
                  @enderror
                </div>
              </div>
            </div>
            <div class="row">
              <div class="col-md-12">
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
@endsection