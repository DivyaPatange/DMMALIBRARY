<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Admin\LibraryBook;
use App\Admin\StudentBook;

class SearchController extends Controller
{
    public function search()
    {
        return view('auth.search');
    }

    public function fetch(Request $request)
    {
        if($request->value)
        {
            $output = '<option value="">-Search By-</option>'. 
            '<option value="book_no">Book No</option>'. 
            '<option value="book_name">Book Name</option>'. 
            '<option value="author_name">Author Name</option>'. 
            '<option value="publication">Publication</option>';

            return $output;
        }
    }

    public function searchBookDetails(Request $request)
    {
        if($request->ajax()){
            if($request->category == "p")
            {
                if($request->searchBy == "book_no")
                {
                    $book = LibraryBook::where('book_no', 'LIKE', $request->searchFor
                    .'%')->get();
                    $output = '<div class="card shadow mb-4">
                    <div class="card-header">Pustak Pedhi Books</div>
                    <div class="card-body">
                    <div class="table-responsive">
                            <table class="table table-bordered">
                                <tr>
                                    <th>Sr. No.</th>
                                    <th>Book Name</th>
                                    <th>Book No.</th>
                                    <th>Author Name</th>
                                    <th>Total Books</th>
                                    <th>Available Books</th>
                                    <th>Issue Book</th>
                                </tr>';
                    if (count($book)>0) {
                        // concatenate output to the array
                        // loop through the result array
                        foreach ($book as $key => $row)
                        {
                            if($row->book_no == $request->searchFor)
                            {
                                $countBooks = LibraryBook::where('book_name', $row->book_name)->get();
                                $availableBook = LibraryBook::where('book_name', $row->book_name)->where('book_status', 1)->get();
                                $issueBook = LibraryBook::where('book_name', $row->book_name)->where('book_status', 0)->get();
                               $output .= '<tr>'. 
                               '<td>'.++$key.'</td>'.
                               '<td>'.$row->book_name.'</td>'. 
                               '<td>'.$row->book_no.'</td>'. 
                               '<td>'.$row->author_name.'</td>'. 
                               '<td>'.count($countBooks).'</td>'. 
                               '<td>'.count($availableBook).'</td>'. 
                               '<td>'.count($issueBook).'</td>'.
                               '</tr>';
                            }
                            
                        }
                        // end of output
                    }
                    
                    else {
                        // if there's no matching results according to the input
                        $output .= 'No results';
                    }
                    $output .= '</table></div></div></div>';
                    
                    return $output;
                }
                if($request->searchBy == "book_name")
                {
                    $book = LibraryBook::where('book_name', 'LIKE', $request->searchFor
                    .'%')->get();
                    $availableBook = LibraryBook::where('book_name', 'LIKE', $request->searchFor
                    .'%')->where('book_status', 1)->get();
                    $issueBook = LibraryBook::where('book_name', 'LIKE', $request->searchFor
                    .'%')->where('book_status', 0)->get();
                    $output = '<div class="card shadow mb-4">
                    <div class="card-header">Pustak Pedhi Books</div>
                    <div class="card-body">
                        <div class="row mb-4">
                            <div class="col-md-3">
                                <p><b>Total Books :- </b>'.count($book).'</p>
                            </div>
                            <div class="col-md-3">
                                <p><b>Available Books :- </b>'.count($availableBook).'</p>
                            </div>
                            <div class="col-md-3">
                                <p><b>Issue Books :- </b>'.count($issueBook).'</p>
                            </div>
                        </div>
                        <div class="table-responsive">
                            <table class="table table-bordered" id="dataTable">
                                <tr>
                                    <th>Sr. No.</th>
                                    <th>Book Name</th>
                                    <th>Book No.</th>
                                    <th>Author Name</th>
                                    <th>Publication</th>
                                    <th>Book Status</th>
                                </tr>';
                    if (count($book)>0) {
                        // concatenate output to the array
                        // loop through the result array
                        foreach ($book as $key => $row)
                        {
                               $output .= '<tr>'. 
                               '<td>'.++$key.'</td>'.
                               '<td>'.$row->book_name.'</td>'. 
                               '<td>'.$row->book_no.'</td>'. 
                               '<td>'.$row->author_name.'</td>'. 
                               '<td>'.$row->publication.'</td>';
                               if($row->book_status == 1)
                               {
                                    $output .= '<td>Available</td>';  
                               }
                               else{
                                $output .= '<td>Issued</td>'; 
                               }
                               '</tr>';
                            
                        }
                        // end of output
                    }
                    
                    else {
                        // if there's no matching results according to the input
                        $output .= 'No results';
                    }
                    $output .= '</table></div></div></div>';
                    
                    return $output;
                }
                if($request->searchBy == "author_name")
                {
                    $book = LibraryBook::where('author_name', 'LIKE', $request->searchFor
                    .'%')->get();
                    $availableBook = LibraryBook::where('author_name', 'LIKE', $request->searchFor
                    .'%')->where('book_status', 1)->get();
                    $issueBook = LibraryBook::where('author_name', 'LIKE', $request->searchFor
                    .'%')->where('book_status', 0)->get();
                    $output = '<div class="card shadow mb-4">
                    <div class="card-header">Pustak Pedhi Books</div>
                    <div class="card-body">
                        <div class="row mb-4">
                            <div class="col-md-3">
                                <p><b>Total Books :- </b>'.count($book).'</p>
                            </div>
                            <div class="col-md-3">
                                <p><b>Available Books :- </b>'.count($availableBook).'</p>
                            </div>
                            <div class="col-md-3">
                                <p><b>Issue Books :- </b>'.count($issueBook).'</p>
                            </div>
                        </div>
                        <div class="table-responsive">
                            <table class="table table-bordered" id="dataTable">
                                <tr>
                                    <th>Sr. No.</th>
                                    <th>Book Name</th>
                                    <th>Book No.</th>
                                    <th>Author Name</th>
                                    <th>Publication</th>
                                    <th>Book Status</th>
                                </tr>';
                    if (count($book)>0) {
                        // concatenate output to the array
                        // loop through the result array
                        foreach ($book as $key => $row)
                        {
                               $output .= '<tr>'. 
                               '<td>'.++$key.'</td>'.
                               '<td>'.$row->book_name.'</td>'. 
                               '<td>'.$row->book_no.'</td>'. 
                               '<td>'.$row->author_name.'</td>'. 
                               '<td>'.$row->publication.'</td>';
                               if($row->book_status == 1)
                               {
                                    $output .= '<td>Available</td>';  
                               }
                               else{
                                $output .= '<td>Issued</td>'; 
                               }
                               '</tr>';
                            
                        }
                        // end of output
                    }
                    
                    else {
                        // if there's no matching results according to the input
                        $output .= 'No results';
                    }
                    $output .= '</table></div></div></div>';
                    
                    return $output;
                }
                if($request->searchBy == "publication")
                {
                    $book = LibraryBook::where('publication', 'LIKE', $request->searchFor
                    .'%')->get();
                    $availableBook = LibraryBook::where('publication', 'LIKE', $request->searchFor
                    .'%')->where('book_status', 1)->get();
                    $issueBook = LibraryBook::where('publication', 'LIKE', $request->searchFor
                    .'%')->where('book_status', 0)->get();
                    $output = '<div class="card shadow mb-4">
                    <div class="card-header">Pustak Pedhi Books</div>
                    <div class="card-body">
                        <div class="row mb-4">
                            <div class="col-md-3">
                                <p><b>Total Books :- </b>'.count($book).'</p>
                            </div>
                            <div class="col-md-3">
                                <p><b>Available Books :- </b>'.count($availableBook).'</p>
                            </div>
                            <div class="col-md-3">
                                <p><b>Issue Books :- </b>'.count($issueBook).'</p>
                            </div>
                        </div>
                        <div class="table-responsive">
                            <table class="table table-bordered" id="dataTable">
                                <tr>
                                    <th>Sr. No.</th>
                                    <th>Book Name</th>
                                    <th>Book No.</th>
                                    <th>Author Name</th>
                                    <th>Publication</th>
                                    <th>Book Status</th>
                                </tr>';
                    if (count($book)>0) {
                        // concatenate output to the array
                        // loop through the result array
                        foreach ($book as $key => $row)
                        {
                               $output .= '<tr>'. 
                               '<td>'.++$key.'</td>'.
                               '<td>'.$row->book_name.'</td>'. 
                               '<td>'.$row->book_no.'</td>'. 
                               '<td>'.$row->author_name.'</td>'. 
                               '<td>'.$row->publication.'</td>';
                               if($row->book_status == 1)
                               {
                                    $output .= '<td>Available</td>';  
                               }
                               else{
                                $output .= '<td>Issued</td>'; 
                               }
                               '</tr>';
                            
                        }
                        // end of output
                    }
                    
                    else {
                        // if there's no matching results according to the input
                        $output .= 'No results';
                    }
                    $output .= '</table></div></div></div>';
                    
                    return $output;
                }
            }
            else{
                if($request->searchBy == "book_no")
                {
                    $book = StudentBook::where('book_no', 'LIKE', $request->searchFor
                    .'%')->get();
                    // dd($book);
                    $output = '';
                    if (count($book)>0) {
                        $output = '<div class="card shadow mb-4">
                    <div class="card-header">General Books</div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-bordered table-responsive">
                                <tr>
                                    <th>Sr. No.</th>
                                    <th>Book Name</th>
                                    <th>Book No.</th>
                                    <th>Author Name</th>
                                    <th>Total Books</th>
                                    <th>Available Books</th>
                                    <th>Issue Book</th>
                                </tr>';
                        // concatenate output to the array
                        // loop through the result array
                        foreach ($book as $key => $row)
                        {
                            if($row->book_no == $request->searchFor)
                            {
                                $countBooks = StudentBook::where('book_name', $row->book_name)->get();
                                $availableBook = StudentBook::where('book_name', $row->book_name)->where('book_status', 1)->get();
                                $issueBook = StudentBook::where('book_name', $row->book_name)->where('book_status', 0)->get();
                               $output .= '<tr>'. 
                               '<td>'.++$key.'</td>'.
                               '<td>'.$row->book_name.'</td>'. 
                               '<td>'.$row->book_no.'</td>'. 
                               '<td>'.$row->author_name.'</td>'. 
                               '<td>'.count($countBooks).'</td>'. 
                               '<td>'.count($availableBook).'</td>'. 
                               '<td>'.count($issueBook).'</td>'.
                               '</tr>';
                            }
                            
                        }
                        // end of output
                    }
                    
                    else {
                        // if there's no matching results according to the input
                        $output .= '<tr><td colspan="7">No results</td></tr>';
                    }
                    $output .= '</table></div></div></div>';
                    
                    return $output;
                }
                if($request->searchBy == "book_name")
                {
                    $book = StudentBook::where('book_name', 'LIKE', $request->searchFor
                    .'%')->get();
                    $availableBook = StudentBook::where('book_name', 'LIKE', $request->searchFor
                    .'%')->where('book_status', 1)->get();
                    $issueBook = StudentBook::where('book_name', 'LIKE', $request->searchFor
                    .'%')->where('book_status', 0)->get();
                    $output = '<div class="card shadow mb-4">
                    <div class="card-header">General Books</div>
                    <div class="card-body">
                        <div class="row mb-4">
                            <div class="col-md-3">
                                <p><b>Total Books :- </b>'.count($book).'</p>
                            </div>
                            <div class="col-md-3">
                                <p><b>Available Books :- </b>'.count($availableBook).'</p>
                            </div>
                            <div class="col-md-3">
                                <p><b>Issue Books :- </b>'.count($issueBook).'</p>
                            </div>
                        </div>
                        <div class="table-responsive">
                            <table class="table table-bordered" id="dataTable">
                                <tr>
                                    <th>Sr. No.</th>
                                    <th>Book Name</th>
                                    <th>Book No.</th>
                                    <th>Author Name</th>
                                    <th>Publication</th>
                                    <th>Book Status</th>
                                </tr>';
                    if (count($book)>0) {
                        // concatenate output to the array
                        // loop through the result array
                        foreach ($book as $key => $row)
                        {
                               $output .= '<tr>'. 
                               '<td>'.++$key.'</td>'.
                               '<td>'.$row->book_name.'</td>'. 
                               '<td>'.$row->book_no.'</td>'. 
                               '<td>'.$row->author_name.'</td>'. 
                               '<td>'.$row->publication.'</td>';
                               if($row->book_status == 1)
                               {
                                    $output .= '<td>Available</td>';  
                               }
                               else{
                                $output .= '<td>Issued</td>'; 
                               }
                               '</tr>';
                            
                        }
                        // end of output
                    }
                    
                    else {
                        // if there's no matching results according to the input
                        $output .= 'No results';
                    }
                    $output .= '</table></div></div></div>';
                    
                    return $output;
                }
                if($request->searchBy == "author_name")
                {
                    $book = StudentBook::where('author_name', 'LIKE', $request->searchFor
                    .'%')->get();
                    $availableBook = StudentBook::where('author_name', 'LIKE', $request->searchFor
                    .'%')->where('book_status', 1)->get();
                    $issueBook = StudentBook::where('author_name', 'LIKE', $request->searchFor
                    .'%')->where('book_status', 0)->get();
                    $output = '<div class="card shadow mb-4">
                    <div class="card-header">General Books</div>
                    <div class="card-body">
                        <div class="row mb-4">
                            <div class="col-md-3">
                                <p><b>Total Books :- </b>'.count($book).'</p>
                            </div>
                            <div class="col-md-3">
                                <p><b>Available Books :- </b>'.count($availableBook).'</p>
                            </div>
                            <div class="col-md-3">
                                <p><b>Issue Books :- </b>'.count($issueBook).'</p>
                            </div>
                        </div>
                        <div class="table-responsive">
                            <table class="table table-bordered table-responsive" id="dataTable">
                                <tr>
                                    <th>Sr. No.</th>
                                    <th>Book Name</th>
                                    <th>Book No.</th>
                                    <th>Author Name</th>
                                    <th>Publication</th>
                                    <th>Book Status</th>
                                </tr>';
                    if (count($book)>0) {
                        // concatenate output to the array
                        // loop through the result array
                        foreach ($book as $key => $row)
                        {
                               $output .= '<tr>'. 
                               '<td>'.++$key.'</td>'.
                               '<td>'.$row->book_name.'</td>'. 
                               '<td>'.$row->book_no.'</td>'. 
                               '<td>'.$row->author_name.'</td>'. 
                               '<td>'.$row->publication.'</td>';
                               if($row->book_status == 1)
                               {
                                    $output .= '<td>Available</td>';  
                               }
                               else{
                                $output .= '<td>Issued</td>'; 
                               }
                               '</tr>';
                            
                        }
                        // end of output
                    }
                    
                    else {
                        // if there's no matching results according to the input
                        $output .= 'No results';
                    }
                    $output .= '</table></div></div></div>';
                    
                    return $output;
                }
                if($request->searchBy == "publication")
                {
                    $book = StudentBook::where('publication', 'LIKE', $request->searchFor
                    .'%')->get();
                    $availableBook = StudentBook::where('publication', 'LIKE', $request->searchFor
                    .'%')->where('book_status', 1)->get();
                    $issueBook = StudentBook::where('publication', 'LIKE', $request->searchFor
                    .'%')->where('book_status', 0)->get();
                    $output = '<div class="card shadow mb-4">
                    <div class="card-header">General Books</div>
                    <div class="card-body">
                        <div class="row mb-4">
                            <div class="col-md-3">
                                <p><b>Total Books :- </b>'.count($book).'</p>
                            </div>
                            <div class="col-md-3">
                                <p><b>Available Books :- </b>'.count($availableBook).'</p>
                            </div>
                            <div class="col-md-3">
                                <p><b>Issue Books :- </b>'.count($issueBook).'</p>
                            </div>
                        </div>
                        <div class="table-responsive">
                            <table class="table table-bordered" id="dataTable">
                                <tr>
                                    <th>Sr. No.</th>
                                    <th>Book Name</th>
                                    <th>Book No.</th>
                                    <th>Author Name</th>
                                    <th>Publication</th>
                                    <th>Book Status</th>
                                </tr>';
                    if (count($book)>0) {
                        // concatenate output to the array
                        // loop through the result array
                        foreach ($book as $key => $row)
                        {
                               $output .= '<tr>'. 
                               '<td>'.++$key.'</td>'.
                               '<td>'.$row->book_name.'</td>'. 
                               '<td>'.$row->book_no.'</td>'. 
                               '<td>'.$row->author_name.'</td>'. 
                               '<td>'.$row->publication.'</td>';
                               if($row->book_status == 1)
                               {
                                    $output .= '<td>Available</td>';  
                               }
                               else{
                                $output .= '<td>Issued</td>'; 
                               }
                               '</tr>';
                            
                        }
                        // end of output
                    }
                    
                    else {
                        // if there's no matching results according to the input
                        $output .= 'No results';
                    }
                    $output .= '</table></div></div></div>';
                    
                    return $output;
                }
            }
        }
    }

