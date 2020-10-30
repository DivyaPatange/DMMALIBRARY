@extends('auth.authLayouts.main')
@section('title', 'Book Bank')
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
  <h1 class="h3 mb-2 text-gray-800">Book Bank Student List</h1>
  <!-- DataTales Example -->
  <div class="card shadow mb-4">
    <div class="card-header py-3">
      <div class="row">
        <div class="col-md-8">
          <h6 class="m-0 font-weight-bold text-primary">Book Bank Student List</h6>
        </div>
        <div class="col-md-4">
        <?php
            $date = date('Y-m-d');
        ?>
          <select class="form-control form-control-user @error('academic_year') is-invalid @enderror" name="academic_year" id="academic_year">
            <option value="">- Select Academic Year -</option>
            @foreach($academicYear as $a)
            <option value="{{ $a->id }}" @if (($date >= $a->from_academic_year) && ($date <= $a->to_academic_year)) selected @endif
  >({{ $a->from_academic_year }}) - ({{ $a->to_academic_year }})</option>
            @endforeach
          </select>
        </div>
      </div>
    </div>
    <div class="card-body">
      <div class="table-responsive">
        <table class="table table-bordered" id="data_table" width="100%" cellspacing="0">
          <thead>
            <tr>
              <th>Sr. No.</th>
              <th>BT Card No.</th>
              <th>Student Name</th>
              <th>Issue Book</th>
            </tr>
          </thead>
          <tfoot>
            <tr>
                <th>Sr. No.</th>
                <th>BT Card No.</th>
                <th>Student Name</th>
                <th>Issue Book</th>
            </tr>
          </tfoot>
          <tbody>
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
$(document).ready(function(){
  fetch_data();
  function fetch_data(academic = '')
  {
    // alert(academic_year = '');
    $('#data_table').DataTable({
    processing: true,
    serverSide: true,
    ajax: {
      url: "{{ route('admin.bookBank.index') }}",
      data: {academic:academic}
    },
    columns: [
    { data: 'id', name: 'id' },
    { data: 'BT_no', name: 'BT_no' },
    { data: 'name', name: 'name' },
    {data: 'action', name: 'action', orderable: false},
    ],
    order: [[0, 'asc']],
    });
  }
  $('#academic_year').change(function(){
  var academic_id = $('#academic_year').val();
//  alert(academic_id);

  $('#data_table').DataTable().destroy();
 
  fetch_data(academic_id);
 });
  
});
</script>
<script>
  $("#data_table").on("click",".issueBook",function(){
        let deleteButton = $(this);
        let id = deleteButton.data('id');
        window.location.href="/admin/bookBank/"+id;
  });
  </script>
@endsection