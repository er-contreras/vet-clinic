/* Database schema to keep the structure of entire database. */

-- 

CREATE TABLE animals (
    id SERIAL PRIMARY KEY,
    name varchar(20),
    date_of_birth date,
    escape_attempts int,
    neutered boolean,
    weight_kg decimal
);

-- 

ALTER TABLE animals ADD COLUMN species varchar(20);

-- 

CREATE TABLE owners (
	id SERIAL PRIMARY KEY,
	full_name varchar(20),
	age int
)

CREATE TABLE species (
	id SERIAL PRIMARY KEY,
	name varchar(20),
)

ALTER TABLE animals
DROP COLUMN species;

ALTER TABLE animals
ADD COLUMN species_id int;

ALTER TABLE animals
ADD COLUMN owner_id int;

