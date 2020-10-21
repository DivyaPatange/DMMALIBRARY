<?php

namespace App\Admin;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class LibraryJournal extends Model
{
    
    protected $table = "library_journal";
    protected $fillable = ['registration_no', 'author_name', 'name', 'price', 'pages', 'publisher', 'seller', 'date', 'bill_no'];
    public static function insertData($data){

        $value=DB::table('library_journal')->where('registration_no', $data['registration_no'])->get();
        if($value->count() == 0){
           DB::table('library_journal')->insert($data);
        }
     }
}
