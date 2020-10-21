@extends('auth.authLayouts.main')
@section('title', 'Edit Video')
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
    <div class="col-lg-6">
      <!-- Basic Card Example -->
      <div class="card shadow mb-4">
        <div class="card-header">
          Edit Video
        </div>
        <div class="card-body">
            <form method="post" action="{{ route('admin.videos.update', $video->id) }}" enctype="multipart/form-data">
            @csrf 
            @method('PUT')
            <div class="form-group ">
              <input type="text" class="form-control form-control-user @error('title') is-invalid @enderror" name="title" id="exampleInputName" placeholder="Title" value="{{ $video->title }}">
              @error('title')
              <span class="invalid-feedback" role="alert">
                <strong>{{ $message }}</strong>
              </span>
              @enderror
            </div>
            <div class="form-group ">
              <input type="file" class="form-control form-control-user @error('video') is-invalid @enderror" name="video" id="exampleInputName">
              @error('video')
              <span class="invalid-feedback" role="alert">
                <strong>{{ $message }}</strong>
              </span>
              @enderror
            </div>
            <div class="form-group ">
            @if($video->video)
                    <a href="{{ URL::to('/') }}/Video/{{$video->video}}" target="_blank"> Click to view</a>
                  @endif
                  <input type="hidden" name="hidden_image" value="{{$video->video}}">
                  </div>
            <button type="submit" class="btn btn-primary btn-user btn-block">
              Update
            </button>
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