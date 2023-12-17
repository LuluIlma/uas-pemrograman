<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Service extends Model
{
    protected $table = 'service';
    protected $primaryKey = 'id_service';
    public $incrementing = true;
    protected $keyType = 'integer';
    protected $fillable = [
        'nama_service',
        'deskripsi_service',
    ];
}
