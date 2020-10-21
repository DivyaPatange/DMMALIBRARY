@extends('auth.authLayouts.main')
@section('title', 'Edit Faculty BT Card')
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
    <h1 class="h3 mb-2 text-gray-800">Edit Faculty BT Card</h1>
    <div class="row justify-content-center">
        <div class="col-lg-12">
            <!-- Basic Card Example -->
            <div class="card shadow mb-4">
                <div class="card-header">
                    Edit Faculty BT Card
                </div>
                <div class="card-body">
                    <form method="post" action="{{ route('admin.faculty-bt-card.update', $facultyBT->id) }}">
                    @csrf 
                    @method('PUT')
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group ">
                                    <label>Name</label>
                                    <input type="text" class="form-control form-control-user @error('name') is-invalid @enderror" name="name" id="exampleInputName" placeholder="Enter Name" value="{{ $facultyBT->name }}">
                                    @error('name')
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
                                        <option value="{{ $a->id }}" {{ ($a->id == $facultyBT->session) ? 'selected=selected' : '' }}>({{ $a->from_academic_year }}) - ({{ $a->to_academic_year }})</option>
                                        @endforeach
                                    </select>
                                    @error('session')
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
