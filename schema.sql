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

ALTER TABLE animals
ADD CONSTRAINT species_pkey
FOREIGN KEY (species_id)
REFERENCES species(id)
ON UPDATE CASCADE
ON DELETE CASCADE;

ALTER TABLE animals
ADD CONSTRAINT owners_pkey
FOREIGN KEY (owner_id)
REFERENCES owners(id)
ON UPDATE CASCADE
ON DELETE CASCADE;

-- 

CREATE TABLE vets
	id SERIAL PRIMARY KEY,
	name varchar(225),
	age int,
	date_of_graduation date
)

CREATE TABLE specializations (
	species_id int,
	vet_id int,
	FOREIGN KEY (species_id) REFERENCES species(id),
	FOREIGN KEY (vet_id) REFERENCES vets(id),
	UNIQUE (species_id, vet_id)
);

CREATE TABLE visits (
	animal_id int,
	vet_id int,
	date_of_visit timestamp,
	FOREIGN KEY (animal_id) REFERENCES animals(id),
	FOREIGN KEY (vet_id) REFERENCES vets(id),
	UNIQUE (animal_id, vet_id)
);

-- Second week

ALTER TABLE owners ADD COLUMN email VARCHAR(120);

CREATE INDEX or_idx ON visits(animal_id ASC);

CREATE INDEX or_idx_vet_id ON visits(vet_id ASC);

CREATE INDEX or_idx_email ON owners(email ASC);
