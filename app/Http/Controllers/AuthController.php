<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\User;
use Auth;

class AuthController extends Controller
{
    public function register(Request $request, User $user)
    {

        $this->validate($request,[
            'name'      => 'required|min:3',
            'email'     => 'required|email|unique:users',
            'password'  => 'required|min:3',
        ]);

        $user = $user->create([
            'name'      => $request->name,
            'email'     => $request->email,
            'password'  => bcrypt($request->password),
            'api_token' => bcrypt($request->email),
        ]);

        return response()->json([
            'value'     => false,
            'message'   => 'Registered Successfully',
            'data'      => $user
        ]);
    
    }

    public function login(Request $request, User $user)
    {

        $this->validate($request,[
            'email'     => 'required',
            'password'  => 'required',
        ]);

        if(!Auth::attempt(['email' => $request->email, 'password' => $request->password]))
        {
            return response()->json([
                'value'     => true,
                'message'   => 'Login Failed'
            ], 401);
        }

        $user = $user->find(Auth::user()->id);

        return response()->json([
            'value'     => false,
            'message'   => 'Login Successfully',
            'data'      => $user
        ]);
    }
}
