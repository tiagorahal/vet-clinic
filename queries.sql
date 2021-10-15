/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name LIKE '%mon';
SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
SELECT name FROM animals WHERE neutered = true AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name = 'Agumon' OR name = 'Pikachu';
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered = true;
SELECT * FROM animals WHERE name != 'Gabumon';
SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;

BEGIN;
UPDATE animals SET species = 'unspecified';
ROLLBACK;
SELECT * FROM animals;

BEGIN;
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';
UPDATE animals SET species = 'pokemon' WHERE species IS NULL;
COMMIT;
SELECT * FROM animals;

BEGIN;
DELETE FROM animals;
ROLLBACK;

BEGIN;
DELETE FROM animals WHERE date_of_birth > '2022-01-01';
SAVEPOINT SP1;
UPDATE animals SET weight_kg = weight_kg*-1;
ROLLBACK TO SP1;
UPDATE animals SET weight_kg = weight_kg*-1 WHERE weight_kg < 0;
COMMIT;

SELECT COUNT(*) FROM animals;
SELECT COUNT(*) FROM animals WHERE escape_attempts = 0;
SELECT AVG(weight_kg) FROM animals;
SELECT * FROM (SELECT neutered as neutered, SUM(escape_attempts) as sum_escapes FROM animals GROUP BY neutered ORDER BY sum_escapes DESC) AS t LIMIT 1;
SELECT species, MIN(weight_kg), MAX(weight_kg)  FROM animals GROUP BY species;
SELECT species, AVG(escape_attempts) FROM animals WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31' GROUP BY species;

/* Joins */
SELECT name, owner_id FROM animals JOIN owners ON owner_id = owner_id AND owners.full_name = 'Melody Pond';
SELECT * FROM animals JOIN species ON species_id = species_id AND species.name = 'Pokemons';
SELECT * FROM owners LEFT JOIN animals ON owners.id = owner_id;
SELECT species.name, SUM(species_id) FROM animals JOIN species ON species_id = species.id GROUP BY species.name;
SELECT * FROM animals JOIN owners ON owner_id = owners.id and owners.full_name = 'Jennifer Orwell' JOIN species ON species.name = 'Digimon';
SELECT * FROM animals JOIN owners ON owner_id = owners.id and owners.full_name = 'Dean Winchester' WHERE escape_attempts = 0;
SELECT full_name, COUNT(owner_id) FROM animals JOIN owners ON owner_id = owners.id GROUP BY full_name ORDER BY count DESC LIMIT 1;

SELECT a.name, v.name, date_of_visit FROM visits JOIN vets v ON vets_id = v.id JOIN animals a ON animals_id = a.id WHERE v.name = 'William Tatcher' ORDER BY date_of_visit DESC LIMIT 1;
SELECT COUNT(DISTINCT animals_id) FROM visits JOIN vets v ON vets_id = v.id WHERE name = 'Stephanie Mendez';
SELECT * FROM vets LEFT JOIN specializations ON vets_id = id;
SELECT * FROM animals JOIN visits ON animals_id = animals.id JOIN vets ON vets.id = vets_id WHERE vets.name = 'Stephanie Mendez' AND date_of_visit BETWEEN '2020-04-01' AND '2020-08-30';
SELECT name, COUNT(name) FROM visits JOIN animals ON animals.id = animals_id GROUP BY name ORDER BY count DESC;
SELECT a.name, v.name, date_of_visit FROM visits JOIN vets v ON vets_id = v.id JOIN animals a ON animals_id = a.id WHERE v.name = 'Maisy Smith' ORDER BY date_of_visit ASC LIMIT 1;
SELECT * FROM visits JOIN animals ON animals_id = animals.id JOIN vets ON vets_id = vets.id;
SELECT COUNT(*) FROM vets v JOIN visits ON v.id = visits.vets_id LEFT JOIN specializations s ON v.id = s.vets_id LEFT JOIN animals a ON animals_id = a.id WHERE s.species_id != a.species_id OR s.species_id IS NULL;
SELECT animals.name, COUNT(animals.name) FROM visits JOIN vets ON vets_id = vets.id JOIN animals ON animals_id = animals.id WHERE vets.name = 'Maisy Smith' GROUP BY animals.name;