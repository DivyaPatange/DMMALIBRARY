@extends('auth.authLayouts.main')
@section('title', 'Edit Book')
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
    <h1 class="h3 mb-2 text-gray-800">Edit Book</h1>
    <div class="row justify-content-center">
        <div class="col-lg-12">
            <!-- Basic Card Example -->
            <div class="card shadow mb-4">
                <div class="card-header">
                    Edit Book
                </div>
                <div class="card-body">
                    <form method="post" action="{{ route('admin.generalBook.update', $generalBook->id) }}">
                    @csrf 
                    @method('PUT')
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group ">
                                    <label>Registration No.</label>
                                    <input type="text" class="form-control form-control-user @error('reg_no') is-invalid @enderror" name="reg_no" id="exampleInputName" placeholder="Enter Registration No." value="{{ $generalBook->reg_no }}">
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
                                    <input type="text" class="form-control form-control-user @error('book_code') is-invalid @enderror" name="book_code" id="exampleInputName" placeholder="Enter Book Code" value="{{ $generalBook->book_code }}">
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
                                    <input type="text" class="form-control form-control-user @error('book_no') is-invalid @enderror" name="book_no" id="exampleInputName" placeholder="Enter Book No." value="{{ $generalBook->book_no }}">
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
                                        <option value="{{ $a->author_name }}" {{ ($a->author_name == $generalBook->author_name) ? 'selected=selected' : '' }}>{{ $a->author_name }}</option>
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
                                    <input type="text" class="form-control form-control-user @error('book_name') is-invalid @enderror" name="book_name" id="exampleInputName" placeholder="Enter Book Name" value="{{ $generalBook->book_name }}">
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
                                    <input type="number" class="form-control form-control-user @error('price') is-invalid @enderror" name="price" id="exampleInputName" placeholder="Enter Book Price" value="{{ $generalBook->price }}">
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
                                        <option value="{{ $p->publication_name }}" {{ ($p->publication_name == $generalBook->publication) ? 'selected=selected' : '' }}>{{ $p->publication_name }}</option>
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
                                    <input type="number" class="form-control form-control-user @error('no_of_pages') is-invalid @enderror" name="no_of_pages" id="exampleInputName" placeholder="Enter Book Pages" value="{{ $generalBook->no_of_pages }}">
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
                                        <option value="{{ $s->seller_name }}" {{ ($s->seller_name==$generalBook->seller) ? 'selected=selected' : '' }}>{{ $s->seller_name }}</option>
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
                                    <input type="text" class="form-control form-control-user @error('bill_no') is-invalid @enderror" name="bill_no" id="exampleInputName" placeholder="Bill No." value="{{ $generalBook->book_no }}">
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
                                    <input type="date" class="form-control form-control-user @error('bill_date') is-invalid @enderror" name="bill_date" id="exampleInputName" placeholder="Bill Date" value="{{ $generalBook->bill_date }}">
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
                                        <option value="{{ $r->rack_no }}" {{ ($r->rack_no == $generalBook->rack_no) ? 'selected=selected' : '' }}>{{ $r->rack_no }}</option>
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
                                    <input type="text" class="form-control form-control-user @error('receipt_no') is-invalid @enderror" name="receipt_no" id="exampleInputName" placeholder="Receipt No." value="{{ $generalBook->receipt_no }}">
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
                                    <input type="date" class="form-control form-control-user @error('receipt_date') is-invalid @enderror" name="receipt_date" id="exampleInputName" placeholder="Receipt Date" value="{{ $generalBook->receipt_date }}">
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
                                    <input type="text" class="form-control form-control-user @error('scheme') is-invalid @enderror" name="scheme" id="exampleInputName" placeholder="Scheme" value="{{ $generalBook->scheme }}">
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
                                        <option value="Available" {{ ($generalBook->status ==  "Available") ? 'selected=selected' : '' }}>Available</option>
                                        <option value="Not Available" {{ ($generalBook->status ==  "Not Available") ? 'selected=selected' : '' }}>Not Available</option>
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
                                        <option value="{{ $d->department }}" {{ ($generalBook->department == $d->department ) ? 'selected=selected' : '' }}>{{ $d->department }}</option>
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
                                    <input type="text" class="form-control form-control-user @error('medium') is-invalid @enderror" name="medium" id="exampleInputName" placeholder="Medium" value="{{ $generalBook->medium }}">
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
                                    <input type="text" class="form-control form-control-user @error('remark') is-invalid @enderror" name="remark" id="exampleInputName" placeholder="Remark" value="{{ $generalBook->remark }}">
                                    @error('remark')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                    @enderror
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12 text-center">
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
