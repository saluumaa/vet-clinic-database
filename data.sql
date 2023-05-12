/* Populate database with sample data. */

INSERT INTO animals (name) VALUES ('Luna');
INSERT INTO animals (name) VALUES ('Daisy');
INSERT INTO animals (name) VALUES ('Charlie');

INSERT INTO animals (name, data_of_birth, escape_attempts, neutered, weight_kg) 
VALUES ('Agumon', '02-03-2020', 0, true, 10.23);

INSERT INTO animals (name, data_of_birth, escape_attempts, neutered, weight_kg) 
VALUES ('Gabumon', '09-15-2018', 2, true, 8.0);

INSERT INTO animals (name, data_of_birth, escape_attempts, neutered, weight_kg) 
VALUES ('Pikachu', '01-07-2021', 1, false, 15.04);

INSERT INTO animals (name, data_of_birth, escape_attempts, neutered, weight_kg) 
VALUES ('Devimon', '05-12-2017', 5, true, 11.0);

INSERT INTO animals (name, data_of_birth, escape_attempts, neutered, weight_kg) 
VALUES ('Charmander', '2020-02-08', 0, false, -11.0);

INSERT INTO animals (name, data_of_birth, escape_attempts, neutered, weight_kg) 
VALUES ('Plantmon', '2021-11-15', 2, true, -5.7.0);

INSERT INTO animals (name, data_of_birth, escape_attempts, neutered, weight_kg) 
VALUES ('Squirtle','1993-04-02', 3, false, -12.3);

INSERT INTO animals (name, data_of_birth, escape_attempts, neutered, weight_kg) 
VALUES ('Angemon', '2005-06-12', 1, true, -45.0);

INSERT INTO animals (name, data_of_birth, escape_attempts, neutered, weight_kg) 
VALUES('Boarmon', '2005-06-07', 7, true, 20.4);

INSERT INTO animals (name, data_of_birth, escape_attempts, neutered, weight_kg) 
VALUES ('Blossom', '1998-10-13', 3, true, 17.0);

INSERT INTO animals (name, data_of_birth, escape_attempts, neutered, weight_kg) 
VALUES ('Ditto', '2022-05-14', 4, true, 22.0);

INSERT INTO owners(full_name, age)
VALUES('Sam Smith', 34), 
      ('Jennifer Orwell', 19), 
      ('Bob', 45), 
      ('Melody Pond', 77), 
      ('Dean Winchester', 14),
      ('Jodie Whittaker', 38);

INSERT INTO species(name)
VALUES('Pokemon'), 
      ('Digimon');

UPDATE animals SET species_id = (SELECT id FROM species WHERE name = 'Digimon')
WHERE name LIKE '%mon';

UPDATE animals SET species_id = (SELECT id FROM species WHERE name = 'Pokemon')
WHERE name NOT LIKE '%mon';

UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Sam Smith')
WHERE name = 'Agumon';

UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Jennifer Orwell')
WHERE name IN ('Gabumon', 'Pikachu');

UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Bob')
WHERE name IN ('Devimon', 'Plantmon');

UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Melody Pond')
WHERE name IN ('Charmander', 'Squirtle', 'Blossom');

UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Dean Winchester')
WHERE name IN ('Angemon', 'Boarmon');


INSERT INTO vets (name, age, date_of_graduation)
VALUES ('William Tatcher', 45, '2000-04-23'),
       ('Maisy Smith', 26, '2019-01-17'),
       ('Stephanie Mendez', 64, '1981-05-04'),
       ('Jack Harkness', 38, '2008-06-08');

INSERT INTO specialization(vet_id, species_id)
VALUES((SELECT id FROM vets WHERE name = 'Vet William Tatcher'),
(SELECT id FROM species WHERE name = 'Pokemon'));

INSERT INTO specialization(vet_id, species_id)
VALUES((SELECT id FROM vets WHERE name = 'Vet Stephanie Mendez'),
(SELECT id FROM species WHERE name = 'Digimon'));

INSERT INTO specialization(vet_id, species_id)
VALUES((SELECT id FROM vets WHERE name = 'Vet Stephanie Mendez'),
(SELECT id FROM species WHERE name = 'Pokemon'));

INSERT INTO specialization(vet_id, species_id)
VALUES((SELECT id FROM vets WHERE name = 'Vet Stephanie Mendez'),
(SELECT id FROM species WHERE name = 'Digimon'));

INSERT INTO specialization(vet_id, species_id)
VALUES((SELECT id FROM vets WHERE name = 'Vet Jack Harkness'),
(SELECT id FROM species WHERE name = 'Digimon'));

