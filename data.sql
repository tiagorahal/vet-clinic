/* Populate database with sample data. */

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Agumon', '2020-02-03', 0, true, 10.23);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Gabumon', '2018-11-15', 2, true, 8);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Pikachu', '2021-01-07', 1, false, 15.04);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Devimon', '2017-05-12', 5, true, 11);

/* ADD 6 NEW ANIMALS */

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Charmander', '2020-02-08', 0, false, -11);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Plantmon', '2022-11-15', 2, true, -5.7);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Squirtle', '1993-04-02', 3, false, -12.13);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Angemon', '2005-06-12', 1, true, -45);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Boarmon', '2005-06-07', 7, true, 20.4);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Blossom', '1998-10-13', 3, true, 17);

/* ADD 6 NEW OWNERS*/

INSERT INTO owners (full_name, age) VALUES ('Sam Smith', 34);
INSERT INTO owners (full_name, age) VALUES ('Jennifer Orwell', 19);
INSERT INTO owners (full_name, age) VALUES ('Bob', 45);
INSERT INTO owners (full_name, age) VALUES ('Malody Pond', 77);
INSERT INTO owners (full_name, age) VALUES ('Dean Winchester', 14);
INSERT INTO owners (full_name, age) VALUES ('Jodie Whittaker', 38);

/* ADD POKEMON AND DIGIMON AND SORT SPECIES */
INSERT INTO species (name) VALUES ('Pokemon');
INSERT INTO species (name) VALUES ('Digimon');
UPDATE animals SET species_id = CASE WHEN name like '%mon' THEN 2 ELSE 1 END;

/* ADD ANIMAL TO IT'S REPECTIVE OWNER */
UPDATE animals SET owner_id = 1 WHERE name = 'Agumon';
UPDATE animals SET owner_id = 2 WHERE name = 'Gabumon' OR name = 'Pikachu';
UPDATE animals SET owner_id = 3 WHERE name = 'Devimon' OR name = 'Plantmon';
UPDATE animals SET owner_id = 4 WHERE name = 'Charmander' OR name = 'Squirtle' OR name = 'Blossom';
UPDATE animals SET owner_id = 5 WHERE name = 'Angemon' OR name = 'Boarmon';

/* ADD DATA IN vets TABLE */
INSERT INTO vets (name, age, date_of_graduation) VALUES ('William Tatcher', 45, '2000-04-23');
INSERT INTO vets (name, age, date_of_graduation) VALUES ('Maisy Smith', 26, '2019-01-17');
INSERT INTO vets (name, age, date_of_graduation) VALUES ('Stephanie Mendez', 64, '1981-05-04');
INSERT INTO vets (name, age, date_of_graduation) VALUES ('Jack Harkness', 38 ,'2008-06-08');

/* ADD DATA IN specializations TABlE */
INSERT INTO specializations (species_id, vets_id) SELECT s.id, v.id FROM species s JOIN vets v ON s.name = 'Pokemon' AND v.name = 'William Tatcher';
INSERT INTO specializations (species_id, vets_id) SELECT s.id, v.id FROM species s JOIN vets v ON s.name = 'Pokemon' AND v.name = 'Stephanie Mendez';
INSERT INTO specializations (species_id, vets_id) SELECT s.id, v.id FROM species s JOIN vets v ON s.name = 'Digimon' AND v.name = 'Stephanie Mendez';
INSERT INTO specializations (species_id, vets_id) SELECT s.id, v.id FROM species s JOIN vets v ON s.name = 'Digimon' AND v.name = 'Jack Harkness';

