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
    <div class="col-lg-6">
      <!-- Basic Card Example -->
      <div class="card shadow mb-4">
        <div class="card-header">
          Edit Journal
        </div>
        <div class="card-body">
            <form method="post" action="{{ route('admin.journals.update', $journal->id) }}" enctype="multipart/form-data">
            @csrf 
            @method('PUT')
            <div class="form-group">
                <select class="form-control form-control-user @error('journal_type') is-invalid @enderror" name="journal_type">
                    <option value="National" {{ ($journal->journal_type == "National") ? 'selected=selected' : '' }}>National</option>
                    <option value="International" {{ ($journal->journal_type == "International") ? 'selected=selected' : '' }}>International</option>
                </select>
                 @error('journal_type')
              <span class="invalid-feedback" role="alert">
                <strong>{{ $message }}</strong>
              </span>
              @enderror
            </div>
            <div class="form-group ">
              <input type="text" class="form-control form-control-user @error('journal_title') is-invalid @enderror" name="journal_title" id="exampleInputName" placeholder="Journal Title" value="{{ $journal->journal_title }}">
              @error('journal_title')
              <span class="invalid-feedback" role="alert">
                <strong>{{ $message }}</strong>
              </span>
              @enderror
            </div>
            <div class="form-group ">
              <input type="file" class="form-control form-control-user @error('file') is-invalid @enderror" name="file" id="exampleInputName">
              @error('file')
              <span class="invalid-feedback" role="alert">
                <strong>{{ $message }}</strong>
              </span>
              @enderror
            </div>
            <div class="form-group ">
            @if($journal->file)
                    <a href="{{ URL::to('/') }}/Pdf/{{$journal->file}}" target="_blank"> Click to view</a>
                  @endif
                  <input type="hidden" name="hidden_image" value="{{$journal->file}}">
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