<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateStudentBooksTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('student_books', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('reg_no');
            $table->string('book_code');
            $table->string('book_no');
            $table->string('author_name');
            $table->string('book_name');
            $table->string('price');
            $table->string('publication');
            $table->string('no_of_pages');
            $table->string('seller');
            $table->string('bill_no');
            $table->string('bill_date');
            $table->string('rack_no');
            $table->string('receipt_no');
            $table->string('receipt_date');
            $table->string('scheme');
            $table->string('status');
            $table->string('department');
            $table->string('medium');
            $table->string('remark');
            $table->boolean('book_status')->default(1);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('student_books');
    }
}