    public function searchBookNo(Request $request)
    {
        if($request->ajax())
        {
            if($request->category == "p")
            {   
                // dd($request->search_book_no);
                $book = LibraryBook::where('book_no', 'LIKE', $request->search_book_no
                    .'%')->get();
                // dd($book);
                $output = '<div class="card shadow mb-4">
                <div class="card-header">Pustak Pedhi Books</div>
                <div class="card-body">
                <div class="table-responsive">
                <table class="table table-bordered">
                    <tr>
                        <th>Sr. No.</th>
                        <th>Book Name</th>
                        <th>Book No.</th>
                        <th>Author Name</th>
                        <th>Total Books</th>
                        <th>Available Books</th>
                        <th>Issue Book</th>
                    </tr>';
                if (count($book)>0) 
                {
                    // concatenate output to the array
                    // loop through the result array
                    foreach ($book as $key => $row)
                    {
                        if($row->book_no == $request->search_book_no)
                        {
                            $countBooks = LibraryBook::where('book_name', $row->book_name)->get();
                            $availableBook = LibraryBook::where('book_name', $row->book_name)->where('book_status', 1)->get();
                            $issueBook = LibraryBook::where('book_name', $row->book_name)->where('book_status', 0)->get();
                            $output .= '<tr>'. 
                            '<td>'.++$key.'</td>'.
                            '<td>'.$row->book_name.'</td>'. 
                            '<td>'.$row->book_no.'</td>'. 
                            '<td>'.$row->author_name.'</td>'. 
                            '<td>'.count($countBooks).'</td>'. 
                            '<td>'.count($availableBook).'</td>'. 
                            '<td>'.count($issueBook).'</td>'.
                            '</tr>';
                        }
                        
                    }
                    // end of output
                }
                
                else {
                    // if there's no matching results according to the input
                    $output .= 'No results';
                }
                $output .= '</table></div></div></div>';
                
                return $output;
            }
            if($request->category == "g"){
                $book = StudentBook::where('book_no', 'LIKE', $request->search_book_no
                    .'%')->get();
                    // dd($book);
                    $output = '';
                    if (count($book)>0) {
                        $output = '<div class="card shadow mb-4">
                    <div class="card-header">General Books</div>
                    <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-bordered">
                                <tr>
                                    <th>Sr. No.</th>
                                    <th>Book Name</th>
                                    <th>Book No.</th>
                                    <th>Author Name</th>
                                    <th>Total Books</th>
                                    <th>Available Books</th>
                                    <th>Issue Book</th>
                                </tr>';
                        // concatenate output to the array
                        // loop through the result array
                        foreach ($book as $key => $row)
                        {
                            if($row->book_no == $request->search_book_no)
                            {
                                $countBooks = StudentBook::where('book_name', $row->book_name)->get();
                                $availableBook = StudentBook::where('book_name', $row->book_name)->where('book_status', 1)->get();
                                $issueBook = StudentBook::where('book_name', $row->book_name)->where('book_status', 0)->get();
                               $output .= '<tr>'. 
                               '<td>'.++$key.'</td>'.
                               '<td>'.$row->book_name.'</td>'. 
                               '<td>'.$row->book_no.'</td>'. 
                               '<td>'.$row->author_name.'</td>'. 
                               '<td>'.count($countBooks).'</td>'. 
                               '<td>'.count($availableBook).'</td>'. 
                               '<td>'.count($issueBook).'</td>'.
                               '</tr>';
                            }
                            
                        }
                        // end of output
                    }
                    
                    else {
                        // if there's no matching results according to the input
                        $output .= '<tr><td colspan="7">No results</td></tr>';
                    }
                    $output .= '</table></div></div></div>';
                    
                    return $output;
            }
        }
    }

