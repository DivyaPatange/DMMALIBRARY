<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Admin\BookTransaction;
use App\Admin\StudentBT;
use App\Admin\LibraryBook;
use App\Admin\AcademicYear;
use App\Admin\StudentBookIssue;
use App\Admin\StudentBookIssueDate;
use Redirect;
use DB;
use Datatables;

class BookTransactionController extends Controller
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
              
                $data = DB::table('book_transactions')
                ->join('student_b_t_s', 'student_b_t_s.BT_no', '=', 'book_transactions.BT_no')
                ->select('book_transactions.*', 'student_b_t_s.name', 'student_b_t_s.session')->where('student_b_t_s.session', $request->academic)->get();
            }
            else{
                $data = DB::table('book_transactions')
                ->join('student_b_t_s', 'student_b_t_s.BT_no', '=', 'book_transactions.BT_no')
                ->select('book_transactions.*', 'student_b_t_s.name');
                // dd($data);
            }
            return datatables()->of($data)
            ->addColumn('action', 'auth.bookTransaction.action')
            ->rawColumns(['name', 'action'])
            ->addIndexColumn()
            ->make(true);
        }
        return view('auth.bookTransaction.index', compact('academicYear'));
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
            'BT_no' => 'required',
        ]);
        $studentBT = StudentBT::where('BT_no', $request->BT_no)->first();
        $session = AcademicYear::where('id', $studentBT->session)->first();
        $date = date('Y/m/d H:i:s');
        if(($date >= $session->from_academic_year) && ($date <= $session->to_academic_year))
        {
            $bookTransaction = BookTransaction::where('BT_no', $request->BT_no)->first();
            if(empty($bookTransaction)){
            // $increment_date = strtotime("+7 day", strtotime($date));
            // $expected_date = date("Y-m-d", $increment_date);
            $bookTransaction = new BookTransaction();
            $bookTransaction->BT_no = $request->BT_no;
            // $bookTransaction->book_code = $request->book_code;
            // $bookTransaction->issue_date = $date;
            // $bookTransaction->expected_return_date = $expected_date;/
            $bookTransaction->save();
            return redirect('/admin/bookTransaction')->with('success', 'Book Issue Successfully!');
            }
            else{
                return redirect('/admin/bookTransaction')->with('danger', 'BT Card is already registered!');
            }
        }
        else{
            return redirect('/admin/bookTransaction')->with('danger', 'BT Card is Expired!');
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

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }

    public function searchStudentBTCard(Request $request)
    {
        if($request->ajax()) {
            // select country name from database
            $data = StudentBT::where('BT_no', 'LIKE', $request->BT_no.'%')
                ->get();
                
        
            // declare an empty array for output
            $output = '';
            // if searched countries count is larager than zero
            // dd(!(isset($data)) || empty($data));
            if(!(isset($data)) || empty($data))
                {
                    return array("error","Please Enter Valid Referral Code");
                }
            if (count($data)>0) {
                // concatenate output to the array
                // loop through the result array
                foreach ($data as $row){
                    // dd($request->user_referral_info == $row->referral_code);
                    if($request->BT_no == $row->BT_no){
                    // concatenate output to the array
                    // $parentName = User::where('id', $row->parent_id)->first();

                    
                       $output .= $row->name;
                        
                        
                    }
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

    public function searchBookCode(Request $request)
    {
        if($request->ajax()) {
            // select country name from database
            $data = LibraryBook::where('book_no', 'LIKE', $request->book_code.'%')
                ->get();
                
        
            // declare an empty array for output
            $output = '';
            // if searched countries count is larager than zero
            // dd(!(isset($data)) || empty($data));
            if(!(isset($data)) || empty($data))
                {
                    return array("error","Please Enter Valid Referral Code");
                }
            if (count($data)>0) {
                // concatenate output to the array
                // loop through the result array
                foreach ($data as $row){
                    // dd($request->user_referral_info == $row->referral_code);
                    if($request->book_code == $row->book_no){
                    // concatenate output to the array
                    // $parentName = User::where('id', $row->parent_id)->first();

                    
                       $output .= $row->book_name;
                        
                        
                    }
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

    public function studentBookIssueForm($id)
    {
        $BT_no = BookTransaction::findorfail($id);
        $issueBook = StudentBookIssue::where('bookTransaction_id', $id)->get();
        // dd($issueBook);
        return view('auth.bookTransaction.studentBookIssueForm', compact('BT_no', 'issueBook'));
    }

    public function studentBookIssueFormSubmit(Request $request)
    {
        $request->validate([
            'book_code' => 'required',
        ]);
            $checkBookAvailability = LibraryBook::where('book_no', $request->book_code)->first();
            if($checkBookAvailability->book_status == 1)
            {
                $studentBT = StudentBT::where('BT_no', $request->BT_no)->first();
                $session = AcademicYear::where('id', $studentBT->session)->first();
                $date = date('Y/m/d H:i:s');
                if(($date >= $session->from_academic_year) && ($date <= $session->to_academic_year))
                {
                    $increment_date = strtotime("+7 day", strtotime($date));
                    $expected_date = date("Y-m-d", $increment_date);
                    // $bookTransaction->book_code = $request->book_code;
                    $issueBook = new StudentBookIssue();
                    $issueBook->bookTransaction_id = $request->BT_id;
                    $issueBook->book_no = $request->book_code;
                    $issueBook->status = 1;
                    $issueBook->save();
                    if($issueBook->save())
                    {
                        $issueDate = new StudentBookIssueDate();
                        $issueDate->student_book_issue_id = $issueBook->id;
                        $issueDate->issue_date = $date;
                        $issueDate->expected_return_date = $expected_date;
                        $issueDate->save();
                    }
                    $bookStatus = LibraryBook::where('book_no', $request->book_code)->update(['book_status' => 0]);
                    return Redirect::back()->with('success', 'Book Issue Successfully');
                }
                else{
                    return Redirect::back()->with('danger', 'BT Card is expired!');
                }
            }
            else{
                return Redirect::back()->with('danger', 'Book is not available!');
            }
        
    }

    public function studentBookIssueFormUpdate(Request $request)
    {
        $bookTransaction = StudentBookIssue::where('id', $request->issueID)->first();
        $book = LibraryBook::where('book_no', $bookTransaction->book_no)->first();
        $lastIssueBookArray = StudentBookIssueDate::where('student_book_issue_id', $bookTransaction->id)->get();
        foreach($lastIssueBookArray as $l)
        {
            $array[] = $l;
        }
        $lastIssueBook = end($array);
        $book_status = $request->book_status;
        $foundjquery = "Not found";
        if(in_array('jQuery',$book_status)){
            $foundjquery = "found";
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
            $updatePenaltyDays = DB::table('student_book_issue_dates')->where('id', $lastIssueBook->id)->update(['penalty_days' => $days]);
        }
        else{
            $updatePenaltyDays = DB::table('student_book_issue_dates')->where('id', $lastIssueBook->id)->update(['penalty_days' => 0]);
        }
        $penaltyArray = StudentBookIssueDate::where('student_book_issue_id', $bookTransaction->id)->get()->sum('penalty_days');
        // Converting the array to comma separated string
        $book_status = implode(",",$book_status);
        $bookTransaction = StudentBookIssue::where('id', $request->issueID)->update([
            'actual_return_date' => $request->return_date,
            'book_status' => $book_status,
            'penalty' => ($penaltyA + $penaltyG + $penaltyPoor + $penaltyMissing + ($penaltyArray * 2)),
        ]);
        $studentBookReturn = StudentBookIssue::where('id', $request->issueID)->first();
        if($studentBookReturn->actual_return_date)
        {
            $libraryBook = LibraryBook::where('book_no', $studentBookReturn->book_no)->update(['book_status' => 1]);
        }
    }

    public function bookTransactionRecord(Request $request)
    {
        if($request->ajax()) 
        {
            // select country name from database
            $academicYear = AcademicYear::where('id', $request->academic_year)
                ->first();
            $data = BookTransaction::whereBetween('created_at', [$academicYear->from_academic_year, $academicYear->to_academic_year])->get();
            // dd($data);        
        
            // declare an empty array for output
            $output = '';
            if (count($data)>0) {
                // concatenate output to the array
                // loop through the result array
                foreach ($data as $key => $row){
                    $studentBT = StudentBT::where('BT_no', $row->BT_no)->first();
                       $output .= '<tr>'. 
                       '<td>'.++$key.'</td>'.
                       '<td>'.$row->BT_no.'</td>'. 
                       '<td>'.$studentBT->name.'</td>'. 
                       '<td>'.'<button data-id="'.$row->id.'" class="btn issueBook btn-info btn-circle">
                       <i class="fas fa-eye"></i>
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


    public function studentBookRenew(Request $request)
    {
        $issueBook = StudentBookIssue::where('id', $request->issueID)->first();
        $lastIssueBookArray = StudentBookIssueDate::where('student_book_issue_id', $issueBook->id)->get();
        foreach($lastIssueBookArray as $l)
        {
            $array[] = $l;
        }
        $lastIssueBook = end($array);
        $date = date('Y/m/d H:i:s');
        $increment_date = strtotime("+7 day", strtotime($date));  
        $expected_date = date("Y-m-d", $increment_date);
        $renewBook = new StudentBookIssueDate();
        $renewBook->student_book_issue_id = $issueBook->id;
        $renewBook->issue_date = $date;
        $renewBook->expected_return_date = $expected_date;
        $convertDate = strtotime($date);
        $convertedDate = date("Y-m-d", $convertDate);
        if($convertedDate > $lastIssueBook->expected_return_date)
        {
            $diff = strtotime($convertedDate) - strtotime($lastIssueBook->expected_return_date); 
            $days = abs(round($diff / 86400));
            $book = DB::table('student_book_issue_dates')->where('id', $lastIssueBook->id)->update(['penalty_days' => $days]);
        }
        else{
            $book = DB::table('student_book_issue_dates')->where('id', $lastIssueBook->id)->update(['penalty_days' => 0]); 
        }
        $renewBook->save();
    }
}
