<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Note;
use App\User;
use Auth;

class NoteController extends Controller
{
    public function create(Request $request, Note $note)
    {
        $this->validate($request,[
            'title'     => 'required|min:3',
            'content'   => 'required|min:3',
        ]);

        $note = $note->create([
            'user_id'   => Auth::user()->id,
            'title'     => $request->title,
            'content'   => $request->content,
        ]);

        return response()->json([
            'value'     => false,
            'message'   => 'Note Created !',
            'data'      => $note
        ]);
    }

    public function update(Request $request, Note $note, $id)
    {

        $this->validate($request,[
            'title'     => 'required|min:3',
            'content'   => 'required|min:3',
        ]);

        $note = $note->find($id);
        $note->update([
            'title'     => $request->title,
            'content'   => $request->content,
        ]);

        return response()->json([
            'value'     => false,
            'message'   => 'Note Updated !',
            'data'      => $note
        ]);

    }

    public function delete(Note $note, $id)
    {
        $note = $note->find($id);
        $note->delete();

        return response()->json([
            'value'     => false,
            'message'   => 'Note Deleted !'
        ]);
    }

    public function read(Note $note)
    {
        $note = $note->orderBy('id', 'DESC')->get();

        return response()->json([
            'value'     => false,
            'message'   => 'Readed !',
            'data'      => $note
        ]);
    }

    public function paginate(Note $note)
    {
        $note = $note->orderBy('id','desc')->paginate(10);

        return response()->json($note, 200);
    }

    public function search(Request $request, Note $note)
    {
        $search = $request->get('search');
        $note   = $note->orderBy('id', 'DESC')->where('title', 'like', "%{$search}%")->get();

        //kalau lebih dari 2 search nya
        /* $note   = $note->orderBy('id', 'DESC')->where('title', 'like', "%{$search}%")
                                                ->orWhere('content', 'like', "%{$search}%")
                                                ->get(); */
        
        //kalau search tidak menggunakan orderBy
        /* 
            $note   = $note->where('title', 'like', "%{$search}%")->get();
        */

        return response()->json([
            'value'     => false,
            'message'   => 'Search Successfully',
            'data'      => $note
        ], 200);
    }
}
