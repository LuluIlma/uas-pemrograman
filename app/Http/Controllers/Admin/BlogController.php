<?php

namespace App\Http\Controllers\Admin;

use App\Models\Blog;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class BlogController extends Controller
{
    public function index()
    {
        $blogs = Blog::all();
        return view('admin.blog.blog', compact('blogs'));
    }

    public function create()
    {
        return view('admin.blog.create');
    }

    public function store(Request $request)
    {
        $request->validate([
            'path_img' => 'required|image|mimes:jpeg,png,jpg,gif|max:2048',
            'id_service' => 'required',
            'tags' => 'required',
            'authors' => 'required',
            'postdate' => 'required',
            'content' => 'required',
        ]);

        if ($request->hasFile('path_img')) {
            $image = $request->file('path_img');
            $path = $image->store('public/images');
            $url = Storage::url($path);

            // Save the URL to the image in the database
            $blog = new Blog;
            $blog->path_img = $url;
            $blog->id_service = $request->id_service;
            $blog->tags = $request->tags;
            $blog->authors = $request->authors;
            $blog->postdate = $request->postdate;
            $blog->content = $request->content;
            $blog->save();
        }

        return redirect()->route('blogs.index')
            ->with('success', 'Blog post created successfully.');
    }

    public function show($id)
    {
        $blog = Blog::findOrFail($id);
        return view('admin.blog.show', compact('blog'));
    }

    public function edit($id)
    {
        $blog = Blog::findOrFail($id);
        return view('admin.blog.edit', compact('blog'));
    }

    public function update(Request $request, $id)
    {
        $request->validate([
            'path_img' => 'nullable|image|mimes:jpeg,png,jpg,gif|max:2048',
            'id_service' => 'required',
            'tags' => 'required',
            'authors' => 'required',
            'postdate' => 'required',
            'content' => 'required',
        ]);

        $blog = Blog::findOrFail($id);

        if ($request->hasFile('path_img')) {
            Storage::delete($blog->path_img);

            $image = $request->file('path_img');
            $path = $image->store('public/images');
            $url = Storage::url($path);

            $blog->path_img = $url;
        }

        $blog->id_service = $request->id_service;
        $blog->tags = $request->tags;
        $blog->authors = $request->authors;
        $blog->postdate = $request->postdate;
        $blog->content = $request->content;
        $blog->save();

        return redirect()->route('admin.blog.blog')
            ->with('success', 'Blog post updated successfully.');
    }

    public function destroy($id)
    {
        $blog = Blog::findOrFail($id);
        Storage::delete($blog->path_img);
        $blog->delete();

        return redirect()->route('admin.blog.blog')
            ->with('success', 'Blog post deleted successfully.');
    }
}
