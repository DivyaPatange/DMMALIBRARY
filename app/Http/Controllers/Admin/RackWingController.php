<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Admin\RackWing;

class RackWingController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $rack_wing = RackWing::all();
        return view('auth.rackWing.index', compact('rack_wing'));
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
            'rack_no' => 'required',
            'wing' => 'required',
        ]);
        $rack_wing = new RackWing();
        $rack_wing->rack_no = $request->rack_no;
        $rack_wing->wing = $request->wing;
        $rack_wing->save();
        return redirect('/admin/rack-with-wing')->with('success', 'Rack & Wing added successfully!');
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
        $rack_wing = RackWing::findorfail($id);
        return view('auth.rackWing.edit', compact('rack_wing'));
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
        $rack_wing = RackWing::findorfail($id);
        $request->validate([
            'rack_no' => 'required',
            'wing' => 'required',
        ]);
        $rack_wing->rack_no = $request->rack_no;
        $rack_wing->wing = $request->wing;
        $rack_wing->update($request->all());
        return redirect('/admin/rack-with-wing')->with('success', 'Rack & Wing updated successfully!');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $rack_wing = RackWing::findorfail($id);
        $rack_wing->delete();
        return redirect('/admin/rack-with-wing')->with('success', 'Rack & Wing deleted successfully!');
    }
}
