@extends('auth.authLayouts.main')
@section('title', 'Computer')
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
  <h1 class="h3 mb-2 text-gray-800">Computer</h1>
  <div class="row justify-content-center">
    <div class="col-lg-6">
      <!-- Basic Card Example -->
      <div class="card shadow mb-4">
        <div class="card-header">
          Add Computer
        </div>
        <div class="card-body">
          <form method="post" action="{{ route('admin.computers.store') }}">
          @csrf 
            <div class="form-group ">
              <label>System No.</label>
              <input type="text" class="form-control form-control-user @error('system_no') is-invalid @enderror" name="system_no" id="exampleInputName" placeholder="System No." value="{{ old('system_no') }}">
              @error('system_no')
              <span class="invalid-feedback" role="alert">
                <strong>{{ $message }}</strong>
              </span>
              @enderror
            </div>
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
      <h6 class="m-0 font-weight-bold text-primary">Computer List</h6>
    </div>
    <div class="card-body">
      <div class="table-responsive">
        <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
          <thead>
            <tr>
              <th>Sr. No.</th>
              <th>System No.</th>
              <th>Action</th>
            </tr>
          </thead>
          <tfoot>
            <tr>
              <th>Sr. No.</th>
              <th>System No.</th>
              <th>Action</th>
            </tr>
          </tfoot>
          <tbody>
          @foreach($computers as $key => $c)
            <tr>
              <td>{{ ++$key }}</td>
              <td>{{ $c->system_no }}</td>
              <td>
                <a href="{{ route('admin.computers.edit', $c->id) }}" class="btn btn-warning btn-circle">
                  <i class="fas fa-edit"></i>
                </a>
                <a href="javascript:void(0)" onclick="$(this).parent().find('form').submit()" class="btn btn-danger btn-circle">
                  <i class="fas fa-trash"></i>
                </a>
                <form action="{{ route('admin.computers.destroy', $c->id) }}" method="post">
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