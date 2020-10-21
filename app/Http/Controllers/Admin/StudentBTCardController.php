<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Admin\StudentBT;
use App\Admin\Course;
use App\Admin\Department;
use App\Admin\AcademicYear;
use DB;
use DataTables;

class StudentBTCardController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $course = Course::all();
        $department = Department::all();
        $academicYear = AcademicYear::all();
        // $date = date('Y-m-d');
        // foreach($academicYear as $a)
        // {
        //     if (($date >= $a->from_academic_year) && ($date <= $a->to_academic_year))
        //     {
        //         $current_session = $a->id;
        //     }
        // }
        // $studentBT = StudentBT::where('session', $current_session)->get();
        $studentBT = StudentBT::all();
        // dd($studentBT);
        return view('auth.studentBTCard.index', compact('studentBT', 'course', 'department', 'academicYear'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required',
            'class' => 'required',
            'department' => 'required',
            'session' => 'required',
        ]);
        $id = mt_rand(100000,999999);
        $studentBT = new StudentBT();
        $studentBT->BT_no = "BTS".$id;
        $studentBT->name = $request->name;
        $studentBT->class = $request->class;
        $studentBT->department = $request->department;
        $studentBT->session = $request->session;
        if($request->book_bank){
        $studentBT->book_bank = $request->book_bank;
        }
        $studentBT->save();
        return redirect('/admin/student-bt-card')->with('success', 'BT Card added successfully!');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $course = Course::all();
        $department = Department::all();
        $academicYear = AcademicYear::all();
        $studentBT = StudentBT::findorfail($id);
        return view('auth.studentBTCard.edit', compact('studentBT', 'course', 'department', 'academicYear'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $studentBT = StudentBT::findorfail($id);
        $request->validate([
            'name' => 'required',
            'class' => 'required',
            'department' => 'required',
            'session' => 'required',
        ]);
        $studentBT->name = $request->name;
        $studentBT->class = $request->class;
        $studentBT->department = $request->department;
        $studentBT->session = $request->session;
        $studentBT->update($request->all());
        return redirect('/admin/student-bt-card')->with('success', 'BT Card updated successfully!');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $studentBT = StudentBT::findorfail($id);
        $studentBT->delete();
        return redirect('/admin/student-bt-card')->with('success', 'BT Card  deleted successfully!');
    }

    public function viewStudentCard($id)
    {
        $studentBT = StudentBT::findorfail($id);
        return view('auth.studentBTCard.view', compact('studentBT'));

    }
    public function studentBTRecord(Request $request)
    {
        if($request->ajax()) 
        {
            // select country name from database
            $academicYear = AcademicYear::where('id', $request->academic_year)
                ->first();
            $data = StudentBT::where('session', $academicYear->id)->get();
            // dd($data);        
        
            // declare an empty array for output
            $output = '';
            if (count($data)>0) {
                // concatenate output to the array
                // loop through the result array
                foreach ($data as $key => $row){
                    $course = DB::table('courses')->where('id', $row->class)->first();
                    $department = DB::table('departments')->where('id', $row->department)->first();
                    $session = DB::table('academic_years')->where('id', $row->session)->first();
                       $output .= '<tr role="row" class="item'.++$key.'">'. 
                       '<td>'.++$key.'</td>'.
                       '<td>'.$row->BT_no.'</td>'. 
                       '<td>'.$row->name.'</td>'.
                       '<td>';
                       if(isset($course) && !empty($course))
                       {
                        $output .=  $course->course_name;
                       }
                       $output .= '</td>'.
                       '<td>';
                       if(isset($department) && !empty($department))
                       {
                        $output .=  $department->department;
                       }
                       $output .= '</td>'.
                       '<td>';
                       if(isset($session) && !empty($session))
                       {
                        $output .=  '('.$session->from_academic_year.')'. ' - ' . '('.$session->to_academic_year.')';
                       }
                       $output .= '</td>'.
                       '<td>'.'<button data-id="'.$row->id.'" class="btn issueBook btn-info btn-circle">
                       <i class="fas fa-edit"></i>
                     </button></td>'.
                       '</tr>';
                    
                }
                // end of output
            }
            
            else {
                // if there's no matching results according to the input
                $output .= 'No results';
            }
            // return output result array
            return $output;
        }
    }
}
