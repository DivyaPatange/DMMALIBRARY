<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Admin\StudentBook;
use App\Admin\Author;
use App\Admin\Publication;
use App\Admin\Seller;
use App\Admin\RackWing;
use App\Admin\Department;

class GeneralBookController extends Controller
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
        $generalBook = StudentBook::all();
        return view('auth.generalBook.index', compact('generalBook', 'author', 'publication', 'seller', 'rackWing','department'));
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
        $libraryBook = new StudentBook();
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
        return redirect('/admin/generalBook')->with('success', 'Book added successfully!');
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
        $generalBook = StudentBook::findorfail($id);
        $author = Author::all();
        $publication = Publication::all();
        $seller = Seller::all();
        $rackWing = RackWing::all();
        $department = Department::all();
        return view('auth.generalBook.edit', compact('generalBook', 'author', 'publication', 'seller', 'department', 'rackWing'));
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
        $libraryBook = StudentBook::findorfail($id);
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
        return redirect('/admin/generalBook')->with('success', 'Book updated successfully!');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $generalBook = StudentBook::findorfail($id);
        $generalBook->delete();
        return redirect('/admin/generalBook')->with('success', 'Book Record Deleted Successfully!');
    }

    public function generalBookFile(Request $request)
    {
        if ($request->input('submit') != null )
        {
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
            if(in_array(strtolower($extension),$valid_extension))
            {
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
                while (($filedata = fgetcsv($file, 10000, ",")) !== FALSE) 
                {
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
                foreach($importData_arr as $importData)
                {
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
                    StudentBook::insertData($insertData);
                }
                Session::flash('success','Import Successful.');
            }
            else
            {
                Session::flash('success','Invalid File Extension.');
            }
        }
        // Redirect to index
        return redirect('/admin/generalBook');
    }

    public function searchGeneralBookCode(Request $request)
    {
        if($request->ajax()) {
            // select country name from database
            $data = StudentBook::where('book_no', 'LIKE', $request->general_book_code.'%')
                ->get();
                
        
            // declare an empty array for output
            $output = '';
            // if searched countries count is larager than zero
            // dd(!(isset($data)) || empty($data));
            if(!(isset($data)) || empty($data))
                {
                    return array("error","Please Enter Valid Referral Code");
                }
            if (count($data)>0) {
                // concatenate output to the array
                // loop through the result array
                foreach ($data as $row){
                    // dd($request->user_referral_info == $row->referral_code);
                    if($request->general_book_code == $row->book_no){
                    // concatenate output to the array
                    // $parentName = User::where('id', $row->parent_id)->first();

                       $output .= '<p><b>Book Name:- </b>'.$row->book_name.'</p>'. 
                       '<p><b>Author Name:- </b>'.$row->author_name.'</p>'. 
                       '<p><b>Publication:- </b>'.$row->publication.'</p>'. 
                       '<p><b>Department:- </b>'.$row->department.'</p>';
                        
                        
                    }
                }
                // end of output
            }
            
            else {
                // if there's no matching results according to the input
                $output .= '<p class="text-danger">No results</p>';
            }
            // return output result array
            return $output;
        }
    }
}
