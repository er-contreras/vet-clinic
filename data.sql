/* Populate database with sample data. */

-- 

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Agumon', '2020-02-03', 0, true, 10.23),
('Gabumon', '2018-11-15', 2, true, 8),
('Pikachu', '2021-01-07', 1, false, 15.04),
('Devimon', '2017-05-12', 5, true, 11);

-- 

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES 
('Charmander', '2020-02-08', 0, false, -11),
('Plantmon', '2022-11-15', 2, true, -5.7),
('Squirtle', '1993-04-02', 3, false, -12.13),
('Angemon', '2005-07-12', 1, true, -45),
('Boarmon', '2005-06-07', 7, true, 20.4),
('Blossom', '1998-10-13', 3, true, 17);

BEGIN;
UPDATE animals 
SET species = 'unspecified';
SELECT species FROM animals;
ROLLBACK;
SELECT species FROM animals;

BEGIN;
UPDATE animals 
SET species = 'Digimon'
WHERE NAME LIKE '%mon';
UPDATE animals
SET species = 'Pokemon'
WHERE NAME NOT LIKE '%mon';
COMMIT;
SELECT species FROM animals;

BEGIN;
DROP TABLE animals;
ROLLBACK;
SELECT species FROM animals;

BEGIN;
DELETE FROM animals
WHERE date_of_birth > '2022-01-01 00:00:00';
SAVEPOINT SP1;
UPDATE animals
SET weight_kg = weight_kg * -1;
ROLLBACK TO SP1;
UPDATE animals
SET weight_kg = weight_kg * -1
WHERE weight_kg < 0;
COMMIT;

--

INSERT INTO owners (full_name, age)
VALUES 
('Sam Smith', 34),
('Jennifer Orwell', 19),
('Bob', 45),
('Melody Pond', 77),
('Dean Winchester', 14),
('Jodie Whittaker', 38);

INSERT INTO species (name)
VALUES
('Pokemon'),
('Digimon');

UPDATE animals SET species_id = 2 WHERE NAME LIKE '%mon';
UPDATE animals SET species_id = 1 WHERE NAME NOT LIKE '%mon';

UPDATE animals SET owner_id = 1 WHERE NAME LIKE 'Agumon';
UPDATE animals SET owner_id = 2 WHERE NAME LIKE 'Gabumon';
UPDATE animals SET owner_id = 2 WHERE NAME LIKE 'Pikachu';
UPDATE animals SET owner_id = 3 WHERE NAME LIKE 'Devimon';
UPDATE animals SET owner_id = 4 WHERE NAME LIKE 'Charmander';
UPDATE animals SET owner_id = 4 WHERE NAME LIKE 'Squirtle';
UPDATE animals SET owner_id = 4 WHERE NAME LIKE 'Blossom';
UPDATE animals SET owner_id = 5 WHERE NAME LIKE 'Angemon';
UPDATE animals SET owner_id = 5 WHERE NAME LIKE 'Boarmon';

-- 

INSERT INTO visits (animal_id, vet_id, date_of_visit)
VALUES
(1, 1, '2020-05-24'),
(1, 3, '2020-07-22'),
(3, 4, '2021-02-02'),
(2, 2, '2020-01-05'),
(2, 2, '2020-03-08'),
(2, 2, '2020-05-14'),
(4, 3, '2021-05-04'),
(5, 4, '2021-02-24'),
(7, 3, '2019-09-29'),
(8, 4, '2020-10-03'),
(8, 4, '2020-11-04'),
(9, 2, '2019-01-24'),
(9, 2, '2019-05-15'),
(9, 2, '2020-02-27'),
(9, 2, '2020-08-03'),
(6, 3, '2020-05-24'),
(6, 1, '2021-01-11');

-- Second Week

INSERT INTO visits (animal_id, vet_id, date_of_visit)
SELECT * FROM (SELECT id FROM animals) animal_ids,
(SELECT id FROM vets) vets_ids,
generate_series('1980-01-01'::timestamp, '2021-01-01', '4 hours') visit_timestamp;

INSERT INTO owners (full_name, email)
SELECT 'Owner ' 
|| generate_series(1,2500000), 'owner_' 
|| generate_series(1,2500000) 
|| '@mail.com';
