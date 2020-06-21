<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

Route::group(['prefix' => 'auth'], function(){
    Route::post('/register','AuthController@register');
    Route::post('/login','AuthController@login');
});

Route::group(['prefix' => 'note' , 'middleware' => 'auth:api'], function(){
    Route::post('/create','NoteController@create');
    Route::post('/update/{id}','NoteController@update');
    Route::post('/delete/{id}','NoteController@delete');
    Route::get('/read','NoteController@read');
    Route::get('/paginate','NoteController@paginate');
    Route::get('/search','NoteController@search');
});

Route::group(['prefix' => 'mahasiswa' , 'middleware' => 'auth:api'], function(){
    Route::post('/create','MahasiswaController@create');
    Route::post('/delete/{id}','MahasiswaController@delete');
    Route::post('/update/{id}','MahasiswaController@update');
    Route::get('/read','MahasiswaController@read');
    Route::get('/paginate','MahasiswaController@paginate');
    Route::get('/search','MahasiswaController@search');
});

