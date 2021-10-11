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
