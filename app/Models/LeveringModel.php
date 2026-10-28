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
     * Geeft false terug als het product niet meer wordt geproduceerd.
     */
    public function create(int $leverancierId, int $productId, int $aantal, string $datumEerstVolgendeLevering): bool
    {
        $resultaat = $this->callFirst('sp_CreateLevering', [
            $leverancierId,
            $productId,
            $aantal,
            $datumEerstVolgendeLevering,
        ]);

        return (bool) $resultaat?->IsGelukt;
    }
}
