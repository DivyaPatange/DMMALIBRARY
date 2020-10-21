<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Admin\AcademicYear;

class AcademicYearController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $academicYear = AcademicYear::all();
        return view('auth.academicYear.index', compact('academicYear'));
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
            'from_academic_year' => 'required',
            'to_academic_year' => 'required',
        ]);
        $academicYear = new AcademicYear();
        $academicYear->from_academic_year = $request->from_academic_year;
        $academicYear->to_academic_year = $request->to_academic_year;
        $academicYear->save();
        return redirect('/admin/academic-year')->with('success', 'Academic Year added successfully!');
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
        $academicYear = AcademicYear::findorfail($id);
        return view('auth.academicYear.edit', compact('academicYear'));
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
        $academicYear = AcademicYear::findorfail($id);
        $academicYear->from_academic_year = $request->from_academic_year;
        $academicYear->to_academic_year = $request->to_academic_year;
        $academicYear->update($request->all());
        return redirect('/admin/academic-year')->with('success', 'Academic Year updated successfully!');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $academicYear = AcademicYear::findorfail($id);
        $academicYear->delete();
        return redirect('/admin/academic-year')->with('success', 'Academic Year updated successfully!');
    }
}
