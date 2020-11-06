@extends('auth.authLayouts.main')
@section('title', 'Department Library')
@section('customcss')

<link href="{{ asset('adminAsset/vendor/datatables/dataTables.bootstrap4.min.css') }}" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
$(document).ready(function(){
  $("#searchButton").click(function(){
    $("#searchForm").toggle();
  });
});
</script>
<style>
#searchForm{
  display:none;
}
</style>
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
  <div class="row">
    <div class="col-md-6">
      <h1 class="h3 mb-2 text-gray-800">{{ $department->department }} Department</h1>
    </div>
    <div class="col-md-6">
      <button class="btn btn-secondary float-md-right float-sm-left" id="searchButton">
        Search Book
      </button>
    </div>
  </div>
  <div id="searchForm">
  <section class="py-5" >
    <div class="row">
      <div class="col-md-3">
        <div class="form-group">
          <select class="form-control form-control-user" id="search_category">
            <option value="">-Select Category-</option>
            <option value="p">Pustak Pedhi</option>
            <option value="g">General Book</option>
          </select>
        </div>
      </div>
      <div class="col-md-3">
        <div class="form-group">
          <div class="input-group">
            <input type="number" class="form-control form-control-user" id="search_book_no" placeholder="Search Book No.">
            <div class="input-group-append">
              <span class="input-group-text" id="book_no_search"><i class="fas fa-search fa-sm"></i></span>
            </div>
          </div>
        </div>
      </div>
      <div class="col-md-3">
        <div class="form-group">
          <div class="input-group">
            <input type="text" class="form-control form-control-user" id="search_book_name" placeholder="Search Book Name">
            <div class="input-group-append">
              <span class="input-group-text" id="book_name_search"><i class="fas fa-search fa-sm"></i></span>
            </div>
          </div>
        </div>
      </div>
      <div class="col-md-3">
        <div class="form-group">
          <div class="input-group">
            <input type="text" class="form-control form-control-user" id="search_author_name" placeholder="Search Author Name">
            <div class="input-group-append">
              <span class="input-group-text" id="author_name_search"><i class="fas fa-search fa-sm"></i></span>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
  <section>
    <div id="bookRecord"></div>
  </section>
  </div>
  <ul class="nav nav-tabs mt-5" id="myTab" role="tablist">
    <li class="nav-item" role="presentation">
      <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">Pustak Pedhi</a>
    </li>
    <li class="nav-item" role="presentation">
      <a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false">General Book</a>
    </li>
  </ul>
  <div class="tab-content" id="myTabContent">
    <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
      <div class="row justify-content-center mt-5">
        <div class="col-lg-6">
          <!-- Basic Card Example -->
          <div class="card shadow mb-4">
            <div class="card-header">
              Add Book 
            </div>
            <div class="card-body">
              <form method="post" action="{{ route('admin.departmentLibrary.store') }}">
              @csrf 
                
                <div class="form-group ">
                  <label>Book Code</label>
                  <input type="text" class="form-control form-control-user @error('book_code') is-invalid @enderror" name="book_code" id="book_code" placeholder="Enter Book Code" value="{{ old('book_code') }}">
                  @error('book_code')
                  <span class="invalid-feedback" role="alert">
                    <strong>{{ $message }}</strong>
                  </span>
                  @enderror
                </div>
                <div class="form-group" id="book_name">
                </div>
                <input type="hidden" name="category" value="p">
                <input type="hidden" name="department_id" value="{{ $department->id }}">
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
          <h6 class="m-0 font-weight-bold text-primary">{{ $department->department }} Department Books</h6>
        </div>
        <div class="card-body">
          <div class="table-responsive">
            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
              <thead>
                <tr>
                  <th>Sr. No.</th>
                  <th>Book No.</th>
                  <th>Book Name</th>
                  <th>Allocation Date</th>
                </tr>
              </thead>
              <tfoot>
                <tr>
                  <th>Sr. No.</th>
                  <th>Book No.</th>
                  <th>Book Name</th>
                  <th>Allocation Date</th>
                </tr>
              </tfoot>
              <tbody>
              @foreach($departmentBook as $key=>$dB)
              <tr>
                <td>{{ ++$key }}</td>
                <td>{{ $dB->book_no }}</td>
                <?php
                  $bookName = DB::table('library_books')->where('book_no', $dB->book_no)->first();
                ?>
                <td>@if(isset($bookName) && !empty($bookName)){{ $bookName->book_name }}@endif</td>
                <td>{{ $dB->allocation_date }}</td>
              </tr>
              @endforeach
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
    <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
    <div class="row justify-content-center mt-5">
        <div class="col-lg-6">
          <!-- Basic Card Example -->
          <div class="card shadow mb-4">
            <div class="card-header">
              Add Book 
            </div>
            <div class="card-body">
              <form method="post" action="{{ route('admin.departmentLibrary.store') }}">
              @csrf 
                
                <div class="form-group ">
                  <label>Book Code</label>
                  <input type="text" class="form-control form-control-user @error('book_code') is-invalid @enderror" name="book_code" id="general_book_code" placeholder="Enter Book Code" value="{{ old('book_code') }}">
                  @error('book_code')
                  <span class="invalid-feedback" role="alert">
                    <strong>{{ $message }}</strong>
                  </span>
                  @enderror
                </div>
                <div class="form-group" id="general_book_name">
                </div>
                <input type="hidden" name="category" value="g">
                <input type="hidden" name="department_id" value="{{ $department->id }}">
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
          <h6 class="m-0 font-weight-bold text-primary">{{ $department->department }} Department Books</h6>
        </div>
        <div class="card-body">
          <div class="table-responsive">
            <table class="table table-bordered" id="dataTable1" width="100%" cellspacing="0">
              <thead>
                <tr>
                  <th>Sr. No.</th>
                  <th>Book No.</th>
                  <th>Book Name</th>
                  <th>Allocation Date</th>
                </tr>
              </thead>
              <tfoot>
                <tr>
                  <th>Sr. No.</th>
                  <th>Book No.</th>
                  <th>Book Name</th>
                  <th>Allocation Date</th>
                </tr>
              </tfoot>
              <tbody>
              @foreach($generalDepartmentBook as $key=>$dB)
              <tr>
                <td>{{ ++$key }}</td>
                <td>{{ $dB->book_no }}</td>
                <?php
                  $bookName = DB::table('student_books')->where('book_no', $dB->book_no)->first();
                ?>
                <td>@if(isset($bookName) && !empty($bookName)){{ $bookName->book_name }}@endif</td>
                <td>{{ $dB->allocation_date }}</td>
              </tr>
              @endforeach
              </tbody>
            </table>
          </div>
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
});
$(document).ready(function() {
  $('#dataTable1').DataTable();
});
</script>
<script>
$(document).ready(function () {
    // keyup function looks at the keys typed on the search box
    $('#book_code').on('keyup',function() {
        // the text typed in the input field is assigned to a variable 
        var query = $(this).val();
        // call to an ajax function
        $.ajax({
            // assign a controller function to perform search action - route name is search
            url:"{{ route('admin.searchBookCode') }}",
            // since we are getting data methos is assigned as GET
            type:"GET",
            // data are sent the server
            data:{'book_code':query},
            // if search is succcessfully done, this callback function is called
            success:function (data) {
                // print the search results in the div called country_list(id)
                $('#book_name').html(data);
            }
        })
        // end of ajax call
    });
})
$(document).ready(function () {
    // keyup function looks at the keys typed on the search box
    $('#general_book_code').on('keyup',function() {
        // the text typed in the input field is assigned to a variable 
        var query = $(this).val();
        // alert(query);
        // call to an ajax function
        $.ajax({
            // assign a controller function to perform search action - route name is search
            url:"{{ route('admin.searchGeneralBookCode') }}",
            // since we are getting data methos is assigned as GET
            type:"GET",
            // data are sent the server
            data:{'general_book_code':query},
            // if search is succcessfully done, this callback function is called
            success:function (data) {
                // print the search results in the div called country_list(id)
                $('#general_book_name').html(data);
            }
        })
        // end of ajax call
    });
})
$(document).ready(function () {
    // keyup function looks at the keys typed on the search box
    $('#book_no_search').on('click',function() {
      // the text typed in the input field is assigned to a variable 
      var query = $("#search_book_no").val();
      var category = $("#search_category").val();
      if(query != ''){
        $.ajax({
          url:"{{ route('admin.searchBookNo') }}",
          method: "GET",
          data:{"search_book_no":query, category:category},
          success:function(data)
          {
            $('#bookRecord').html(data);
          }
        })
      }
    })
});
$(document).ready(function () {
    // keyup function looks at the keys typed on the search box
    $('#book_name_search').on('click',function() {
      // the text typed in the input field is assigned to a variable 
      var query = $("#search_book_name").val();
      var category = $("#search_category").val();
      // alert(category);
      if(query != ''){
        $.ajax({
          url:"{{ route('admin.searchBookName') }}",
          method: "GET",
          data:{"search_book_name":query, category:category},
          success:function(data)
          {
            $('#bookRecord').html(data);
          }
        })
      }
    })
});
$(document).ready(function () {
    // keyup function looks at the keys typed on the search box
    $('#author_name_search').on('click',function() {
      // the text typed in the input field is assigned to a variable 
      var query = $("#search_author_name").val();
      var category = $("#search_category").val();
      if(query != ''){
        $.ajax({
          url:"{{ route('admin.searchAuthorName') }}",
          method: "GET",
          data:{"search_author_name":query, category:category},
          success:function(data)
          {
            $('#bookRecord').html(data);
          }
        })
      }
    })
});
</script>
<script>
   $.ajaxSetup({
  headers: {
    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
  }
});
</script>
@endsection