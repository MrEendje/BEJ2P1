<?php

namespace App\Models;

/**
 * Nieuwe leveringen van een product door een leverancier, via stored procedures (PDO).
 */
class LeveringModel extends StoredProcedureModel
{
    /**
     * Product- en leveranciergegevens voor het scherm Levering product,
     * of null als de leverancier dit product niet levert.
     */
    public function getLeveringProduct(int $leverancierId, int $productId): ?object
    {
        return $this->callFirst('sp_GetLeveringProduct', [$leverancierId, $productId]);
    }

    /**
     * Slaat de levering op en verhoogt het aantal in het magazijn.
     */
    public function create(int $leverancierId, int $productId, int $aantal, string $datumEerstVolgendeLevering): void
    {
        $this->call('sp_CreateLevering', [
            $leverancierId,
            $productId,
            $aantal,
            $datumEerstVolgendeLevering,
        ]);
    }
}
