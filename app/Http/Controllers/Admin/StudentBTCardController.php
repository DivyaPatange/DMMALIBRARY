<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Admin\StudentBT;
use App\Admin\Course;
use App\Admin\Department;
use App\Admin\AcademicYear;
use DB;
use Datatables;

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
        $date = date('Y-m-d');
        foreach($academicYear as $a)
        {
            if (($date >= $a->from_academic_year) && ($date <= $a->to_academic_year))
            {
                $current_session = $a->id;
            }
        }
        if(request()->ajax()) 
        {
            // dd($request->academic);s
            if($request->academic)
            {
                $data = StudentBT::where('session', $request->academic)->get();
            }
            else{
                $data = StudentBT::all();
            }
            return datatables()->of($data)
            ->addColumn('class', function($row){
                return $row->course->course_name;
            })
            ->addColumn('department', function(StudentBT $studentBT){
                return $studentBT->departments->department;
            })
            ->addColumn('book_bank', function(StudentBT $studentBT){
                if($studentBT->book_bank == 1)
                {
                    return "Yes";
                }
                else{
                    return "No";
                }
            })
            ->addColumn('session', function(StudentBT $studentBT){
                return '('.$studentBT->sessions->from_academic_year.') - ('.$studentBT->sessions->to_academic_year.')';
            })
            ->addColumn('action', 'auth.studentBTCard.action')
            ->rawColumns(['class', 'department', 'session', 'action', 'book_bank'])
            ->addIndexColumn()
            ->make(true);
        }
        
        // dd($studentBT);
        return view('auth.studentBTCard.index', compact( 'course', 'department', 'academicYear'));
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
            'BT_no' => 'required|unique:student_b_t_s',
            'name' => 'required',
            'class' => 'required',
            'department' => 'required',
            'session' => 'required',
            'class_year' => 'required',
        ]);
        $id = mt_rand(100000,999999);
        $studentBT = new StudentBT();
        $studentBT->BT_no = $request->BT_no;
        $studentBT->name = $request->name;
        $studentBT->class = $request->class;
        $studentBT->class_year = $request->class_year;
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
            'BT_no' => 'required|unique:student_b_t_s,BT_no,'.$id,
            'name' => 'required',
            'class' => 'required',
            'department' => 'required',
            'session' => 'required',
            'class_year' => 'required',
        ]);
        $studentBT->BT_no = $request->BT_no;
        $studentBT->name = $request->name;
        $studentBT->class_year = $request->class_year;
        $studentBT->class = $request->class;
        $studentBT->department = $request->department;
        $studentBT->session = $request->session;
        if($request->book_bank){
        $studentBT->book_bank = $request->book_bank;
        }
        else{
            $studentBT->book_bank =  0;
        }
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
        if(request()->ajax()) {
            return datatables()->of(StudentBT::all())
            ->addColumn('class', function($row){
                return $row->course->course_name;
            })
            ->addColumn('department', function(StudentBT $studentBT){
                return $studentBT->departments->department;
            })
            ->addColumn('session', function(StudentBT $studentBT){
                return $studentBT->sessions->from_academic_year.' - '.$studentBT->sessions->to_academic_year;
            })
            // ->filter(function ($instance) use ($request) {
            //     if ($request->academic_year) {
            //         $instance->where('session', $request->academic_year);
            //     }
            // })
            ->addColumn('action', 'auth.studentBTCard.action')
            ->rawColumns(['class', 'department', 'session', 'action'])
            
            ->addIndexColumn()
            ->make(true);
        }
    }
}
