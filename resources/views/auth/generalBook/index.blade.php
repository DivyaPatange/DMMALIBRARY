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
    <button type="button" data-toggle="modal" data-target="#studentBook" class="btn btn-primary mt-3 mb-3">
       Import CSV File
    </button>
    <button type="button" data-toggle="modal" data-target="#addJournal" class="btn btn-primary mt-3 mb-3">
       Add Book
    </button>
    </div>
  </div>

 <!-- The Modal -->
 <div class="modal" id="studentBook">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">Upload CSV File</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>
    <form action="{{ url('/admin/generalBookFile') }}" enctype="multipart/form-data" method="POST">
    @csrf
      <!-- Modal body -->
      <div class="modal-body">
      <div class="form-group">
      <input type="file" class="form-control form-control-user @error('file') is-invalid @enderror" name="file" id="exampleInputName" >
        </div>
      @error('file')
                            <span class="invalid-feedback" role="alert">
                                <strong>{{ $message }}</strong>
                            </span>
                            @enderror
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
      <input type="submit" class="btn btn-success" name="submit" value="Save">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
      </div>
    </form>
    </div>
  </div>
</div>

 <!-- The Modal -->
 <div class="modal" id="addJournal">
  <div class="modal-dialog">
    <div class="modal-content">
      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">Add Book</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>
      <form action="{{ route('admin.generalBook.store') }}" enctype="multipart/form-data" method="POST">
      @csrf
        <!-- Modal body -->
        <div class="modal-body">
        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group ">
                                    <label>Registration No.</label>
                                    <input type="text" class="form-control form-control-user @error('reg_no') is-invalid @enderror" name="reg_no" id="exampleInputName" placeholder="Enter Registration No." value="{{ old('reg_no') }}">
                                    @error('reg_no')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                    @enderror
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group ">
                                    <label>Book Code</label>
                                    <input type="text" class="form-control form-control-user @error('book_code') is-invalid @enderror" name="book_code" id="exampleInputName" placeholder="Enter Book Code" value="{{ old('book_code') }}">
                                    @error('book_code')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                    @enderror
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group ">
                                    <label>Book No.</label>
                                    <input type="text" class="form-control form-control-user @error('book_no') is-invalid @enderror" name="book_no" id="exampleInputName" placeholder="Enter Book No." value="{{ old('book_no') }}">
                                    @error('book_no')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                    @enderror
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group ">
                                    <label>Author</label>
                                    <select class="form-control form-control-user @error('author_name') is-invalid @enderror" name="author_name" id="exampleInputName">
                                        <option value="">- Select Author Name -</option>
                                        @foreach($author as $a)
                                        <option value="{{ $a->author_name }}">{{ $a->author_name }}</option>
                                        @endforeach
                                    </select>
                                    @error('author_name')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                    @enderror
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group ">
                                    <label>Book Name</label>
                                    <input type="text" class="form-control form-control-user @error('book_name') is-invalid @enderror" name="book_name" id="exampleInputName" placeholder="Enter Book Name" value="{{ old('book_name') }}">
                                    @error('book_name')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                    @enderror
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group ">
                                    <label>Price</label>
                                    <input type="number" class="form-control form-control-user @error('price') is-invalid @enderror" name="price" id="exampleInputName" placeholder="Enter Book Price" value="{{ old('price') }}">
                                    @error('price')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                    @enderror
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group ">
                                    <label>Publication</label>
                                    <select class="form-control form-control-user @error('publication') is-invalid @enderror" name="publication" id="exampleInputName">
                                        <option value="">- Select Publication -</option>
                                        @foreach($publication as $p)
                                        <option value="{{ $p->publication_name }}">{{ $p->publication_name }}</option>
                                        @endforeach
                                    </select>
                                    @error('publication')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                    @enderror
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group ">
                                    <label>No. of Pages</label>
                                    <input type="number" class="form-control form-control-user @error('no_of_pages') is-invalid @enderror" name="no_of_pages" id="exampleInputName" placeholder="Enter Book Pages" value="{{ old('no_of_pages') }}">
                                    @error('no_of_pages')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                    @enderror
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group ">
                                    <label>Seller</label>
                                    <select class="form-control form-control-user @error('seller') is-invalid @enderror" name="seller" id="exampleInputName">
                                        <option value="">- Select Seller -</option>
                                        @foreach($seller as $s)
                                        <option value="{{ $s->seller_name }}">{{ $s->seller_name }}</option>
                                        @endforeach
                                    </select>
                                    @error('seller')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                    @enderror
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group ">
                                    <label>Bill No.</label>
                                    <input type="text" class="form-control form-control-user @error('bill_no') is-invalid @enderror" name="bill_no" id="exampleInputName" placeholder="Bill No." value="{{ old('bill_no') }}">
                                    @error('bill_no')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                    @enderror
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group ">
                                    <label>Bill Date</label>
                                    <input type="date" class="form-control form-control-user @error('bill_date') is-invalid @enderror" name="bill_date" id="exampleInputName" placeholder="Bill Date" value="{{ old('bill_date') }}">
                                    @error('bill_date')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                    @enderror
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group ">
                                    <label>Rack No.</label>
                                    <select class="form-control form-control-user @error('rack_no') is-invalid @enderror" name="rack_no" id="exampleInputName">
                                        <option value="">- Select Rack No. -</option>
                                        @foreach($rackWing as $r)
                                        <option value="{{ $r->rack_no }}">{{ $r->rack_no }}</option>
                                        @endforeach
                                    </select>
                                    @error('rack_no')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                    @enderror
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group ">
                                    <label>Receipt No.</label>
                                    <input type="text" class="form-control form-control-user @error('receipt_no') is-invalid @enderror" name="receipt_no" id="exampleInputName" placeholder="Receipt No." value="{{ old('receipt_no') }}">
                                    @error('receipt_no')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                    @enderror
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group ">
                                    <label>Receipt Date</label>
                                    <input type="date" class="form-control form-control-user @error('receipt_date') is-invalid @enderror" name="receipt_date" id="exampleInputName" placeholder="Receipt Date" value="{{ old('receipt_date') }}">
                                    @error('receipt_date')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                    @enderror
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group ">
                                    <label>Scheme</label>
                                    <input type="text" class="form-control form-control-user @error('scheme') is-invalid @enderror" name="scheme" id="exampleInputName" placeholder="Scheme" value="{{ old('scheme') }}">
                                    @error('scheme')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                    @enderror
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group ">
                                    <label>Status</label>
                                    <select class="form-control form-control-user @error('status') is-invalid @enderror" name="status" id="exampleInputName">
                                        <option value="">- Select Status -</option>
                                        <option value="Available">Available</option>
                                        <option value="Not Available">Not Available</option>
                                    </select>
                                    @error('status')
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
                                        <option value="{{ $d->department }}">{{ $d->department }}</option>
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
                                    <label>Medium</label>
                                    <input type="text" class="form-control form-control-user @error('medium') is-invalid @enderror" name="medium" id="exampleInputName" placeholder="Medium" value="{{ old('medium') }}">
                                    @error('medium')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                    @enderror
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="form-group ">
                                    <label>Remark</label>
                                    <input type="text" class="form-control form-control-user @error('remark') is-invalid @enderror" name="remark" id="exampleInputName" placeholder="Remark" value="{{ old('remark') }}">
                                    @error('remark')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                    @enderror
                                </div>
                            </div>
                        </div>
        </div>
        <!-- Modal footer -->
        <div class="modal-footer">
          <input type="submit" class="btn btn-success" name="submit" value="Save">
          <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
        </div>
      </form>
    </div>
  </div>
