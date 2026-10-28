# Database Specificatie Tabel - Jamin

Database: `jamin` (MySQL, `ENGINE=InnoDB`). Createscript: `database/createscript/create_script.sql`.

## Product

| Kolom naam | Datatype | Lengte | Nullable | Opmerking |
|---|---|---|---|---|
| Id | INT |  | No | PK, UNSIGNED, AUTO_INCREMENT |
| Naam | Varchar | 50 | No |  |
| Barcode | Varchar | 13 | No | UNIQUE |
| IsActief | BIT | 1 | No | Systeemveld, standaard 1 |
| Opmerking | Varchar | 255 | Yes | Systeemveld |
| DatumAangemaakt | DateTime | 6 | No | Systeemveld |
| DatumGewijzigd | DateTime | 6 | No | Systeemveld |

## Allergeen

| Kolom naam | Datatype | Lengte | Nullable | Opmerking |
|---|---|---|---|---|
| Id | INT |  | No | PK, UNSIGNED, AUTO_INCREMENT |
| Naam | Varchar | 50 | No |  |
| Omschrijving | Varchar | 100 | No |  |
| IsActief | BIT | 1 | No | Systeemveld, standaard 1 |
| Opmerking | Varchar | 255 | Yes | Systeemveld |
| DatumAangemaakt | DateTime | 6 | No | Systeemveld |
| DatumGewijzigd | DateTime | 6 | No | Systeemveld |

## Leverancier

| Kolom naam | Datatype | Lengte | Nullable | Opmerking |
|---|---|---|---|---|
| Id | INT |  | No | PK, UNSIGNED, AUTO_INCREMENT |
| Naam | Varchar | 50 | No |  |
| ContactPersoon | Varchar | 75 | No |  |
| LeverancierNummer | Varchar | 15 | No | UNIQUE |
| Mobiel | Varchar | 12 | No |  |
| IsActief | BIT | 1 | No | Systeemveld, standaard 1 |
| Opmerking | Varchar | 255 | Yes | Systeemveld |
| DatumAangemaakt | DateTime | 6 | No | Systeemveld |
| DatumGewijzigd | DateTime | 6 | No | Systeemveld |

## Magazijn

| Kolom naam | Datatype | Lengte | Nullable | Opmerking |
|---|---|---|---|---|
| Id | INT |  | No | PK, UNSIGNED, AUTO_INCREMENT |
| ProductId | INT |  | No | FK(Product) |
| VerpakkingsEenheidInKilogram | DECIMAL | 6,3 | No | In kg |
| AantalAanwezig | INT |  | Yes | UNSIGNED, NULL = geen voorraad |
| IsActief | BIT | 1 | No | Systeemveld, standaard 1 |
| Opmerking | Varchar | 255 | Yes | Systeemveld |
| DatumAangemaakt | DateTime | 6 | No | Systeemveld |
| DatumGewijzigd | DateTime | 6 | No | Systeemveld |

## ProductPerAllergeen

| Kolom naam | Datatype | Lengte | Nullable | Opmerking |
|---|---|---|---|---|
| Id | INT |  | No | PK, UNSIGNED, AUTO_INCREMENT |
| ProductId | INT |  | No | FK(Product) |
| AllergeenId | INT |  | No | FK(Allergeen) |
| IsActief | BIT | 1 | No | Systeemveld, standaard 1 |
| Opmerking | Varchar | 255 | Yes | Systeemveld |
| DatumAangemaakt | DateTime | 6 | No | Systeemveld |
| DatumGewijzigd | DateTime | 6 | No | Systeemveld |

## ProductPerLeverancier

| Kolom naam | Datatype | Lengte | Nullable | Opmerking |
|---|---|---|---|---|
| Id | INT |  | No | PK, UNSIGNED, AUTO_INCREMENT |
| LeverancierId | INT |  | No | FK(Leverancier) |
| ProductId | INT |  | No | FK(Product) |
| DatumLevering | DATE |  | No |  |
| Aantal | INT |  | No | UNSIGNED |
| DatumEerstVolgendeLevering | DATE |  | Yes | NULL = onbekend |
| IsActief | BIT | 1 | No | Systeemveld, standaard 1 |
| Opmerking | Varchar | 255 | Yes | Systeemveld |
| DatumAangemaakt | DateTime | 6 | No | Systeemveld |
| DatumGewijzigd | DateTime | 6 | No | Systeemveld |

## Stored procedures

| Naam | Doel |
|---|---|
| `sp_GetAllLeveranciers` | Alle leveranciers + aantal verschillende producten, aflopend gesorteerd (US1) |
| `sp_GetLeverancierById` | Gegevens van één leverancier (US1) |
| `sp_GetGeleverdeProductenByLeverancierId` | Geleverde producten van een leverancier, op Aantal in magazijn aflopend (US1) |
| `sp_GetLeveringProduct` | Product- en leveranciergegevens voor Levering product (US2) |
| `sp_CreateLevering` | Nieuwe levering opslaan + Aantal in magazijn verhogen; weigert inactieve producten (US2) |
