<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Leverancier extends Model
{
    protected $connection = 'jamin';

    protected $table = 'Leverancier';

    protected $primaryKey = 'Id';

    public $timestamps = false;

    protected $casts = [
        'IsActief' => 'boolean',
    ];

    public function leveringen(): HasMany
    {
        return $this->hasMany(ProductPerLeverancier::class, 'LeverancierId');
    }
}
