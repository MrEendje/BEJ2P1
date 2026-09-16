<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\Relations\HasOne;

class Product extends Model
{
    protected $connection = 'jamin';

    protected $table = 'Product';

    protected $primaryKey = 'Id';

    public $timestamps = false;

    protected $casts = [
        'IsActief' => 'boolean',
    ];

    public function magazijn(): HasOne
    {
        return $this->hasOne(Magazijn::class, 'ProductId');
    }

    public function leveringen(): HasMany
    {
        return $this->hasMany(ProductPerLeverancier::class, 'ProductId');
    }

    public function allergenen(): BelongsToMany
    {
        return $this->belongsToMany(Allergeen::class, 'ProductPerAllergeen', 'ProductId', 'AllergeenId');
    }
}
