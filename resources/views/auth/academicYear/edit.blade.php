@extends('auth.authLayouts.main')
@section('title', 'Edit Academic Year')
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
    <h1 class="h3 mb-2 text-gray-800">Edit Academic Year</h1>
    <div class="row justify-content-center">
        <div class="col-lg-6">
            <!-- Basic Card Example -->
            <div class="card shadow mb-4">
            <div class="card-header">
          Edit Academic Year
        </div>
                <div class="card-body">
                    <form method="post" action="{{ route('admin.academic-year.update', $academicYear->id) }}">
                    @csrf 
                    @method('PUT')
                        <div class="form-group ">
                            <label>From Academic Year</label>
                            <input type="date" class="form-control form-control-user @error('from_academic_year') is-invalid @enderror" name="from_academic_year" id="exampleInputName" placeholder="From Academic Year" value="{{ $academicYear->from_academic_year }}">
                            @error('from_academic_year')
                                <span class="invalid-feedback" role="alert">
                                    <strong>{{ $message }}</strong>
                                </span>
                            @enderror
                        </div>
                        <div class="form-group ">
                            <label>To Academic Year</label>
                            <input type="date" class="form-control form-control-user @error('to_academic_year') is-invalid @enderror" name="to_academic_year" id="exampleInputName" placeholder="To Academic Year" value="{{ $academicYear->to_academic_year }}">
                            @error('to_academic_year')
                                <span class="invalid-feedback" role="alert">
                                    <strong>{{ $message }}</strong>
                                </span>
                            @enderror
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
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<!-- <script src="http://code.jquery.com/ui/1.11.0/jquery-ui.js"></script> -->
<script>
$('.form-control').datepicker({
    format: 'yyyy-mm-dd'
 });
</script>
@endsection