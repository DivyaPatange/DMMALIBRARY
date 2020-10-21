<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Admin\LibraryAccession;
use DateTime;
use App\Admin\StudentBT;
use App\Admin\AcademicYear;

class LibraryAccessionController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        // dd($libraryAccession);
        return view('auth.libraryAccession.index');
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        
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
            'start_time' => 'required',
        ]);
        $studentBT = StudentBT::where('BT_no', $request->BT_no)->first();
        $session = AcademicYear::where('id', $studentBT->session)->first();
        $date = date('Y/m/d H:i:s');
        if(($date >= $session->from_academic_year) && ($date <= $session->to_academic_year))
        {
            $libraryAccession = new LibraryAccession();
            $libraryAccession->BT_no = $request->BT_no;
            $libraryAccession->start_time = $request->start_time;
            $libraryAccession->save();
            return redirect('/admin/libraryAccession')->with('success', 'Library Accessed');
        }
        else{
            return redirect('/admin/libraryAccession')->with('danger', 'BT Card is Expired!');
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

    public function searchLibraryAccessionRecord(Request $request)
    {
        if($request->ajax()) {
            // select country name from database
            $data = LibraryAccession::where('start_time', 'LIKE', $request->accession_date.'%')
                ->get();
                // dd($data);
                
        
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
                foreach ($data as $key => $row){
                    // concatenate output to the array
                    // $parentName = User::where('id', $row->parent_id)->first();

                    $user = StudentBT::where('BT_no', $row->BT_no)->first();
                       $output .= '<tr>'. 
                       '<td>'.++$key.'</td>'.
                       '<td>'.$row->BT_no.'</td>'. 
                       '<td>'.$user->name.'</td>'. 
                       '<td>'.$row->start_time.'</td>';
                       if(!$row->end_time){
                       $output .='<td class="endtime_row"><input type="datetime-local" class="form-control form-control-user end_time" name="end_time" placeholder="End Time">'.  
                       '<td><button class="btn btn-warning btn-circle submit" data-id="'.$row->id.'" >
                       <i class="fas fa-edit"></i>
                     </button></td></tr>';
                        }
                        else{
                            $output .='<td>'.$row->end_time.'</td>'.  
                            '<td>Updated</td></tr>'; 
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

    public function updateLibraryAccessionTime(Request $request)
    {
        $libraryAccession = LibraryAccession::where('id', $request->id)->first();
        $libraryAccession->end_time  = $request->end_time;
        $libraryAccession->update($request->all());
    }
}
