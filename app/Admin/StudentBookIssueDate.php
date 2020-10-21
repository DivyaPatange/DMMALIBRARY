<?php

namespace App\Admin;

use Illuminate\Database\Eloquent\Model;

class StudentBookIssueDate extends Model
{
    protected $table = "student_book_issue_dates";

    protected $fillable = ['student_book_issue_id', 'issue_date', 'expected_return_date'];
}