</div>
  <!-- DataTales Example -->
  <div class="card shadow mb-4">
    <div class="card-header py-3">
      <h6 class="m-0 font-weight-bold text-primary">General Book List</h6>
    </div>
    <div class="card-body">
      <div class="table-responsive">
        <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
          <thead>
            <tr>
              <th>Reg. No.</th>
              <th>Book Code</th>
              <th>Book No.</th>
              <th>Author</th>
              <th>Book Name</th>
              <th>Price</th>
              <th>Publication</th>
              <th>No. of Pages</th>
              <th>Seller</th>
              <th>Bill No.</th>
              <th>Bill Date</th>
              <th>Rack No.</th>
              <th>Receipt No.</th>
              <th>Receipt Date</th>
              <th>Scheme</th>
              <th>Status</th>
              <th>Department</th>
              <th>Medium</th>
              <th>Remark</th>
              <th>Action</th>
            </tr>
          </thead>
          <tfoot>
            <tr>
            <th>Reg. No.</th>
              <th>Book Code</th>
              <th>Book No.</th>
              <th>Author</th>
              <th>Book Name</th>
              <th>Price</th>
              <th>Publication</th>
              <th>No. of Pages</th>
              <th>Seller</th>
              <th>Bill No.</th>
              <th>Bill Date</th>
              <th>Rack No.</th>
              <th>Receipt No.</th>
              <th>Receipt Date</th>
              <th>Scheme</th>
              <th>Status</th>
              <th>Department</th>
              <th>Medium</th>
              <th>Remark</th>
              <th>Action</th>
            </tr>
          </tfoot>
          <tbody>
            @foreach($generalBook as $key => $l)
            <tr>
                <td>{{ ++$key }}</td>
                <td>{{ $l->book_code }}</td>
                <td>{{ $l->book_no }}</td>
                <td>{{ $l->author_name }}</td>
                <td>{{ $l->book_name }}</td>
                <td>{{ $l->price }}</td>
                <td>{{ $l->publication }}</td>
                <td>{{ $l->no_of_pages }}</td>
                <td>{{ $l->seller }}</td>
                <td>{{ $l->bill_no }}</td>
                <td>{{ $l->bill_date }}</td>
                <td>{{ $l->rack_no }}</td>
                <td>{{ $l->receipt_no }}</td>
                <td>{{ $l->receipt_date }}</td>
                <td>{{ $l->scheme }}</td>
                <td>{{ $l->status }}</td>
                <td>{{ $l->department }}</td>
                <td>{{ $l->medium }}</td>
                <td>{{ $l->remark }}</td>
                <td>
                <a href="{{ route('admin.generalBook.edit', $l->id) }}" class="btn btn-warning btn-circle">
                  <i class="fas fa-edit"></i>
                </a>
                <a href="javascript:void(0)" onclick="$(this).parent().find('form').submit()" class="btn btn-danger btn-circle">
                  <i class="fas fa-trash"></i>
                </a>
                <form action="{{ route('admin.generalBook.destroy', $l->id) }}" method="post">
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