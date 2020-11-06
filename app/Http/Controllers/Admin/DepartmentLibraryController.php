<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Admin\DepartmentLibrary;
use App\Admin\Department;
use App\Admin\StudentBook;
use App\Admin\LibraryBook;
use Redirect;

class DepartmentLibraryController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $department = Department::all();
        return view('auth.departmentLibrary.index', compact('department'));
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
        if($request->category == "p"){
            $checkBookAvailability = LibraryBook::where('book_no', $request->book_code)->first();
            if($checkBookAvailability->book_status == 1)
            {
                $departmentBook = new DepartmentLibrary();
                $departmentBook->book_no = $request->book_code;
                $departmentBook->department_id = $request->department_id;
                $departmentBook->category = $request->category;
                $departmentBook->allocation_date = date('Y-m-d');
                $departmentBook->save();
                if($departmentBook->save())
                {
                    $changeBookStatus = LibraryBook::where('book_no', $request->book_code)->update(['book_status' => 0]);
                }
                return Redirect::back()->with('success', 'Book is allotted  to department');
            }
            else{
                return Redirect::back()->with('danger', 'Book is not available');
            }
        }
        if($request->category == "g")
        {
            $checkBookAvailability = StudentBook::where('book_no', $request->book_code)->first();
            if($checkBookAvailability->book_status == 1)
            {
                $departmentBook = new DepartmentLibrary();
                $departmentBook->book_no = $request->book_code;
                $departmentBook->department_id = $request->department_id;
                $departmentBook->category = $request->category;
                $departmentBook->allocation_date = date('Y-m-d');
                $departmentBook->save();
                if($departmentBook->save())
                {
                    $changeBookStatus = StudentBook::where('book_no', $request->book_code)->update(['book_status' => 0]);
                }
                return Redirect::back()->with('success', 'Book is allotted  to department');
            }
            else{
                return Redirect::back()->with('danger', 'Book is not available');
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

    public function viewDepartmentBook($id)
    {
        $department = Department::findorfail($id);
        $departmentBook = DepartmentLibrary::where('department_id', $id)->where('category', '=', 'p')->get();
        $generalDepartmentBook = DepartmentLibrary::where('department_id', $id)->where('category', '=', 'g')->get();
        return view('auth.departmentLibrary.view', compact('department', 'departmentBook', 'generalDepartmentBook'));
    }
}
