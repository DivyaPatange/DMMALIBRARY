<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Admin\Magazine;

class MagazineController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $magazines = Magazine::all();
        return view('auth.magazine.index', compact('magazines'));
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
            'magazine_name' => 'required',
        ]);
        $magazine = new Magazine();
        $magazine->magazine_name = $request->magazine_name;
        $magazine->save();
        return redirect('/admin/magazines')->with('success', 'Magazine created successfully!');
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
        $magazine = Magazine::findorfail($id);
        return view('auth.magazine.edit', compact('magazine'));
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
            'magazine_name' => 'required',
        ]);
        $magazine = Magazine::findorfail($id);
        $magazine->magazine_name = $request->magazine_name;
        $magazine->update($request->all());
        return redirect('/admin/magazines')->with('success', 'Magazine updated successfully!');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $magazine = Magazine::findorfail($id);
        $magazine->delete();
        return redirect('/admin/magazines')->with('success', 'Magazine deleted successfully!');
    }
}
