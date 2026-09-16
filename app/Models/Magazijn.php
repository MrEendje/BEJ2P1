<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class Magazijn extends Model
{
    protected $connection = 'jamin';

    protected $table = 'Magazijn';

    protected $primaryKey = 'Id';

    public $timestamps = false;

    protected $casts = [
        'IsActief' => 'boolean',
    ];

    public function product(): BelongsTo
    {
        return $this->belongsTo(Product::class, 'ProductId');
    }
}
