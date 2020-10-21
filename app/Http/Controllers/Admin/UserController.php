<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\User;
use App\Admin\UserInfo;
use DB;

class UserController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $users = DB::table('users')->join('users_info', 'users_info.user_id', '=', 'users.id')->get();
        // dd($users);
        return view('auth.users.index', compact('users'));
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
        //
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
        $user = User::findorfail($id);
        // dd($user);
        $userInfo = UserInfo::where('user_id', $id)->first();
        // dd($userInfo);
        return view('auth.users.edit', compact('user', 'userInfo'));
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
        $user = User::findorfail($id);
        $userInfo = UserInfo::where('user_id', $id)->first();
        $user->name = $request->name;
        $user->email = $request->email;
        $user->update($request->all());

        $userInfo->mobile = $request->mobile;
        $userInfo->address = $request->address;
        $userInfo->update($request->all());
        return redirect()->route('admin.users.index')->with('success', 'User Updated Successfully!');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $user = User::findorfail($id);
        $userInfo = UserInfo::where('user_id', $id)->first();
        $user ->delete();
        if(!empty($userInfo)){
        $userInfo->delete();
        }
        return redirect()->route('admin.users.index')->with('success', 'User Deleted Successfully!');
    }
}
