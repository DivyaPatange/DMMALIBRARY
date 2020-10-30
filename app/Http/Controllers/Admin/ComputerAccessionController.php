<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Admin\ComputerAccession;
use App\Admin\Computer;
use App\Admin\StudentBT;
use App\Admin\AcademicYear;
use DB;
use Datatables;

class ComputerAccessionController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $computer = Computer::all();
        if(request()->ajax()) 
        {
            // dd($request->academic);
            if($request->academic)
            {
              
                $data = DB::table('computer_accessions')->join('student_b_t_s', 'student_b_t_s.BT_no', '=', 'computer_accessions.BT_no')
                ->join('computers', 'computers.id', '=', 'computer_accessions.system_no')
                ->select('computer_accessions.id','computer_accessions.start_time','computer_accessions.end_time','computer_accessions.BT_no', 'student_b_t_s.name', 'computers.system_no')->where('start_time', 'LIKE', $request->academic.'%')->get();
            }
            else{
                $data = DB::table('computer_accessions')->join('student_b_t_s', 'student_b_t_s.BT_no', '=', 'computer_accessions.BT_no')
                ->join('computers', 'computers.id', '=', 'computer_accessions.system_no')
                ->select('computer_accessions.id','computer_accessions.start_time','computer_accessions.end_time','computer_accessions.BT_no', 'student_b_t_s.name', 'computers.system_no');
                // dd($data);
            }
            return datatables()->of($data)
            ->addColumn('end_time', function($data){
                if(!$data->end_time)
                {
                    $button = '<input type="datetime-local" class="form-control form-control-user end_time" name="end_time" placeholder="End Time">';
                }
                else{
                    $button = $data->end_time;
                }
                return $button;
            })
            ->addColumn('action', function($data){
                if(!$data->end_time)
                {
                    $button = '<button class="btn btn-warning btn-circle submit" data-id="'.$data->id.'" >
                    <i class="fas fa-edit"></i>
                  </button>';
                }
                else{
                    $button = 'Updated';
                }
                return $button;
            })
            ->rawColumns(['action', 'end_time'])
            ->addIndexColumn()
            ->make(true);
        }
        return view('auth.computerAccession.index', compact('computer'));
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
            'start_time' => 'required',
            'system_no' => 'required',
        ]);
        $studentBT = StudentBT::where('BT_no', $request->BT_no)->first();
        $session = AcademicYear::where('id', $studentBT->session)->first();
        $date = date('Y/m/d H:i:s');
        if(($date >= $session->from_academic_year) && ($date <= $session->to_academic_year))
        {
            $computerAccession = new ComputerAccession();
            $computerAccession->BT_no = $request->BT_no;
            $computerAccession->system_no = $request->system_no;
            $computerAccession->start_time = $request->start_time;
            $computerAccession->save();
            $system = Computer::where('id', $request->system_no)->first();
            if(!empty($system))
            {
                $system = Computer::where('id', $request->system_no)->update(['status' => 0]);
            }
            return redirect('/admin/computerAccession')->with('success', 'Computer Accessed');
        }
        else{
            return redirect('/admin/computerAccession')->with('danger', 'BT Card is expired');
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

    public function searchComputerAccessionRecord(Request $request)
    {
        if($request->ajax()) {
            // select country name from database
            $data = ComputerAccession::where('start_time', 'LIKE', $request->accession_date.'%')
                ->get();
                // dd($data);
                
        
            // declare an empty array for output
            $output = '';
            if (count($data)>0) {
                // concatenate output to the array
                // loop through the result array
                foreach ($data as $key => $row){

                    $user = StudentBT::where('BT_no', $row->BT_no)->first();
                    $system = Computer::where('id', $row->system_no)->first();
                       $output .= '<tr>'. 
                       '<td>'.++$key.'</td>'.
                       '<td>'.$row->BT_no.'</td>'. 
                       '<td>'.$user->name.'</td>'. 
                       '<td>'.$system->system_no.'</td>'.
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

    public function updateComputerAccessionTime(Request $request)
    {
        $computerAccession = ComputerAccession::where('id', $request->id)->first();
        $computer = Computer::where('id', $computerAccession->system_no)->first();
        if(!empty($computer))
        {
            $computer = Computer::where('id', $computerAccession->system_no)->update(['status' => 1]);
        }
        $computerAccession->end_time  = $request->end_time;
        $computerAccession->update($request->all());
        
    }
}
