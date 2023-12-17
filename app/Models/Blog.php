<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\Service;

class Blog extends Model
{
    protected $table = 'blog';
    protected $primaryKey = 'id_blog';
    public $incrementing = true;
    protected $keyType = 'integer';
    protected $fillable = [
        'id_service',
        'tags',
        'authors',
        'postdate',
        'content',
        'path_img',
    ];

    public function service()
    {
        return $this->belongsTo(Service::class, 'id_service');
    }
}
