<?php

namespace App\Admin;

use Illuminate\Database\Eloquent\Model;

class FacultyBookIssueDate extends Model
{
    protected $table = "faculty_book_issue_dates";

    protected $fillable = ['faculty_book_issue_id','issue_date', 'expected_return_date'];
}
