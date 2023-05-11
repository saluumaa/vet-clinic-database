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

--USING JOIN
/* question ONE */
SELECT animals.name
FROM animals
JOIN owners ON animals.owner_id = owners.id
WHERE owners.full_name = 'Melody Pond';

/* question TWO */
SELECT animals.name
FROM animals
JOIN species ON animals.species_id = species.id
WHERE species.name = 'Pokemon';

/* question THREE */
SELECT owners.full_name, animals.name FROM owners 
LEFT JOIN animals ON animals.owner_id = owners.id;

/* question FOUR */
SELECT species.name, Count(*) AS animals_type
FROM animals
JOIN species ON animals.species_id =species.id
GROUP BY species.name;

/* question FIVE */
SELECT animals.name FROM animals
JOIN species ON animals.species_id = species.id
JOIN owners ON animals.owner_id = owners.id
WHERE species.name = 'Digimon' AND owners.full_name = 'Jennifer Orwell';

/* question SIX */
SELECT animals.name FROM animals
JOIN owners ON animals.owner_id = owners.id
WHERE owners.full_name = 'Dean Winchester' AND animals.escape_attempts = 0;

/* question SEVEN */
SELECT owners.full_name, COUNT(*) AS num_animals FROM animals
JOIN owners ON animals.owner_id = owners.id
GROUP BY owners.full_name
ORDER BY num_animals DESC;


--RELATIONSHIP QUERIES

/* question ONE */
SELECT a.name AS last_seen
FROM animals AS a
JOIN visits as V ON V.animals_id = a.id
JOIN vets as vt ON vt.id = v.vet_id
WHERE vt.name = 'William Tatcher'
ORDER BY v.visit_date DESC
LIMIT 1;

/* question TWO */
SELECT COUNT(DISTINCT v.animals_id) AS count_animal
FROM visits AS v
JOIN vets AS vt ON vt.id = v.vet_id
WHERE vt.name = 'Vet Stephanie Mendez';


/* question THREE */
SELECT v.name AS vet_name, s.name AS specialty
FROM vets AS v
LEFT JOIN specializations AS sp ON sp.vet_id = v.id
LEFT JOIN species AS s ON s.id = sp.species_id;

/* question FOUR */
SELECT a.name AS a_name
FROM animals AS a
JOIN visits AS v ON v.animal_id = a.id
JOIN vets AS vt ON vt.id = v.vet_id
WHERE vt.name = 'Vet Stephanie Mendez'
AND v.visit_date BETWEEN '2020-04-01' AND '2020-08-30';

/* question FIVE */
SELECT a.name AS a_name, COUNT(*) AS v_count
FROM animals AS a
JOIN visits AS v ON v.animals_id = a.id
GROUP BY a.name
ORDER BY v_count DESC
LIMIT 1;

/* question SIX */
SELECT a.name AS a_name, MIN(v.visit_date) AS first_visit
FROM animals AS a
JOIN visits AS v ON v.animals_id = a.id
JOIN vets AS vt ON vt.id = v.vet_id
WHERE vt.name = 'Vet Maisy Smith'
GROUP BY a.name;

/* question SEVEN */
SELECT a.name AS a_name, v.visit_date, vt.name AS vet_name
FROM animals AS a
JOIN visits AS v ON v.animals_id = a.id
JOIN vets AS vt ON vt.id = v.vet_id
ORDER BY v.visit_date DESC
LIMIT 1;

/* question EIGHT */
SELECT COUNT(*) AS non_specialist_visits
FROM visits AS v
JOIN animals AS a ON a.id = v.animals_id
JOIN vets AS vt ON vt.id = v.vet_id
LEFT JOIN specialization AS sp ON sp.vet_id = vt.id AND sp.species_id = a.species_id
WHERE sp.vet_id IS NULL;

/* question NINE */
SELECT s.name AS vet_speciality
FROM animals AS a
JOIN visits AS v ON v.animals_id = a.id
JOIN species AS s ON s.id = a.species_id
JOIN vets AS vt ON vt.id = v.vet_id
WHERE vt.name = 'Vet Maisy Smith'
GROUP BY s.name
ORDER BY COUNT(*) DESC
LIMIT 1;

