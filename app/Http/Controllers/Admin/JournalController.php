<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Admin\Journal;


class JournalController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $journals = Journal::all();
        return view('auth.journals.index', compact('journals'));
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
            'journal_type' => 'required',
            'journal_title' => 'required',
            'file' => 'required',
        ]);
        $cvrimage = $request->file('file');
        $image_name = rand() . '.' . $cvrimage->getClientOriginalExtension();
        // $cvrimage->storeAs('public/tempcourseimg',$image_name);
        $cvrimage->move(public_path('Pdf'), $image_name);
        $journal = new Journal();
        $journal->journal_type = $request->journal_type;
        $journal->journal_title = $request->journal_title;
        $journal->file = $image_name;
        $journal->save();

        return redirect('/admin/journals')->with('success', 'Journal Added Successfully!');
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
        $journal = Journal::findorfail($id);
        return view('auth.journals.edit', compact('journal'));
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
        $image_name = $request->hidden_image;
        $image = $request->file('file');
        if($image != '')
        {
            $request->validate([
                'journal_type' => 'required',
                'journal_title' => 'required',
                'file' => 'required|mimes:pdf',
            ]);
        $image_name = rand() . '.' . $image->getClientOriginalExtension();
        // $image->storeAs('public/tempcourseimg',$image_name);
        $image->move(public_path('Pdf'), $image_name);
        }
        else{
            $request->validate([
                'journal_type' => 'required',
                'journal_title' => 'required',
            ]);
        }
        $input_data = array (
            'journal_type' => $request->journal_type,
            'journal_title' => $request->journal_title,
            'file' => $image_name,
        );

        Journal::whereId($id)->update($input_data);
        return redirect('/admin/journals')->with('success', 'Journal Updated Successfully!');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $journal = Journal::findorfail($id);
        unlink(public_path('Pdf/'.$journal->file));
        $journal->delete();
        return redirect('/admin/journals')->with('success', 'Journal Deleted Successfully!');
    }

    public function viewJournal()
    {
        $journals = Journal::all();
        return view('auth.journals.show', compact('journals'));
    }

    public function showJournal($id)
    {
        $journal = Journal::findorfail($id);
        return view('auth.journals.view', compact('journal'));
    }

    
}
