/*Queries that provide answers to the questions from all projects.*/
SELECT * from animals WHERE name = 'Luna';
SELECT * FROM animals WHERE name LIKE '%mon';
SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-30';
SELECT name FROM animals WHERE neutered = true AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name IN ('Agumon', 'Pikachu');
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered = true;
SELECT * FROM animals WHERE name NOT IN ('Gabumon');
SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;

/* Alter the database schema to add a new column. */
ALTER TABLE animals ADD species varchar(255);

BEGIN;
UPDATE animals SET species = 'unspecified';
SELECT * FROM animals;
ROLLBACK;

BEGIN;
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';
UPDATE animals SET species = 'pokemon' WHERE species IS NULL;
SELECT * FROM animals;
COMMIT;

BEGIN;
DELETE FROM animals;
SELECT * FROM animals;
ROLLBACK;

BEGIN;
DELETE FROM animals WHERE date_of_birth > '2022-01-01';
SAVEPOINT before_update;
UPDATE animals SET weight_kg = weight_kg * -1;
ROLLBACK TO before_update;
UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;
COMMIT;

/*Queries that provide answers to the questions from all projects.*/

SELECT COUNT(*) FROM animals;
SELECT COUNT(*) FROM animals WHERE escape_attempts = 0;
SELECT AVG(weight_kg) FROM animals;
SELECT neutered, AVG(escape_attempts) as escape FROM animals GROUP BY neutered;
SELECT species, MIN(weight_kg) as min_weight, MAX(weight_kg) as max_weight FROM animals GROUP BY species;
SELECT species, AVG(escape_attempts) as avg_escape FROM animals WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31' GROUP BY species;

