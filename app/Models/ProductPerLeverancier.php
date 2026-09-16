<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class ProductPerLeverancier extends Model
{
    protected $connection = 'jamin';

    protected $table = 'ProductPerLeverancier';

    protected $primaryKey = 'Id';

    public $timestamps = false;

    protected $casts = [
        'IsActief' => 'boolean',
        'DatumLevering' => 'date',
        'DatumEerstVolgendeLevering' => 'date',
    ];

    public function product(): BelongsTo
    {
        return $this->belongsTo(Product::class, 'ProductId');
    }

    public function leverancier(): BelongsTo
    {
        return $this->belongsTo(Leverancier::class, 'LeverancierId');
    }
}
