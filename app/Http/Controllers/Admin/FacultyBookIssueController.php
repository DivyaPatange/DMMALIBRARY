<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Admin\FacultyBookIssue;
use App\Admin\FacultyBookIssueDate;
use App\Admin\FacultyBT;
use App\Admin\LibraryBook;
use App\Admin\AcademicYear;
use App\Admin\StudentBook;
use DB;
use Datatables;

class FacultyBookIssueController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $academicYear = AcademicYear::all();
        if(request()->ajax()) 
        {
            // dd($request->academic);
            if($request->academic)
            {
              
                $data = FacultyBT::where('session', $request->academic)->get();
            }
            else{
                $data = FacultyBT::all();
                // dd($data);
            }
            return datatables()->of($data)
            ->addColumn('action', 'auth.facultyBookIssue.action')
            ->rawColumns(['action'])
            ->addIndexColumn()
            ->make(true);
        }
        return view('auth.facultyBookIssue.index', compact('academicYear'));
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
            'book_code' => 'required',
        ]);
        if($request->category == "p")
        {
            $checkBookAvailability = LibraryBook::where('book_no', $request->book_code)->first();
            $facultyBT = FacultyBT::where('BT_no', $request->BT_no)->first();
                // dd($studentBT);
            $session = AcademicYear::where('id', $facultyBT->session)->first();
            if($checkBookAvailability->book_status == 1)
            {
                
                $date = date('Y/m/d H:i:s');
                if(($date >= $session->from_academic_year) && ($date <= $session->to_academic_year))
                {
                    $increment_date = strtotime("+10 day", strtotime($date));  
                    $expected_date = date("Y-m-d", $increment_date);
                    $issueBook = new FacultyBookIssue();
                    $issueBook->BT_no = $request->BT_no;
                    $issueBook->category = $request->category;
                    $issueBook->book_no = $request->book_code;
                    $issueBook->save();
                    if($issueBook->save())
                    {
                        $issueDate = new FacultyBookIssueDate();
                        $issueDate->faculty_book_issue_id = $issueBook->id;
                        $issueDate->issue_date = $date;
                        $issueDate->expected_return_date = $expected_date;
                        $issueDate->save();
                    }
                    $bookStatus = LibraryBook::where('book_no', $request->book_code)->update(['book_status' => 0]);
                    return redirect()->route('admin.facultyBookIssue.show', $facultyBT->id)->with('success', 'Book Issue Successfully');
                }
                else{
                    return redirect()->route('admin.facultyBookIssue.show', $facultyBT->id)->with('danger', 'BT Card is expired!');
                }

            }
            else{
                return redirect()->route('admin.facultyBookIssue.show', $facultyBT->id)->with('danger', 'Book is not available!');
            }
        }
        else{
            $checkBookAvailability = StudentBook::where('book_no', $request->book_code)->first();
            $facultyBT = FacultyBT::where('BT_no', $request->BT_no)->first();
                // dd($studentBT);
            $session = AcademicYear::where('id', $facultyBT->session)->first();
            if($checkBookAvailability->book_status == 1)
            {
                
                $date = date('Y/m/d H:i:s');
                if(($date >= $session->from_academic_year) && ($date <= $session->to_academic_year))
                {
                    $increment_date = strtotime("+10 day", strtotime($date));  
                    $expected_date = date("Y-m-d", $increment_date);
                    $issueBook = new FacultyBookIssue();
                    $issueBook->BT_no = $request->BT_no;
                    $issueBook->category = $request->category;
                    $issueBook->book_no = $request->book_code;
                    $issueBook->save();
                    if($issueBook->save())
                    {
                        $issueDate = new FacultyBookIssueDate();
                        $issueDate->faculty_book_issue_id = $issueBook->id;
                        $issueDate->issue_date = $date;
                        $issueDate->expected_return_date = $expected_date;
                        $issueDate->save();
                    }
                    $bookStatus = StudentBook::where('book_no', $request->book_code)->update(['book_status' => 0]);
                    return redirect()->route('admin.facultyBookIssue.show', $facultyBT->id)->with('success', 'Book Issue Successfully');
                }
                else{
                    return redirect()->route('admin.facultyBookIssue.show', $facultyBT->id)->with('danger', 'BT Card is expired!');
                }

            }
            else{
                return redirect()->route('admin.facultyBookIssue.show', $facultyBT->id)->with('danger', 'Book is not available!');
            }
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $facultyBT = FacultyBT::findorfail($id);
        $bookIssue = FacultyBookIssue::where('BT_no', $facultyBT->BT_no)->where('category', '=', 'p')->get();
        $generalBookIssue = FacultyBookIssue::where('BT_no', $facultyBT->BT_no)->where('category', '=', 'g')->get();
        $renewBook = FacultyBookIssue::where('BT_no', $facultyBT->BT_no)->where('actual_return_date', '=', NULL)->get();
        // dd($renewBook);
        return view('auth.facultyBookIssue.show', compact('facultyBT','bookIssue', 'renewBook', 'generalBookIssue'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
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
        //
    }


    public function facultyBookIssueSubmit(Request $request)
    {
        $issueBook = FacultyBookIssue::where('id', $request->issueID)->first();
        $lastIssueBookArray = FacultyBookIssueDate::where('faculty_book_issue_id', $issueBook->id)->get();
        foreach($lastIssueBookArray as $l)
        {
            $array[] = $l;
        }
        $lastIssueBook = end($array);
        $book_status = $request->book_status;
        // dd($book_status);
        $foundjquery = "Not found";
        if(in_array('jQuery',$book_status)){
            $foundjquery = "found";
        }
        if($issueBook->category == "p")
        {
            $book = LibraryBook::where('book_no', $issueBook->book_no)->first();
        }
        if($issueBook->category == "g"){
            $book = StudentBook::where('book_no', $issueBook->book_no)->first();
        }
        if(in_array("poor", $book_status))
        {
            $penaltyPoor = (0.5 * $book->price);
        }
        else{
            $penaltyPoor = 0;
        }
        if(in_array("missing", $book_status))
        {
            $penaltyMissing = (1.5 * $book->price);
        }
        else{
            $penaltyMissing = 0;
        }
        if(in_array("good", $book_status))
        {
            $penaltyG = 0;
        }
        else{
            $penaltyG = 0;
        }
        if(in_array("average", $book_status))
        {
            $penaltyA = 0;
        }
        else{
            $penaltyA =0;
        }
        $date1 = $request->return_date; 
        $date2 = $lastIssueBook->expected_return_date;
         
        if($date1 > $date2)
        {
            $diff = strtotime($date2) - strtotime($date1); 
            $days = abs(round($diff / 86400));
            $updatePenaltyDays = DB::table('faculty_book_issue_dates')->where('id', $lastIssueBook->id)->update(['penalty_days' => $days]);
        }
        else{
            $updatePenaltyDays = DB::table('faculty_book_issue_dates')->where('id', $lastIssueBook->id)->update(['penalty_days' => 0]);
        }
        $penaltyArray = FacultyBookIssueDate::where('faculty_book_issue_id', $issueBook->id)->get()->sum('penalty_days');
        // Converting the array to comma separated string
        $book_status = implode(",",$book_status);
        $bookBank = FacultyBookIssue::where('id', $request->issueID)->update([
            'actual_return_date' => $request->return_date,
            'book_condition' => $book_status,
            'penalty' => ($penaltyPoor + $penaltyMissing + $penaltyA + $penaltyG + ($penaltyArray * 3)),
        ]);
        $facultyBookReturn = FacultyBookIssue::where('id', $request->issueID)->first();
        if($facultyBookReturn->actual_return_date)
        {
            if($facultyBookReturn->category == "p")
            {
                $libraryBook = LibraryBook::where('book_no', $facultyBookReturn->book_no)->update(['book_status' => 1]);
            }
            else{
                $libraryBook = StudentBook::where('book_no', $facultyBookReturn->book_no)->update(['book_status' => 1]);
            }
        }
    }

    public function facultyBookRenew(Request $request)
    {
        $issueBook = FacultyBookIssue::where('id', $request->issueID)->first();
        $lastIssueBookArray = FacultyBookIssueDate::where('faculty_book_issue_id', $issueBook->id)->get();
        foreach($lastIssueBookArray as $l)
        {
            $array[] = $l;
        }
        $lastIssueBook = end($array);
        $date = date('Y/m/d H:i:s');
        $increment_date = strtotime("+10 day", strtotime($date));  
        $expected_date = date("Y-m-d", $increment_date);
        $renewBook = new FacultyBookIssueDate();
        $renewBook->faculty_book_issue_id = $issueBook->id;
        $renewBook->issue_date = $date;
        $renewBook->expected_return_date = $expected_date;
        $convertDate = strtotime($date);
        $convertedDate = date("Y-m-d", $convertDate);
        if($convertedDate > $lastIssueBook->expected_return_date)
        {
            $diff = strtotime($convertedDate) - strtotime($lastIssueBook->expected_return_date); 
            $days = abs(round($diff / 86400));
            $book = DB::table('faculty_book_issue_dates')->where('id', $lastIssueBook->id)->update(['penalty_days' => $days]);
        }
        else{
            $book = DB::table('faculty_book_issue_dates')->where('id', $lastIssueBook->id)->update(['penalty_days' => 0]); 
        }
        $renewBook->save();
    }
}
