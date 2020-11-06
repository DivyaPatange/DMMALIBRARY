<?php

namespace App\Admin;

use Illuminate\Database\Eloquent\Model;

class StudentBookIssue extends Model
{
    protected $table = "student_book_issues";

    protected $fillable  = ['bookTransaction_id', 'book_no', 'category' ,'actual_return_date', 'book_status', 'status'];
}
