<?php

namespace App\Admin;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class StudentBook extends Model
{
    protected $table = "student_books";

    protected $fillable = ['reg_no','book_code', 'book_no', 'author_name', 'book_name', 'price', 'publication', 'no_of_pages', 'seller', 'bill_no', 'bill_date', 'rack_no', 'receipt_no', 'receipt_date', 'scheme', 'status', 'department', 'medium', 'remark'];
    public static function insertData($data){

        $value=DB::table('student_books')->where('reg_no', $data['reg_no'])->get();
        if($value->count() == 0){
           DB::table('student_books')->insert($data);
        }
     }
}
