<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('auth.login');
});

Auth::routes();

Route::get('/home', 'HomeController@index')->name('home');

Route::namespace('Admin')->prefix('admin')->name('admin.')->middleware('can:admin')->group(function(){
    Route::resource('/users', 'UserController');
    Route::resource('/category', 'CategoryController');
    Route::resource('/books', 'BooksController');
    Route::resource('/journals', 'JournalController');
    Route::resource('/videos', 'VideosController');
    Route::get('/journal-list', 'LibraryJournalController@journalList');
    Route::post('/uploadFile', 'LibraryJournalController@uploadCsvFile')->name('upload.csv.file');
    Route::get('/edit-journal/{id}', 'LibraryJournalController@editJournal');
    Route::put('/update-journal/{id}', 'LibraryJournalController@updateJournal')->name('journal.update');
    Route::delete('/delete-journal/{id}', 'LibraryJournalController@deleteJournal')->name('journal.delete');
    Route::post('/add-journal', 'LibraryJournalController@addJournal')->name('journal.add');
    Route::resource('/academic-year', 'AcademicYearController');
    Route::resource('/department', 'DepartmentController');
    Route::resource('/courses', 'CourseController');
    Route::resource('/authors', 'AuthorController');
    Route::resource('/sellers', 'SellerController');
    Route::resource('/publications', 'PublicationController');
    Route::resource('/student-bt-card', 'StudentBTCardController');
    Route::resource('/faculty-bt-card', 'FacultyBTCardController');
    Route::resource('/rack-with-wing', 'RackWingController');
    Route::resource('/libraryBook', 'LibraryBookController');
    Route::resource('/generalBook', 'GeneralBookController');
    Route::post('/uploadBookFile', 'LibraryBookController@uploadCsvFile');
    Route::post('/generalBookFile', 'GeneralBookController@generalBookFile');
    Route::resource('/computers', 'ComputerController');
    Route::resource('bookTransaction', 'BookTransactionController');
    Route::get('/studentBTCard', 'BookTransactionController@searchStudentBTCard')->name('searchStudentBTCard');
    Route::get('/searchBookCode', 'BookTransactionController@searchBookCode')->name('searchBookCode');
    Route::get('/searchGeneralBookCode', 'GeneralBookController@searchGeneralBookCode')->name('searchGeneralBookCode');
    Route::resource('/libraryAccession', 'LibraryAccessionController');
    Route::post('/updateLibraryAccessionTime', 'LibraryAccessionController@updateLibraryAccessionTime')->name('libraryAccession.updatetime');
    Route::get('/studentBookIssueForm/{id}', 'BookTransactionController@studentBookIssueForm')->name('studentBookIssueForm');
    Route::post('/studentBookIssueForm/submit', 'BookTransactionController@studentBookIssueFormSubmit')->name('studentBookIssueForm.submit');
    Route::post('/studentBookIssueForm/update', 'BookTransactionController@studentBookIssueFormUpdate')->name('studentBookIssue.update');
    Route::resource('/computerAccession', 'ComputerAccessionController');
    Route::post('/updateComputerAccessionTime', 'ComputerAccessionController@updateComputerAccessionTime')->name('computerAccession.updatetime');
    Route::resource('/departmentLibrary', 'DepartmentLibraryController');
    Route::get('/departmentBooks/{id}', 'DepartmentLibraryController@viewDepartmentBook')->name('viewDepartmentBook');
    Route::resource('/magazines', 'MagazineController');
    Route::resource('/bookBank', 'BookBankController');
    Route::post('/bookBank/submit', 'BookBankController@submit')->name('bookBank.submit');
    Route::post('/studentBookRenew', 'BookTransactionController@studentBookRenew')->name('studentBookIssue.renew');
    Route::resource('/facultyBookIssue', 'FacultyBookIssueController');
    Route::get('/facultyRecord', 'FacultyBookIssueController@facultyRecord')->name('facultyRecord');
    Route::post('/facultyBookIssue/submit', 'FacultyBookIssueController@facultyBookIssueSubmit')->name('facultyBookIssue.submit');
    Route::post('/facultyBookRenew', 'FacultyBookIssueController@facultyBookRenew')->name('facultyBookIssue.renew');
    Route::get('/search', 'SearchController@search')->name('search');
    Route::post('/fetch', 'SearchController@fetch')->name('fetch');
    Route::get('/searchBookDetails', 'SearchController@searchBookDetails')->name('searchBookDetails');
    Route::get('/searchBookNo', 'SearchController@searchBookNo')->name('searchBookNo');
    Route::get('/searchBookName', 'SearchController@searchBookName')->name('searchBookName');
    Route::get('/searchAuthorName', 'SearchController@searchAuthorName')->name('searchAuthorName');
    Route::get('/searchBookByMedium', 'SearchController@searchBookByMedium')->name('searchBookByMedium');
});
Route::get('/user/books', 'Admin\BooksController@viewBook')->middleware('can:user')->name('user.books.index');
Route::get('/book/{id}', 'Admin\BooksController@showBook')->name('book.view');
Route::get('/user/journals', 'Admin\JournalController@viewJournal')->name('user.journals.index');
Route::get('/journal/{id}', 'Admin\JournalController@showJournal')->name('journal.view');
Route::get('/user/videos', 'Admin\VideosController@viewVideo')->name('user.videos.index');
