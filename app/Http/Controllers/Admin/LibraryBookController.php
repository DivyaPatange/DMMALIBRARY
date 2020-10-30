<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Admin\LibraryBook;
use App\Admin\Author;
use App\Admin\Publication;
use App\Admin\Seller;
use App\Admin\RackWing;
use App\Admin\Department;
use Session;

class LibraryBookController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $author = Author::all();
        $publication = Publication::all();
        $seller = Seller::all();
        $rackWing = RackWing::all();
        $department = Department::all();
        $libraryBook = LibraryBook::all();
        return view('auth.libraryBook.index', compact('libraryBook', 'author', 'publication', 'seller', 'rackWing', 'department'));
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
            'book_no' => 'required',
            'author_name' => 'required',
            'book_name' => 'required',
            'price' => 'required',
            'publication' => 'required',
            'no_of_pages' => 'required',
            'seller' => 'required',
            'bill_no' => 'required',
            'bill_date' => 'required',
            'rack_no' => 'required',
            'receipt_no' => 'required',
            'receipt_date' => 'required',
            'department' => 'required',
            'medium' => 'required',
        ]);
        $libraryBook = new LibraryBook();
        $libraryBook->reg_no = $request->reg_no;
        $libraryBook->book_code = $request->book_code;
        $libraryBook->book_no = $request->book_no;
        $libraryBook->author_name = $request->author_name;
        $libraryBook->book_name = $request->book_name;
        $libraryBook->price = $request->price;
        $libraryBook->publication = $request->publication;
        $libraryBook->no_of_pages = $request->no_of_pages;
        $libraryBook->seller = $request->seller;
        $libraryBook->bill_no = $request->bill_no;
        $libraryBook->bill_date = $request->bill_date;
        $libraryBook->rack_no = $request->rack_no;
        $libraryBook->receipt_no = $request->receipt_no;
        $libraryBook->receipt_date = $request->receipt_date;
        $libraryBook->scheme = $request->scheme;
        $libraryBook->status = $request->status;
        $libraryBook->department = $request->department;
        $libraryBook->medium = $request->medium;
        $libraryBook->remark = $request->remark;
        $libraryBook->save();
        return redirect('/admin/libraryBook')->with('success', 'Library Book added successfully!');
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
        $libraryBook = LibraryBook::findorfail($id);
        $author = Author::all();
        $publication = Publication::all();
        $seller = Seller::all();
        $rackWing = RackWing::all();
        $department = Department::all();
        return view('auth.libraryBook.edit', compact('libraryBook', 'author', 'publication', 'seller', 'rackWing', 'department'));
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
            'book_code' => 'required',
            'book_no' => 'required',
            'author_name' => 'required',
            'book_name' => 'required',
            'price' => 'required',
            'publication' => 'required',
            'no_of_pages' => 'required',
            'seller' => 'required',
            'bill_no' => 'required',
            'bill_date' => 'required',
            'rack_no' => 'required',
            'receipt_no' => 'required',
            'receipt_date' => 'required',
            'department' => 'required',
            'medium' => 'required',
        ]);
        $libraryBook = LibraryBook::findorfail($id);
        // dd($libraryBook);
        $libraryBook->reg_no = $request->reg_no;
        $libraryBook->book_code = $request->book_code;
        $libraryBook->book_no = $request->book_no;
        $libraryBook->author_name = $request->author_name;
        $libraryBook->book_name = $request->book_name;
        $libraryBook->price = $request->price;
        $libraryBook->publication = $request->publication;
        $libraryBook->no_of_pages = $request->no_of_pages;
        $libraryBook->seller = $request->seller;
        $libraryBook->bill_no = $request->bill_no;
        $libraryBook->bill_date = $request->bill_date;
        $libraryBook->rack_no = $request->rack_no;
        $libraryBook->receipt_no = $request->receipt_no;
        $libraryBook->receipt_date = $request->receipt_date;
        $libraryBook->scheme = $request->scheme;
        $libraryBook->status = $request->status;
        $libraryBook->department = $request->department;
        $libraryBook->medium = $request->medium;
        $libraryBook->remark = $request->remark;
        $libraryBook->update($request->all());
        return redirect('/admin/libraryBook')->with('success', 'Library Book updated successfully!');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $libraryBook = LibraryBook::findorfail($id);
        $libraryBook->delete();
        return redirect('/admin/libraryBook')->with('success', 'Library Book deleted successfully! ');
    }

    public function uploadCsvFile(Request $request)
    {
        if ($request->input('submit') != null ){

            // $request->validate([
            //    'file' => 'required|file',
            // ]);
               $file = $request->file('file');
                // dd($file);
               // File Details 
               $filename = $file->getClientOriginalName();
               $extension = $file->getClientOriginalExtension();
               $tempPath = $file->getRealPath();
            //    dd($mimeType);
               // Valid File Extensions
               $valid_extension = array("csv");
         
               // 2MB in Bytes
               $maxFileSize = 7097152; 
         
               // Check file extension
               if(in_array(strtolower($extension),$valid_extension)){
         
         
                   // File upload location
                   $location = 'books';
         
                   // Upload file
                   $file->move($location,$filename);
         
                   // Import CSV to Database
                   $filepath = public_path($location."/".$filename);
         
                   // Reading file
                   $file = fopen($filepath,"r");
         
                   $importData_arr = array();
                   $i = 0;
                    // dd(fgetcsv($file, 10000, ","));
                   while (($filedata = fgetcsv($file, 10000, ",")) !== FALSE) {
                      $num = count($filedata );
                    //   dd($num);
                      // Skip first row (Remove below comment if you want to skip the first row)
                      /*if($i == 0){
                         $i++;
                         continue; 
                      }*/
                      for ($c=0; $c < $num; $c++) {
                         $importData_arr[$i][] = $filedata [$c];
                      }
                      $i++;
                   }
                   fclose($file);
                //    dd($importData_arr);
                   // Insert to MySQL database
                   foreach($importData_arr as $importData){
                     //   dd($importData[1]);
                     $insertData = array(
                        "reg_no" => $importData[0],
                        "book_code"=>$importData[1],
                        "book_no"=>$importData[2],
                        "author_name"=>$importData[3],
                        "book_name"=>$importData[4],
                        "price"=>$importData[5],
                        "publication"=>$importData[6],
                        "no_of_pages"=>$importData[7],
                        "seller"=>$importData[8],
                        "bill_no"=>$importData[9],
                        "bill_date"=>$importData[10],
                        "rack_no"=>$importData[11],
                        "receipt_no"=>$importData[12],
                        "receipt_date"=>$importData[13],
                        "scheme"=>$importData[14],
                        "status"=>$importData[15],
                        "department"=>$importData[16],
                        "medium"=>$importData[17],
                        "remark"=>$importData[18]);
                     LibraryBook::insertData($insertData);
         
                   }
         
                   Session::flash('success','Import Successful.');
                 
         
               }else{
                  Session::flash('success','Invalid File Extension.');
               }
         
             }
         
             // Redirect to index
             return redirect('/admin/libraryBook');
    }
}
