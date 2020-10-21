@extends('auth.authLayouts.main')
@section('title', 'Journals')
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
  <h1 class="h3 mb-2 text-gray-800">Journals</h1>
  <div class="row justify-content-center">
    <div class="col-lg-6">
      <!-- Basic Card Example -->
      <div class="card shadow mb-4">
        <div class="card-header">
          Add Journal
        </div>
        <div class="card-body">
          <form method="post" action="{{ route('admin.journals.store') }}" enctype="multipart/form-data">
          @csrf 
            <div class="form-group">
                <select class="form-control form-control-user @error('journal_type') is-invalid @enderror" name="journal_type">
                    <option value="">-Select Journal Type-</option>
                    <option value="National">National</option>
                    <option value="International">International</option>
                </select>
                 @error('journal_type')
              <span class="invalid-feedback" role="alert">
                <strong>{{ $message }}</strong>
              </span>
              @enderror
            </div>
            <div class="form-group ">
              <input type="text" class="form-control form-control-user @error('journal_title') is-invalid @enderror" name="journal_title" id="exampleInputName" placeholder="Journal Title" value="{{ old('journal_title') }}">
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
      <h6 class="m-0 font-weight-bold text-primary">Journals List</h6>
    </div>
    <div class="card-body">
      <div class="table-responsive">
        <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
          <thead>
            <tr>
              <th>Sr. No.</th>
              <th>Journal Type</th>
              <th>Journal Title</th>
              <th>File</th>
              <th>Action</th>
            </tr>
          </thead>
          <tfoot>
            <tr>
              <th>Sr. No.</th>
              <th>Journal Type</th>
              <th>Journal Title</th>
              <th>File</th>
              <th>Action</th>
            </tr>
          </tfoot>
          <tbody>
          @foreach($journals as $key => $j)
            <tr>
              <td>{{ ++$key }}</td>
              <td>{{ $j->journal_type }}</td>
              <td>{{ $j->journal_title }}</td>
              <td>
              <a href="{{ URL::to('/') }}/Pdf/{{$j->file}}" target="_blank" class="btn btn-success btn-circle">
                  <i class="fas fa-file"></i>
                </a>
              </td>
              <td>
                <a href="{{ route('admin.journals.edit', $j->id) }}" class="btn btn-warning btn-circle">
                  <i class="fas fa-edit"></i>
                </a>
                <a href="javascript:void(0)" onclick="$(this).parent().find('form').submit()" class="btn btn-danger btn-circle">
                  <i class="fas fa-trash"></i>
                </a>
                <form action="{{ route('admin.journals.destroy', $j->id) }}" method="post">
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