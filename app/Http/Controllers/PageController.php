<?php

namespace App\Http\Controllers;

use App\Models\Post;
use Illuminate\Http\Request;

class PageController extends Controller
{
    public function dashboard(Request $request){

        if ($request->get('for-my')) {
            //$posts = Post::where('user_id', $request->user()->id)->latest()->get();
            $posts = $request->user()->posts;
        }else{
            $posts = Post::latest()->get();
        }
        return view('dashboard', compact('posts'));
    }
}
