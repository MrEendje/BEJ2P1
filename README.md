# BEJ2P1

Laravel 12 webapplicatie voor **Backend Jaar 2, Periode 1**.

Gemaakt volgens les 2.3 (Laravel installeren met gebruikersrollen) en 2.4 (createscript).

## Wat zit erin

- **Laravel 12** met de **Blade** starter kit (Laravel Breeze, blade stack): registreren, inloggen, profiel.
- **MySQL** database (`laravel`), alle tabellen op **InnoDB** (`config/database.php` → `'engine' => 'InnoDB'`).
- **Gebruikersrollen**:
  - Stamtabel `roles` (`admin`, `user`).
  - `users.role_id` → FK naar `roles`.
  - Middleware `role` (`app/Http/Middleware/EnsureUserHasRole.php`), gebruikt als `->middleware('role:admin')`.
  - Beheerdersscherm `/admin/users` om rollen van gebruikers aan te passen (alleen voor `admin`).
  - Nieuwe registraties krijgen automatisch de rol `user`.
- Feature-tests: `tests/Feature/RoleAccessTest.php`.

## Createscript (les 2.4 / BE-opdracht 01)

`database/createscript/create_script.sql` — een **los SQL-script** (te draaien in MySQL
Workbench of phpMyAdmin, géén Laravel-migratie). Het script:

- maakt de database `jamin` (drop + create, dus opnieuw draaien mag);
- maakt eerst de **stamtabellen** (`Product`, `Allergeen`, `Leverancier`) en daarna de
  **koppeltabellen** (`Magazijn`, `ProductPerAllergeen`, `ProductPerLeverancier`);
- zet op elke tabel de systeemvelden `IsActief`, `Opmerking`, `DatumAangemaakt`,
  `DatumGewijzigd`;
- legt alle PK's en FK's vast met benoemde constraints, `ENGINE=InnoDB`;
- vult alle zes tabellen met de voorbeelddata uit de opdracht.

## Installatie

```bash
composer install
npm install
cp .env.example .env      # of gebruik de meegeleverde .env
php artisan key:generate

# MySQL: maak database 'laravel' aan (WAMP, default storage engine InnoDB)
php artisan migrate --seed

npm run build
composer run dev
```

Open http://localhost:8000

## Demo-accounts (na `migrate --seed`)

| Rol       | E-mail              | Wachtwoord |
|-----------|---------------------|------------|
| Beheerder | admin@example.com   | password   |
| Gebruiker | test@example.com    | password   |
