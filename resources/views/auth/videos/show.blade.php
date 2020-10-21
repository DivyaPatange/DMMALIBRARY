@extends('auth.authLayouts.main')
@section('title', 'Videos')
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
  <h1 class="h3 mb-2 text-gray-800">Videos</h1>
  
  <!-- DataTales Example -->
  <div class="row">
  @foreach($videos as $v)
    <div class="col-md-4">
        <div class="card shadow mb-4">
            <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">{{ $v->title }}</h6>
            </div>
            <div class="card-body">
            <video width="100%" height="180" controls>
                  <source src="{{ URL::asset('Video/' . $v->video) }}" type="video/mp4">
                  <source src="{{ URL::asset('Video/' . $v->video) }}" type="video/ogg">
                  Your browser does not support the video tag.
                </video>
            </div>
        </div>
        </div>
        @endforeach
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