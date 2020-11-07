@extends('auth.authLayouts.main')
@section('title', 'Search')
@section('customcss')

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<link href="{{ asset('adminAsset/vendor/datatables/dataTables.bootstrap4.min.css') }}" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
$(document).ready(function(){
  $("#searchButton").click(function(){
    $("#searchByMedium").toggle();
    $("#searchByCategory").toggle();
  });
});
</script>
<style>
#searchByMedium{
  display:none;
}
</style>
@endsection
@section('content')
<div class="container-fluid">
  <!-- Page Heading -->
  <div class="row">
    <div class="col-md-6">
      <h1 class="h3 mb-5 text-gray-800">Search</h1>
    </div>
    
  </div>
  <div class="row">
    <div class="col-md-12">
      <button class="btn btn-secondary btn-block" id="searchButton">
       Search Book by Medium  
      </button>
    </div>
  </div>
  <section id="searchByMedium">
    <div class="row">
      <div class="col-md-12">
        <div class="card py-3">
          <div class="card-body">
            <form class="mr-md-3 my-2 my-md-0  navbar-search" id="searchMediumForm">
              <!-- Content Row -->
              <div class="row">
                <div class="col-md-4">
                  <div class="form-group">
                    <select class="form-control" id="searchCategory">
                      <option value="">-Select Category-</option>
                      <option value="p">Pustak Pedhi</option>
                      <option value="g">General Book</option>
                    </select>
                  </div>
                </div>
                <div class="col-md-4">
                  <div class="form-group">
                    <select class="form-control" id="searchMedium">
                      <option value="">-Medium-</option>
                      <option value="English">English</option>
                      <option value="Marathi">Marathi</option>
                      <option value="Hindi">Hindi</option>
                    </select>
                  </div>
                </div>
                <div class="col-md-4 text-center">
                  <button type="submit"  class="btn btn-primary">Search</button>
                </div>
              </div>
            </form>
            <div id="medium-record">
              
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
  <section id="searchByCategory">
  <div class="row mt-5">
    <div class="col-md-12">
      <form class="mr-md-3 my-2 my-md-0  navbar-search" id="searchForm">
        <!-- Content Row -->
        <div class="row">
          <div class="col-md-3">
            <div class="form-group">
              <select class="form-control" id="category">
                <option value="">-Select Category-</option>
                <option value="p">Pustak Pedhi</option>
                <option value="g">General Book</option>
              </select>
            </div>
          </div>
          <div class="col-md-3">
            <div class="form-group">
              <select class="form-control" id="searchBy">
                <option value="">-Search By-</option>
              </select>
            </div>
          </div>
          <div class="col-md-3">
            <input type="text" name="searchName" id="searchFor" class="form-control" placeholder="Search For..">
          </div>
          <div class="col-md-3">
            <button type="submit"  class="btn btn-primary">Search</button>
          </div>
        </div>
      </form>
    </div>
  </div>
  <div id="bookRecord" class="mt-5"></div>
  </section>
</div>

@endsection
@section('customjs')
<!-- Page level plugins -->
<script src="{{ asset('adminAsset/vendor/datatables/jquery.dataTables.min.js') }}"></script>
<script src="{{ asset('adminAsset/vendor/datatables/dataTables.bootstrap4.min.js') }}"></script>

<!-- Page level custom scripts -->
<script src="{{ asset('adminAsset/js/demo/datatables-demo.js') }}"></script>

<script>
$(document).ready(function(){
  $('#category').change(function(){
  if($(this).val() != '')
  {
    var value = $(this).val();
    var _token = $('input[name="_token"]').val();
    $.ajax({
    url:"{{ route('admin.fetch') }}",
    method:"POST",
    data:{value:value, _token:_token},
    success:function(result)
    {
      $('#searchBy').html(result);
    }
    })
  }
})
});
</script>
<script>
$(function () {
  $('#searchForm').on('submit', function (e) {
    e.preventDefault();
    var category = $('#category').val();
    var searchBy = $('#searchBy').val();
    var searchFor = $('#searchFor').val();
    // alert(category);
    $.ajax({
      url:"{{ route('admin.searchBookDetails') }}",
      method:"GET",
      data: {category:category, searchBy:searchBy, searchFor:searchFor},
      success:function(data)
      {
        // console.log(data);
        $('#medium-record').html(data);
      }
    })
  });
});
$(function () {
  $('#searchMediumForm').on('submit', function (e) {
    e.preventDefault();
    var category = $('#searchCategory').val();
    var medium = $('#searchMedium').val();
    // alert(category);
    $.ajax({
      url:"{{ route('admin.searchBookByMedium') }}",
      method:"GET",
      data: {category:category, medium:medium},
      success:function(data)
      {
        // console.log(data);
        $('#medium-record').html(data);
      }
    })
  });
});
$(document).ready( function () {
    $('#dataTable').DataTable();
} );


</script>

@endsection