    public function searchBookName(Request $request)
    {
        if($request->ajax())
        {
            // dd($request->category == "p");
            if($request->category == "p")
            { 
                $book = LibraryBook::where('book_name', 'LIKE', $request->search_book_name
                    .'%')->get();
                    // dd($book);
                    $availableBook = LibraryBook::where('book_name', 'LIKE', $request->search_book_name
                    .'%')->where('book_status', 1)->get();
                    $issueBook = LibraryBook::where('book_name', 'LIKE', $request->search_book_name
                    .'%')->where('book_status', 0)->get();
                    $output = '<div class="card shadow mb-4">
                    <div class="card-header">Pustak Pedhi Books</div>
                    <div class="card-body">
                        <div class="row mb-4">
                            <div class="col-md-3">
                                <p><b>Total Books :- </b>'.count($book).'</p>
                            </div>
                            <div class="col-md-3">
                                <p><b>Available Books :- </b>'.count($availableBook).'</p>
                            </div>
                            <div class="col-md-3">
                                <p><b>Issue Books :- </b>'.count($issueBook).'</p>
                            </div>
                        </div>
                        <div class="table-responsive">
                    <table class="table table-bordered " id="dataTable">
                                <tr>
                                    <th>Sr. No.</th>
                                    <th>Book Name</th>
                                    <th>Book No.</th>
                                    <th>Author Name</th>
                                    <th>Publication</th>
                                    <th>Book Status</th>
                                </tr>';
                    if (count($book)>0) {
                        // concatenate output to the array
                        // loop through the result array
                        foreach ($book as $key => $row)
                        {
                               $output .= '<tr>'. 
                               '<td>'.++$key.'</td>'.
                               '<td>'.$row->book_name.'</td>'. 
                               '<td>'.$row->book_no.'</td>'. 
                               '<td>'.$row->author_name.'</td>'. 
                               '<td>'.$row->publication.'</td>';
                               if($row->book_status == 1)
                               {
                                    $output .= '<td>Available</td>';  
                               }
                               else{
                                $output .= '<td>Issued</td>'; 
                               }
                               '</tr>';
                            
                        }
                        // end of output
                    }
                    
                    else {
                        // if there's no matching results according to the input
                        $output .= 'No results';
                    }
                    $output .= '</table></div></div></div>';
                    
                    return $output;
            }
            if($request->category == "g"){
                $book = StudentBook::where('book_name', 'LIKE', $request->search_book_name
                    .'%')->get();
                    $availableBook = StudentBook::where('book_name', 'LIKE', $request->search_book_name
                    .'%')->where('book_status', 1)->get();
                    $issueBook = StudentBook::where('book_name', 'LIKE', $request->search_book_name
                    .'%')->where('book_status', 0)->get();
                    $output = '<div class="card shadow mb-4">
                    <div class="card-header">General Books</div>
                    <div class="card-body">
                        <div class="row mb-4">
                            <div class="col-md-3">
                                <p><b>Total Books :- </b>'.count($book).'</p>
                            </div>
                            <div class="col-md-3">
                                <p><b>Available Books :- </b>'.count($availableBook).'</p>
                            </div>
                            <div class="col-md-3">
                                <p><b>Issue Books :- </b>'.count($issueBook).'</p>
                            </div>
                        </div>
                        <div class="table-responsive">
                            <table class="table table-bordered" id="dataTable">
                                <tr>
                                    <th>Sr. No.</th>
                                    <th>Book Name</th>
                                    <th>Book No.</th>
                                    <th>Author Name</th>
                                    <th>Publication</th>
                                    <th>Book Status</th>
                                </tr>';
                    if (count($book)>0) {
                        // concatenate output to the array
                        // loop through the result array
                        foreach ($book as $key => $row)
                        {
                               $output .= '<tr>'. 
                               '<td>'.++$key.'</td>'.
                               '<td>'.$row->book_name.'</td>'. 
                               '<td>'.$row->book_no.'</td>'. 
                               '<td>'.$row->author_name.'</td>'. 
                               '<td>'.$row->publication.'</td>';
                               if($row->book_status == 1)
                               {
                                    $output .= '<td>Available</td>';  
                               }
                               else{
                                $output .= '<td>Issued</td>'; 
                               }
                               '</tr>';
                            
                        }
                        // end of output
                    }
                    
                    else {
                        // if there's no matching results according to the input
                        $output .= 'No results';
                    }
                    $output .= '</table></div></div></div>';
                    
                    return $output;
            }
        }
    }

