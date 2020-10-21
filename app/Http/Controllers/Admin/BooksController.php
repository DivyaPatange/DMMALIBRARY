<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Admin\Book;
use App\Admin\Category;

class BooksController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $books = Book::all();
        $category = Category::all();
        return view('auth.books.index', compact('category', 'books'));
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
            'category_name' => 'required',
            'book_name' => 'required',
            'author_name' => 'required',
            'book_pdf' => 'required',
        ]);
        $cvrimage = $request->file('book_pdf');
        $image_name = rand() . '.' . $cvrimage->getClientOriginalExtension();
        // $cvrimage->storeAs('public/tempcourseimg',$image_name);
        $cvrimage->move(public_path('Pdf'), $image_name);
        $book = new Book();
        $book->cat_id = $request->category_name;
        $book->book_name = $request->book_name;
        $book->author_name = $request->author_name;
        $book->book_pdf = $image_name;
        $book->save();

        return redirect('/admin/books')->with('success', 'Book Added Successfully!');
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
        $book = Book::findorfail($id);
        $category = Category::all();
        return view('auth.books.edit', compact('book', 'category'));
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
        $image_name = $request->hidden_image;
        $image = $request->file('book_pdf');
        if($image != '')
        {
            $request->validate([
                'book_name' => 'required',
                'book_pdf' => 'required|mimes:pdf',
                'category_name' => 'required',
                'author_name' => 'required'
            ]);
        $image_name = rand() . '.' . $image->getClientOriginalExtension();
        // $image->storeAs('public/tempcourseimg',$image_name);
        $image->move(public_path('Pdf'), $image_name);
        }
        else{
            $request->validate([
                'book_name' => 'required',
                // 'book_pdf' => 'required|mimes:pdf',
                'category_name' => 'required',
                'author_name' => 'required'
            ]);
        }
        $input_data = array (
            'cat_id' => $request->category_name,
            'book_pdf' => $image_name,
            'book_name' => $request->book_name,
            'author_name' => $request->author_name,
        );

        Book::whereId($id)->update($input_data);
        return redirect('/admin/books')->with('success', 'Book Updated Successfully!');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $book = Book::findorfail($id);
        unlink(public_path('Pdf/'.$book->book_pdf));
        $book->delete();
        return redirect('/admin/books')->with('success', 'Book Deleted Successfully!');
    }

    public function viewBook()
    {
        $books = Book::all();
        return view('auth.books.show', compact('books'));
    }

    public function showBook($id)
    {
        $book = Book::findorfail($id);
        return view('auth.books.view', compact('book'));
    }
}
