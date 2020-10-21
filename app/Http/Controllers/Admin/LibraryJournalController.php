<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Admin\LibraryJournal;
use Session;

class LibraryJournalController extends Controller
{
    public function journalList()
    {
        $journals = LibraryJournal::all();
        return view('auth.journals.uploadCsvFile', compact('journals'));
    }

    public function uploadCsvFile(Request $request)
    {
        if ($request->input('submit') != null ){

         $request->validate([
            'file' => 'required',
         ]);
            $file = $request->file('file');
      
            // File Details 
            $filename = $file->getClientOriginalName();
            $extension = $file->getClientOriginalExtension();
            $tempPath = $file->getRealPath();
            $fileSize = $file->getSize();
            $mimeType = $file->getMimeType();
      
            // Valid File Extensions
            $valid_extension = array("csv");
      
            // 2MB in Bytes
            $maxFileSize = 2097152; 
      
            // Check file extension
            if(in_array(strtolower($extension),$valid_extension)){
      
              // Check file size
              if($fileSize <= $maxFileSize){
      
                // File upload location
                $location = 'uploads';
      
                // Upload file
                $file->move($location,$filename);
      
                // Import CSV to Database
                $filepath = public_path($location."/".$filename);
      
                // Reading file
                $file = fopen($filepath,"r");
      
                $importData_arr = array();
                $i = 0;
      
                while (($filedata = fgetcsv($file, 1000, ",")) !== FALSE) {
                   $num = count($filedata );
                   
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
      
                // Insert to MySQL database
                foreach($importData_arr as $importData){
                  //   dd($importData[1]);
                  $insertData = array(
                     "registration_no"=>$importData[0],
                     "author_name"=>$importData[1],
                     "name"=>$importData[2],
                     "price"=>$importData[3],
                     "pages"=>$importData[4],
                     "publisher"=>$importData[5],
                     "seller"=>$importData[6],
                     "date"=>$importData[7],
                     "bill_no"=>$importData[8]);
                  LibraryJournal::insertData($insertData);
      
                }
      
                Session::flash('success','Import Successful.');
              }else{
                Session::flash('danger','File too large. File must be less than 2MB.');
              }
      
            }else{
               Session::flash('success','Invalid File Extension.');
            }
      
          }
      
          // Redirect to index
          return redirect('/admin/journal-list');
    }

   public function addJournal(Request $request)
   {
      $request->validate([
         'author_name' => 'required',
         'name' => 'required',
      ]);
      $journal = new LibraryJournal();
      $journal->registration_no = $request->registration_no;
      $journal->author_name = $request->author_name;
      $journal->name = $request->name;
      $journal->price = $request->price;
      $journal->pages = $request->pages;
      $journal->publisher = $request->publisher;
      $journal->seller = $request->seller;
      $journal->date = $request->date;
      $journal->bill_no = $request->bill_no;
      $journal->save();
      return redirect('/admin/journal-list')->with('success', 'Journal added successfully.');
   }

    public function editJournal($id)
    {
         $journal = LibraryJournal::findorfail($id);
         return view('auth.journals.editJournal', compact('journal'));
    }

   public function updateJournal(Request $request, $id)
   {
      $journal = LibraryJournal::findorfail($id);
      $request->validate([
         'author_name' => 'required',
         'name' => 'required',
      ]);
      $journal->registration_no = $request->registration_no;
      $journal->author_name = $request->author_name;
      $journal->name = $request->name;
      $journal->price = $request->price;
      $journal->pages = $request->pages;
      $journal->publisher = $request->publisher;
      $journal->seller = $request->seller;
      $journal->date = $request->date;
      $journal->bill_no = $request->bill_no;
      $journal->update($request->all());
      return redirect('/admin/journal-list')->with('success', 'Journal Updated Successfully.');
   }

   public function deleteJournal($id)
   {
      $journal = LibraryJournal::findorfail($id);
      $journal->delete();
      return redirect('/admin/journal-list')->with('success', 'Journal Deleted Successfully.');
   }
}
