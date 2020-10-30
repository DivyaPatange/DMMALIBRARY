<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Admin\BookBank;
use App\Admin\StudentBT;
use App\Admin\LibraryBook;
use App\Admin\AcademicYear;
use Datatables;

class BookBankController extends Controller
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
                $data = StudentBT::where('book_bank', 1)->where('session', $request->academic)->get();
            }
            else{
                $data = StudentBT::where('book_bank', 1)->get();
                // dd($data);
            }
            return datatables()->of($data)
            ->addColumn('action', function($data){
                    $button = '<button data-id="'.$data->id.'" class="btn issueBook btn-info btn-circle">
                    <i class="fas fa-eye"></i>
                  </button>';
                return $button;
            })
            ->rawColumns(['action'])
            ->addIndexColumn()
            ->make(true);
        }
        return view('auth.bookBank.index', compact('academicYear'));
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
        $checkBookAvailability = LibraryBook::where('book_no', $request->book_code)->first();
        $studentBT = StudentBT::where('BT_no', $request->BT_no)->first();
            // dd($studentBT);
        $session = AcademicYear::where('id', $studentBT->session)->first();
        if($checkBookAvailability->book_status == 1)
        {
            
            $date = date('Y/m/d H:i:s');
            if(($date >= $session->from_academic_year) && ($date <= $session->to_academic_year))
            {
                $increment_date = strtotime("+1 year", strtotime($date));  
                $expected_date = date("Y-m-d", $increment_date);
                $bookBank = new BookBank();
                $bookBank->BT_no = $request->BT_no;
                $bookBank->book_no = $request->book_code;
                $bookBank->issue_date = $date;
                $bookBank->expected_return_date = $expected_date;
                $bookBank->save();
                $bookStatus = LibraryBook::where('book_no', $request->book_code)->update(['book_status' => 0]);
                return redirect()->route('admin.bookBank.show', $studentBT->id)->with('success', 'Book Issue Successfully');
            }
            else{
                return redirect()->route('admin.bookBank.show', $studentBT->id)->with('danger', 'BT Card is expired!');
            }

        }
        else{
            return redirect()->route('admin.bookBank.show', $studentBT->id)->with('danger', 'Book is not available!');
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
        $studentBT = StudentBT::findorfail($id);
        $bookBank = BookBank::where('BT_no', $studentBT->BT_no)->get();
        return view('auth.bookBank.show', compact('studentBT','bookBank'));
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
       
    }

    public function submit(Request $request)
    {
        $bookBank = BookBank::where('id', $request->issueID)->first();
        $book = LibraryBook::where('book_no', $bookBank->book_no)->first();
        $book_status = $request->book_status;
        // dd($book_status);
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
        $date2 = $bookBank->expected_return_date;
         
        if($date1 > $date2)
        {
            $diff = strtotime($date2) - strtotime($date1); 
            $days = abs(round($diff / 86400));
            $penaltyDays = 2 * $days;
        }
        else{
            $penaltyDays = 0;
        }
       
        // Converting the array to comma separated string
        $book_status = implode(",",$book_status);
        $bookBank = BookBank::where('id', $request->issueID)->update([
            'actual_return_date' => $request->return_date,
            'book_condition' => $book_status,
            'penalty' => ($penaltyPoor + $penaltyMissing + $penaltyA + $penaltyG + $penaltyDays),
        ]);
        $studentBookReturn = BookBank::where('id', $request->issueID)->first();
        if($studentBookReturn->actual_return_date)
        {
            $libraryBook = LibraryBook::where('book_no', $studentBookReturn->book_no)->update(['book_status' => 1]);
        }
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

    public function bookBankRecord(Request $request)
    {
        if($request->ajax()) 
        {
            // select country name from database
            $academicYear = AcademicYear::where('id', $request->academic_year)
                ->first();
            $data = StudentBT::where('book_bank', 1)->where('session', $academicYear->id)->get();
            // dd($data);        
        
            // declare an empty array for output
            $output = '';
            if (count($data)>0) {
                // concatenate output to the array
                // loop through the result array
                foreach ($data as $key => $row){
                       $output .= '<tr>'. 
                       '<td>'.++$key.'</td>'.
                       '<td>'.$row->BT_no.'</td>'. 
                       '<td>'.$row->name.'</td>'. 
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
}
