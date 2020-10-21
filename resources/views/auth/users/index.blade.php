@extends('auth.authLayouts.main')
@section('title', 'Users')
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
<h1 class="h3 mb-2 text-gray-800">Users</h1>

<!-- DataTales Example -->
<div class="card shadow mb-4">
  <div class="card-header py-3">
    <h6 class="m-0 font-weight-bold text-primary">Users List</h6>
  </div>
  <div class="card-body">
    <div class="table-responsive">
      <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
        <thead>
          <tr>
            <th>Sr. No.</th>
            <th>Name</th>
            <th>Email</th>
            <th>Mobile No.</th>
            <th>Address</th>
            <th>Action</th>
          </tr>
        </thead>
        <tfoot>
          <tr>
          <th>Sr. No.</th>
            <th>Name</th>
            <th>Email</th>
            <th>Mobile No.</th>
            <th>Address</th>
            <th>Action</th>
          </tr>
        </tfoot>
        <tbody>
        @foreach($users as $key => $u)
        @if($u->acc_type == "admin")
          <tr style="display:none"></tr>
          @else
          <tr>
            <td>{{ ++$key }}</td>
            <td>{{ $u->name }}</td>
            <td>{{ $u->email }}</td>
            <td>{{ $u->mobile }}</td>
            <td>{{ $u->address }}</td>
            <td>
            <a href="{{ route('admin.users.edit', $u->id = $u->user_id) }}" class="btn btn-warning btn-circle">
                    <i class="fas fa-edit"></i>
                  </a>
            <a href="javascript:void(0)" onclick="$(this).parent().find('form').submit()" class="btn btn-danger btn-circle">
                    <i class="fas fa-trash"></i>
                  </a>
                  <form action="{{ route('admin.users.destroy', $u->id = $u->user_id) }}" method="post">
                    @method('DELETE')
                    <input type="hidden" name="_token" value="{{ csrf_token() }}">
                  </form>
                  </td>
          </tr>
          @endif
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