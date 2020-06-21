<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Mahasiswa extends Model
{
    protected $fillable = [
        'nim' , 'nama' , 'foto', 'user_id'
    ];

    public function users()
    {
        return $this->belongsTo(User::class, 'user_id');
    }
}
