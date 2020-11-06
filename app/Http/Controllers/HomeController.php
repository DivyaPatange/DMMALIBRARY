<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Admin\LibraryBook;
use App\Admin\LibraryJournal;
use App\Admin\StudentBook;
use App\Admin\Computer;

class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {
        $totalBook = LibraryBook::all();
        $issueBook = LibraryBook::where('book_status', 0)->get();
        $generalBook = StudentBook::all();
        $generalIssueBook = StudentBook::where('book_status', 0)->get();
        $journal = LibraryJournal::all();
        $computer = Computer::all();
        return view('auth.dashboard', compact('totalBook', 'issueBook', 'journal', 'computer', 'generalBook', 'generalIssueBook'));
    }
}
