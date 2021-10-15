/* CREATED animals TABLE */
CREATE TABLE animals (
  id INT GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(50),
  date_of_birth DATE,
  escape_attempts INT,
  neutered BOOLEAN,
  weight_kg DECIMAL(10, 2),
  PRIMARY KEY(id)
);

/*ADD NEW COLLUM species*/
ALTER TABLE animals ADD species VARCHAR(50);

/* CREATED owners TABLE */
CREATE TABLE owners (
  id INT GENERATED ALWAYS AS IDENTITY,
  full_name VARCHAR(80),
  age INT,
  PRIMARY KEY(id)
);

/* CREATED species TABLE */
CREATE TABLE species (
  id INT GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(50),
  PRIMARY KEY(id)
);

/* REMOVE COLLUM species AND ADD species_id AND owner_id*/
ALTER TABLE animals DROP species;
 
ALTER TABLE animals ADD species_id INT;

ALTER TABLE animals ADD owner_id INT;

/* ADD FOREIGN KEYS TO owner_id AND species_id */
ALTER TABLE animals ADD CONSTRAINT owners
FOREIGN KEY(owner_id) REFERENCES owners(id);

ALTER TABLE animals ADD CONSTRAINT species_fk
FOREIGN KEY(species_id) REFERENCES species(id);

/* CREATED vets TABLE */
CREATE TABLE vets (
  id INT GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(80),
  age INT,
  date_of_graduation DATE,
  PRIMARY KEY(id)
);

/* CREATED specializations TABLE */
CREATE TABLE specializations (
	species_id INT,
  vets_id INT,
  CONSTRAINT species_fk
  FOREIGN KEY(species_id) REFERENCES species(id);
	CONSTRAINT vets_fk
  FOREIGN KEY(vets_id) REFERENCES vets (id);	
);

/* CREATED visits TABLE */
CREATE TABLE visits (
	animals_id INT,
  vets_id INT,
  date_of_visit DATE,
  CONSTRAINT animals_fk
  FOREIGN KEY(animals_id) REFERENCES animals (id);
	CONSTRAINT vets_fk
  FOREIGN KEY(vets_id) REFERENCES vets (id);
);