INSERT INTO specialization(vet_id, species_id)
VALUES((SELECT id FROM vets WHERE name = 'Vet Jack Harkness'),
(SELECT id FROM species WHERE name = 'Digimon'));

INSERT INTO visits(vet_id, animals_id, visit_date)
VALUES((SELECT id FROM vets WHERE name = 'Vet Jack Harkness'),
(SELECT id from animals WHERE NAME = 'Gabumon'),
'2021-02-02');

INSERT INTO visits(vet_id, animals_id, visit_date)
VALUES((SELECT id FROM vets WHERE name = 'Vet Maisy Smith'),
(SELECT id from animals WHERE NAME = 'Pikachu'),
'2020-01-05');

INSERT INTO visits(vet_id, animals_id, visit_date)
VALUES((SELECT id FROM vets WHERE name = 'Vet Maisy Smith'),
(SELECT id from animals WHERE NAME = 'Pikachu'),
'2020-03-08');

INSERT INTO visits(vet_id, animals_id, visit_date)
VALUES((SELECT id FROM vets WHERE name = 'Vet Maisy Smith'),
(SELECT id from animals WHERE NAME = 'Pikachu'),
'2020-05-14');

INSERT INTO visits(vet_id, animals_id, visit_date)
VALUES((SELECT id FROM vets WHERE name = 'Vet Stephanie Mendez'),
(SELECT id from animals WHERE NAME = 'Davimon'),
'2021-05-04');

INSERT INTO visits(vet_id, animals_id, visit_date)
VALUES((SELECT id FROM vets WHERE name = 'Vet Jack Harkness'),
(SELECT id from animals WHERE NAME = 'Charmander'),
'2021-02-24');

INSERT INTO visits(vet_id, animals_id, visit_date)
VALUES((SELECT id FROM vets WHERE name = 'Vet Maisy Smith'),
(SELECT id from animals WHERE NAME = 'Plantmon'),
'2019-12-21');

INSERT INTO visits(vet_id, animals_id, visit_date)
VALUES((SELECT id FROM vets WHERE name = 'Vet William Tatcher'),
(SELECT id from animals WHERE NAME = 'Plantmon'),
'2020-08-10');

INSERT INTO visits(vet_id, animals_id, visit_date)
VALUES((SELECT id FROM vets WHERE name = 'Vet Maisy Smith'),
(SELECT id from animals WHERE NAME = 'Plantmon'),
'2021-04-07');

INSERT INTO visits(vet_id, animals_id, visit_date)
VALUES((SELECT id FROM vets WHERE name = 'Vet Stephanie Mendez'),
(SELECT id from animals WHERE NAME = 'Squirtle'),
'2019-09-29');

INSERT INTO visits(vet_id, animals_id, visit_date)
VALUES((SELECT id FROM vets WHERE name = 'Vet Jack Harkness'),
(SELECT id from animals WHERE NAME = 'Angemon'),
'2020-10-03');

INSERT INTO visits(vet_id, animals_id, visit_date)
VALUES((SELECT id FROM vets WHERE name = 'Vet Jack Harkness'),
(SELECT id from animals WHERE NAME = 'Angemon'),
'2020-11-04');

INSERT INTO visits(vet_id, animals_id, visit_date)
VALUES((SELECT id FROM vets WHERE name = 'Vet Maisy Smith'),
(SELECT id from animals WHERE NAME = 'Boarmon'),
'2019-01-24');

INSERT INTO visits(vet_id, animals_id, visit_date)
VALUES((SELECT id FROM vets WHERE name = 'Vet Maisy Smith'),
(SELECT id from animals WHERE NAME = 'Boarmon'),
'2019-05-15');

INSERT INTO visits(vet_id, animals_id, visit_date)
VALUES((SELECT id FROM vets WHERE name = 'Vet Maisy Smith'),
(SELECT id from animals WHERE NAME = 'Boarmon'),
'2020-02-27');

INSERT INTO visits(vet_id, animals_id, visit_date)
VALUES((SELECT id FROM vets WHERE name = 'Vet Maisy Smith'),
(SELECT id from animals WHERE NAME = 'Boarmon'),
'2020-08-03');

INSERT INTO visits(vet_id, animals_id, visit_date)
VALUES((SELECT id FROM vets WHERE name = 'Vet Stephanie Mendez'),
(SELECT id from animals WHERE NAME = 'Blossom'),
'2020-05-24');

INSERT INTO visits(vet_id, animals_id, visit_date)
VALUES((SELECT id FROM vets WHERE name = 'Vet William Tatcher'),
(SELECT id from animals WHERE NAME = 'Blossom'),
'2021-01-11');
