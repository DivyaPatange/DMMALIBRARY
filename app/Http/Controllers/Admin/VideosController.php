<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Admin\Video;

class VideosController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $videos = Video::all();
        return view('auth.videos.index', compact('videos'));
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
            'title' => 'required',
            'video' => 'required',
        ]);
        $path = public_path().'/Video/';
            //upload new file
            $file = $request->video;
            $filename = $file->getClientOriginalName();
            $file->move($path, $filename);
        $video = new Video();
        $video->title = $request->title;
        $video->video = $filename;
        $video->save();

        return redirect('/admin/videos')->with('success', 'Video Added Successfully!');
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
        $video = Video::findorfail($id);
        return view('auth.videos.edit', compact('video'));
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
        $filename = $request->hidden_image;
        $path = public_path().'/Video/';
        $file = $request->file('video');
        if($file != '')
        {
            $request->validate([
                'title' => 'required',
                'video' => 'required',
            ]);
            unlink(public_path('Video/'.$filename));
        $filename = $file->getClientOriginalName();
        // $image->storeAs('public/tempcourseimg',$image_name);
        $file->move($path, $filename);

        }
        else{
            $request->validate([
                'title' => 'required',
            ]);
        }
        $input_data = array (
            'title' => $request->title,
            'video' => $filename,
        );

        Video::whereId($id)->update($input_data);
        return redirect('/admin/videos')->with('success', 'Video Updated Successfully!');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $video = Video::findorfail($id);
        unlink(public_path('Video/'.$video->video));
        $video->delete();
        return redirect('/admin/videos')->with('success', 'Video Deleted Successfully!');
    }


    public function viewVideo()
    {
        $videos = Video::all();
        return view('auth.videos.show', compact('videos'));
    }
}