    public function searchAuthorName(Request $request)
    {
        if($request->ajax())
        {
            if($request->category == "p")
            {
                $book = LibraryBook::where('author_name', 'LIKE', $request->search_author_name
                    .'%')->get();
                $availableBook = LibraryBook::where('author_name', 'LIKE', $request->search_author_name
                .'%')->where('book_status', 1)->get();
                $issueBook = LibraryBook::where('author_name', 'LIKE', $request->search_author_name
                .'%')->where('book_status', 0)->get();
                $output = '<div class="card shadow mb-4">
                <div class="card-header">Pustak Pedhi Books</div>
                <div class="card-body">
                    <div class="row mb-4">
                        <div class="col-md-3">
                            <p><b>Total Books :- </b>'.count($book).'</p>
                        </div>
                        <div class="col-md-3">
                            <p><b>Available Books :- </b>'.count($availableBook).'</p>
                        </div>
                        <div class="col-md-3">
                            <p><b>Issue Books :- </b>'.count($issueBook).'</p>
                        </div>
                    </div>
                    <div class="table-responsive">
                        <table class="table table-bordered" id="dataTable">
                            <tr>
                                <th>Sr. No.</th>
                                <th>Book Name</th>
                                <th>Book No.</th>
                                <th>Author Name</th>
                                <th>Publication</th>
                                <th>Book Status</th>
                            </tr>';
                if (count($book)>0) {
                    // concatenate output to the array
                    // loop through the result array
                    foreach ($book as $key => $row)
                    {
                            $output .= '<tr>'. 
                            '<td>'.++$key.'</td>'.
                            '<td>'.$row->book_name.'</td>'. 
                            '<td>'.$row->book_no.'</td>'. 
                            '<td>'.$row->author_name.'</td>'. 
                            '<td>'.$row->publication.'</td>';
                            if($row->book_status == 1)
                            {
                                $output .= '<td>Available</td>';  
                            }
                            else{
                            $output .= '<td>Issued</td>'; 
                            }
                            '</tr>';
                        
                    }
                    // end of output
                }
                
                else {
                    // if there's no matching results according to the input
                    $output .= 'No results';
                }
                $output .= '</table></div></div></div>';
                
                return $output;
            }
        }
        if($request->category == "g"){
            $book = StudentBook::where('author_name', 'LIKE', $request->search_author_name
            .'%')->get();
            $availableBook = StudentBook::where('author_name', 'LIKE', $request->search_author_name
            .'%')->where('book_status', 1)->get();
            $issueBook = StudentBook::where('author_name', 'LIKE', $request->search_author_name
            .'%')->where('book_status', 0)->get();
            $output = '<div class="card shadow mb-4">
            <div class="card-header">General Books</div>
            <div class="card-body">
                <div class="row mb-4">
                    <div class="col-md-3">
                        <p><b>Total Books :- </b>'.count($book).'</p>
                    </div>
                    <div class="col-md-3">
                        <p><b>Available Books :- </b>'.count($availableBook).'</p>
                    </div>
                    <div class="col-md-3">
                        <p><b>Issue Books :- </b>'.count($issueBook).'</p>
                    </div>
                </div>
                <div class="table-responsive">
                    <table class="table table-bordered" id="dataTable">
                        <tr>
                            <th>Sr. No.</th>
                            <th>Book Name</th>
                            <th>Book No.</th>
                            <th>Author Name</th>
                            <th>Publication</th>
                            <th>Book Status</th>
                        </tr>';
            if (count($book)>0) {
                // concatenate output to the array
                // loop through the result array
                foreach ($book as $key => $row)
                {
                        $output .= '<tr>'. 
                        '<td>'.++$key.'</td>'.
                        '<td>'.$row->book_name.'</td>'. 
                        '<td>'.$row->book_no.'</td>'. 
                        '<td>'.$row->author_name.'</td>'. 
                        '<td>'.$row->publication.'</td>';
                        if($row->book_status == 1)
                        {
                            $output .= '<td>Available</td>';  
                        }
                        else{
                        $output .= '<td>Issued</td>'; 
                        }
                        '</tr>';
                    
                }
                // end of output
            }
            
            else {
                // if there's no matching results according to the input
                $output .= 'No results';
            }
            $output .= '</table></div></div></div>';
            
            return $output;
        }
    }

