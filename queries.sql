/*Queries that provide answers to the questions from all projects.*/

SELECT animals.name FROM animals WHERE NAME LIKE '%mon';
SELECT animals.name, animals.date_of_birth FROM animals 
WHERE date_of_birth >= timestamp '2016-01-01 00:00:00'
AND date_of_birth <= timestamp '2019-01-01 00:00:00';
SELECT animals.name, animals.neutered, animals.escape_attempts FROM animals 
WHERE neutered = true AND escape_attempts < 3;
SELECT animals.name, animals.date_of_birth FROM animals 
WHERE name = 'Agumon' OR name = 'Pikachu';
SELECT animals.name, animals.escape_attempts FROM animals
WHERE weight_kg > 10.5;
SELECT animals.name, animals.neutered FROM animals WHERE neutered = true;
SELECT animals.name FROM animals WHERE name != 'Gabumon';
SELECT animals.name, animals.weight_kg FROM animals 
WHERE weight_kg BETWEEN 10.4 AND 17.3;

-- 

SELECT COUNT(*) FROM animals;
SELECT COUNT(*) FROM animals WHERE escape_attempts = 0;
SELECT ROUND(AVG(weight_kg),4) "Average weight" FROM animals;
SELECT neutered, SUM(escape_attempts) FROM animals GROUP BY neutered;
SELECT species, min(weight_kg), max(weight_kg) FROM animals GROUP BY species;
SELECT species, AVG(escape_attempts) "Escape attempts"
FROM animals
WHERE date_of_birth >= timestamp '1990-01-01 00:00:00'
AND date_of_birth <= timestamp '2000-01-01 00:00:00'
GROUP BY species;

-- 

SELECT animals.name, owners.full_name
FROM animals
INNER JOIN owners ON animals.owner_id = owners.id
WHERE owners.full_name = 'Melody Pond';

SELECT animals.name, species.name
FROM animals
INNER JOIN species ON animals.species_id = species.id
WHERE species.name = 'Pokemon';

SELECT animals.name, owners.full_name
FROM animals
FULL JOIN owners ON animals.owner_id = owners.id;

SELECT  species.name, COUNT(animals.species_id)
FROM animals
FULL JOIN species ON animals.species_id = species.id
WHERE species.name = 'Pokemon'
OR species.name = 'Digimon'
GROUP BY species.name;

SELECT animals.name, owners.full_name
FROM animals
INNER JOIN owners ON animals.owner_id = owners.id
WHERE owners.full_name = 'Jennifer Orwell';

SELECT animals.name, animals.escape_attempts, owners.full_name
FROM animals
INNER JOIN owners ON animals.owner_id = owners.id
WHERE owners.full_name = 'Dean Winchester'
AND animals.escape_attempts = 0;

SELECT owners.full_name, COUNT(*) AS Amount
FROM animals
INNER JOIN owners ON animals.owner_id = owners.id
GROUP BY owners.full_name;

-- 

SELECT * FROM visits 
WHERE date_of_visit = (SELECT MAX(date_of_visit) FROM visits);

SELECT vets.name, COUNT(animals.name) 
FROM animals 
INNER JOIN visits ON visits.animal_id = animals.id
INNER JOIN vets  ON vets.id = visits.vet_id 
WHERE vets.name = 'Stephanie Mendez' 
GROUP BY vets.name;

SELECT vets.name, species.name 
FROM specializations 
RIGHT JOIN vets ON specializations.vet_id = vets.id
LEFT JOIN species ON species.id = specializations.species_id;

SELECT animals.name, vets.name, visits.date_of_visit
FROM animals 
INNER JOIN visits ON visits.animal_id = animals.id
INNER JOIN vets ON vets.id = visits.vet_id 
WHERE vets.name = 'Stephanie Mendez' 
AND visits.date_of_visit
BETWEEN '2020-04-01' 
AND '2020-08-30';

SELECT animals.name, COUNT(visits.date_of_visit)
FROM animals 
INNER JOIN visits ON visits.animal_id = animals.id 
GROUP BY animals.name 
ORDER BY COUNT(*);

SELECT animals.name, vets.name, visits.date_of_visit
FROM animals 
INNER JOIN visits ON visits.animal_id = animals.id
INNER JOIN vets  ON vets.id = visits.vet_id 
WHERE vets.name = 'Maisy Smith' 
ORDER BY visits.date_of_visit;

SELECT visits.date_of_visit,
animals.name,
animals.escape_attempts,
animals.neutered, 
animals.weight_kg, 
vets.name, vets.age, 
vets.date_of_graduation
FROM animals 
INNER JOIN visits ON visits.animal_id = animals.id 
INNER JOIN vets  ON vets.id = visits.vet_id 
ORDER BY visits.date_of_visit;

SELECT vets.name, species.name, COUNT(visits.date_of_visit) AS total_visits 
FROM specializations 
RIGHT JOIN vets ON specializations.vet_id = vets.id
LEFT JOIN species ON species.id = specializations.species_id 
INNER JOIN visits ON visits.vet_id = vets.id 
WHERE species.name IS NULL 
GROUP BY vets.name, species.name;

SELECT COUNT(visits.animal_id), species.name, vets.name 
FROM visits 
INNER JOIN animals ON visits.animal_id = animals.id
INNER JOIN species ON species.id = animals.species_id
INNER JOIN vets ON vets.id = visits.vet_id 
WHERE vets.name = 'Maisy Smith' 
GROUP BY species.name, vets.name;
