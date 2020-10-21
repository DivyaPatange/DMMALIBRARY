@extends('auth.studentBTCard.index')
@section('record')
@foreach($studentBT as $key => $s)
            <tr>
              <td>{{ ++$key }}</td>
              <td>{{ $s->BT_no }}</td>
              <td>{{ $s->name }}</td>
              <td>
              <?php
                $course = DB::table('courses')->where('id', $s->class)->first();
              ?>
              @if(isset($course) && !empty($course)){{ $course->course_name }}@endif</td>
              <td>
              <?php
                $department = DB::table('departments')->where('id', $s->department)->first();
              ?>
              @if(isset($department) && !empty($department)) {{ $department->department }} @endif</td>
              <td>
              <?php
                 $session = DB::table('academic_years')->where('id', $s->session)->first();
              ?>
              @if(isset($session) && !empty($session))
              ({{ $session->from_academic_year }}) - ({{ $session->to_academic_year }})
              @endif
              </td>
              <td>
                <a href="{{ route('admin.student-bt-card.edit', $s->id) }}" class="btn btn-warning btn-circle">
                  <i class="fas fa-edit"></i>
                </a>
                <a href="javascript:void(0)" onclick="$(this).parent().find('form').submit()" class="btn btn-danger btn-circle">
                  <i class="fas fa-trash"></i>
                </a>
                <form action="{{ route('admin.student-bt-card.destroy', $s->id) }}" method="post">
                  @method('DELETE')
                  <input type="hidden" name="_token" value="{{ csrf_token() }}">
                </form>
              </td>
            </tr>
          @endforeach
@endsection