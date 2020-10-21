<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Admin\FacultyBT;
use App\Admin\AcademicYear;

class FacultyBTCardController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $academicYear = AcademicYear::all();
        $facultyBT = FacultyBT::all();
        return view('auth.facultyBTCard.index', compact('facultyBT', 'academicYear'));
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
            'session' => 'required',
        ]);
        $id = mt_rand(100000,999999);
        $facultyBT = new FacultyBT();
        $facultyBT->name = $request->name;
        $facultyBT->session = $request->session;
        $facultyBT->BT_no = "BTF".$id;
        $facultyBT->save();
        return redirect('/admin/faculty-bt-card')->with('success', 'Faculty BT Card added successfully!');
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
        $facultyBT = FacultyBT::findorfail($id);
        $academicYear = AcademicYear::all();
        return view('auth.facultyBTCard.edit', compact('facultyBT', 'academicYear'));
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
        $request->validate([
            'name' => 'required',
            'session' => 'required',
        ]);
        $facultyBT = FacultyBT::findorfail($id);
        $facultyBT->name = $request->name;
        $facultyBT->session = $request->session;
        $facultyBT->update($request->all());
        return redirect('/admin/faculty-bt-card')->with('success', 'Faculty BT Card updated successfully!');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $facultyBT = FacultyBT::findorfail($id);
        $facultyBT->delete();
        return redirect('/admin/faculty-bt-card')->with('success', 'Faculty BT Card deleted successfully!');
    }
}
