@extends('auth.authLayouts.main')
@section('title', 'Edit Course')
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
    <h1 class="h3 mb-2 text-gray-800">Edit Course</h1>
    <div class="row justify-content-center">
        <div class="col-lg-6">
            <!-- Basic Card Example -->
            <div class="card shadow mb-4">
            <div class="card-header">
          Edit Course
        </div>
                <div class="card-body">
                    <form method="post" action="{{ route('admin.courses.update', $course->id) }}">
                    @csrf 
                    @method('PUT')
                        <div class="form-group ">
                            <label>Course Name</label>
                            <input type="text" class="form-control form-control-user @error('course_name') is-invalid @enderror" name="course_name" id="exampleInputName" placeholder="Course Name" value="{{ $course->course_name }}">
                            @error('course_name')
                                <span class="invalid-feedback" role="alert">
                                    <strong>{{ $message }}</strong>
                                </span>
                            @enderror
                        </div>
                        <div class="form-group ">
                            <label>Course Duration</label>
                            <input type="text" class="form-control form-control-user @error('course_duration') is-invalid @enderror" name="course_duration" id="exampleInputName" placeholder="Course Duration" value="{{ $course->course_duration }}">
                            @error('course_duration')
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
@endsection