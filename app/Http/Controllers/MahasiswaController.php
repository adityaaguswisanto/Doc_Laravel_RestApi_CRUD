<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Mahasiswa;
use Auth;

class MahasiswaController extends Controller
{
    public function create(Request $request, Mahasiswa $mahasiswa)
    {
        $this->validate($request,[
            'nim'    => 'required|int|unique:mahasiswas',
            'nama'   => 'required|min:3',
            'foto'   => 'required|image',
        ]);

        $foto       = $request->file('foto'); //menandakan bahwa field yang akan di isi adalah berbentuk file
        $time       = time();                 //membuat waktu
        $name_foto  = $time . '.' . $foto->getClientOriginalExtension(); //ambil waktu + titik + extensi nya yaitu png/jpeg/jpg dll

        $foto->move('foto', $name_foto); //file pindah ke folder foto

        $mahasiswa = $mahasiswa->create([
            'user_id'  => Auth::user()->id,
            'nim'      => $request->nim,
            'nama'     => $request->nama,
            'foto'     => $name_foto,
        ]);

        return response()->json([
            'value'     => false,
            'message'   => 'Mahasiswa Created !',
            'data'      => $mahasiswa
        ]);
    }

    public function update(Request $request, Mahasiswa $mahasiswa, $id)
    {
        $this->validate($request,[
            'nim'    => 'required',
            'nama'   => 'required|min:3',
            'foto'   => 'required|image',
        ]);

        $mahasiswa = $mahasiswa->find($id);

        if($mahasiswa == null) {
            return  response()->json([
                'value' => true,
                'message' => 'Error, ID Mahasiswa Not Found',
            ]);
        }

        if($request->hasFile('foto')) {
            unlink('foto/' . $mahasiswa->foto);
            $foto       = $request->file('foto');
            $time       = time();
            $name_foto  = $time . '.' . $foto->getClientOriginalExtension();

            $foto->move('foto', $name_foto);

            $mahasiswa->foto = $name_foto;
        }

        $mahasiswa->nim     = $request->nim;
        $mahasiswa->nama    = $request->nama;
        $mahasiswa->save();

        return response()->json([
            'value' => false,
            'message' => 'Succes Update Mahasiswa',
            'data' => $mahasiswa
        ]);

    }

    public function delete(Request $request, Mahasiswa $mahasiswa, $id)
    {
        $mahasiswa = $mahasiswa->find($id);

        if($mahasiswa == null) {
            return  response()->json([
                'value' => true,
                'message' => 'Error, ID Mahasiswa Not Found',
            ]);
        }
        
        $file_path = 'foto/'.$mahasiswa->foto;
        unlink($file_path);
        $mahasiswa->delete();

        return response()->json([
            'value' => false,
            'message' => 'Success Delete Mahasiswa',
        ]);
    }

    public function read(Mahasiswa $mahasiswa)
    {
        $mahasiswa = $mahasiswa->orderBy('id', 'DESC')->get();

        return response()->json([
            'value'     => false,
            'message'   => 'Readed !',
            'data'      => $mahasiswa
        ]);
    }

    public function paginate(Mahasiswa $mahasiswa)
    {
        $mahasiswa = $mahasiswa->orderBy('id','desc')->paginate(10);

        return response()->json($mahasiswa, 200);
    }

    public function search(Request $request, Mahasiswa $mahasiswa)
    {
        $search     = $request->get('search');
        $mahasiswa  = $mahasiswa->orderBy('id', 'DESC')->where('nama', 'like', "%{$search}%")->get();

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
            'data'      => $mahasiswa
        ], 200);
    }
}