/* ADD DATA IN visits TABLE */
INSERT INTO visits (animals_id, vets_id, date_of_visit) SELECT a.id, v.id, '2020-05-24' FROM animals a JOIN vets v ON a.name = 'Agumon' AND v.name = 'William Tatcher';
INSERT INTO visits (animals_id, vets_id, date_of_visit) SELECT a.id, v.id, '2020-07-22' FROM animals a JOIN vets v ON a.name = 'Agumon' AND v.name = 'Stephanie Mendez';
INSERT INTO visits (animals_id, vets_id, date_of_visit) SELECT a.id, v.id, '2021-02-02' FROM animals a JOIN vets v ON a.name = 'Gabumon' AND v.name = 'Jack Harkness';
INSERT INTO visits (animals_id, vets_id, date_of_visit) SELECT a.id, v.id, '2020-01-05' FROM animals a JOIN vets v ON a.name = 'Pikachu' AND v.name = 'Maisy Smith';
INSERT INTO visits (animals_id, vets_id, date_of_visit) SELECT a.id, v.id, '2020-03-08' FROM animals a JOIN vets v ON a.name = 'Pikachu' AND v.name = 'Maisy Smith';
INSERT INTO visits (animals_id, vets_id, date_of_visit) SELECT a.id, v.id, '2020-05-14' FROM animals a JOIN vets v ON a.name = 'Pikachu' AND v.name = 'Maisy Smith';
INSERT INTO visits (animals_id, vets_id, date_of_visit) SELECT a.id, v.id, '2021-05-04' FROM animals a JOIN vets v ON a.name = 'Devimon' AND v.name = 'Stephanie Mendez';
INSERT INTO visits (animals_id, vets_id, date_of_visit) SELECT a.id, v.id, '2021-02-24' FROM animals a JOIN vets v ON a.name = 'Charmander' AND v.name = 'Jack Harkness';
INSERT INTO visits (animals_id, vets_id, date_of_visit) SELECT a.id, v.id, '2019-12-21' FROM animals a JOIN vets v ON a.name = 'Plantmon' AND v.name = 'Maisy Smith';
INSERT INTO visits (animals_id, vets_id, date_of_visit) SELECT a.id, v.id, '2020-08-10' FROM animals a JOIN vets v ON a.name = 'Plantmon' AND v.name = 'William Tatcher';
INSERT INTO visits (animals_id, vets_id, date_of_visit) SELECT a.id, v.id, '2021-04-07' FROM animals a JOIN vets v ON a.name = 'Plantmon' AND v.name = 'Maisy Smith';
INSERT INTO visits (animals_id, vets_id, date_of_visit) SELECT a.id, v.id, '2019-09-29' FROM animals a JOIN vets v ON a.name = 'Squirtle' AND v.name = 'Stephanie Mendez';
INSERT INTO visits (animals_id, vets_id, date_of_visit) SELECT a.id, v.id, '2020-10-03' FROM animals a JOIN vets v ON a.name = 'Angemon' AND v.name = 'Jack Harkness';
INSERT INTO visits (animals_id, vets_id, date_of_visit) SELECT a.id, v.id, '2020-11-04' FROM animals a JOIN vets v ON a.name = 'Angemon' AND v.name = 'Jack Harkness';
INSERT INTO visits (animals_id, vets_id, date_of_visit) SELECT a.id, v.id, '2019-01-24' FROM animals a JOIN vets v ON a.name = 'Boarmon' AND v.name = 'Maisy Smith';
INSERT INTO visits (animals_id, vets_id, date_of_visit) SELECT a.id, v.id, '2019-05-15' FROM animals a JOIN vets v ON a.name = 'Boarmon' AND v.name = 'Maisy Smith';
INSERT INTO visits (animals_id, vets_id, date_of_visit) SELECT a.id, v.id, '2020-02-27' FROM animals a JOIN vets v ON a.name = 'Boarmon' AND v.name = 'Maisy Smith';
INSERT INTO visits (animals_id, vets_id, date_of_visit) SELECT a.id, v.id, '2020-08-03' FROM animals a JOIN vets v ON a.name = 'Boarmon' AND v.name = 'Maisy Smith';
INSERT INTO visits (animals_id, vets_id, date_of_visit) SELECT a.id, v.id, '2020-05-24' FROM animals a JOIN vets v ON a.name = 'Blossom' AND v.name = 'Stephanie Mendez';
INSERT INTO visits (animals_id, vets_id, date_of_visit) SELECT a.id, v.id, '2020-01-11' FROM animals a JOIN vets v ON a.name = 'Blossom' AND v.name = 'William Tatcher';