/* Populate database with sample data. */

INSERT INTO animals (name) VALUES ('Luna');
INSERT INTO animals (name) VALUES ('Daisy');
INSERT INTO animals (name) VALUES ('Charlie');

INSERT INTO animals (name, data_of_birth, escape_attempts, neutered, weight_kg) 
VALUES ('Agumon', '02-03-2020', 0, true, 10.23);

INSERT INTO animals (name, data_of_birth, escape_attempts, neutered, weight_kg) 
VALUES ('Gabumon', '09-15-2018', 2, true, 8);

INSERT INTO animals (name, data_of_birth, escape_attempts, neutered, weight_kg) 
VALUES ('Pikachu', '01-07-2021', 1, false, 15.04);

INSERT INTO animals (name, data_of_birth, escape_attempts, neutered, weight_kg) 
VALUES ('Devimon', '05-12-2017', 5, true, 11);