    public function searchBookByMedium(Request $request)
    {
        if($request->ajax())
        {
            if($request->category == "p")
            {
                $category = $request->category;
                $book = LibraryBook::where('medium', $request->medium)->get();
                $availableBook = LibraryBook::where('medium', $request->medium)->where('book_status', 1)->get();
                $issueBook = LibraryBook::where('medium', $request->medium)->where('book_status', 0)->get();
            }
            if($request->category == "g")
            {
                $book = StudentBook::where('medium', $request->medium)->get();
                $availableBook = StudentBook::where('medium', $request->medium)->where('book_status', 1)->get();
                $issueBook = StudentBook::where('medium', $request->medium)->where('book_status', 0)->get();
            }

            $output = '<div class="card shadow mb-4">
            <div class="card-header">'; if($request->category == "p"){  $output .= 'Pustak Pedhi';} if($request->category == "g"){  $output .= 'General Book';} $output .='</div>
            <div class="card-body">
                <div class="row mb-4">
                    <div class="col-md-3">
                        <p><b>Total Books :- </b>'.count($book).'</p>
                    </div>
                    <div class="col-md-3">
                        <p><b>Available Books :- </b>'.count($availableBook).'</p>
                    </div>
                    <div class="col-md-3">
                        <p><b>Issue Books :- </b>'.count($issueBook).'</p>
                    </div>
                </div>
                <div class="table-responsive">
                    <table class="table table-bordered" id="dataTable">
                        <tr>
                            <th>Sr. No.</th>
                            <th>Book Name</th>
                            <th>Book No.</th>
                            <th>Author Name</th>
                            <th>Publication</th>
                            <th>Book Status</th>
                        </tr>';
            if (count($book)>0) {
                // concatenate output to the array
                // loop through the result array
                foreach ($book as $key => $row)
                {
                        $output .= '<tr>'. 
                        '<td>'.++$key.'</td>'.
                        '<td>'.$row->book_name.'</td>'. 
                        '<td>'.$row->book_no.'</td>'. 
                        '<td>'.$row->author_name.'</td>'. 
                        '<td>'.$row->publication.'</td>';
                        if($row->book_status == 1)
                        {
                            $output .= '<td>Available</td>';  
                        }
                        else{
                        $output .= '<td>Issued</td>'; 
                        }
                        '</tr>';
                    
                }
                // end of output
            }
            
            else {
                // if there's no matching results according to the input
                $output .= 'No results';
            }
            $output .= '</table></div></div></div>';
            
            return $output;
        }
    }
}
