CREATE TABLE animals (
	id INT PRIMARY KEY NOT NULL,
	name VARCHAR(20) NOT NULL,
	date_of_birth date NOT NULL,
	escape_attempts INT,
	neutered BOOLEAN,
	weight_kg DECIMAL
); 


ALTER TABLE animals
ADD COLUMN species VARCHAR(30);


--New tables owner and sepecies

CREATE TABLE owners (
    id INT PRIMARY KEY,
    full_name VARCHAR(255),
    age INT  
);


CREATE TABLE species (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255)
);


--Create vets table

create table vets (
	id SERIAL PRIMARY KEY,
	name VARCHAR(20),
	age INT,
	data_of_graduation DATE
)

--Join table -1

CREATE TABLE specializations (
    id SERIAL PRIMARY KEY,
    vet_id INTEGER REFERENCES vets(id) ON UPDATE CASCADE ON DELETE CASCADE,
    species_id INTEGER REFERENCES species(id) ON UPDATE CASCADE ON DELETE CASCADE
);

--Join table -2
CREATE TABLE visits (
    id SERIAL PRIMARY KEY,
    animal_id INTEGER REFERENCES animals(id) ON UPDATE CASCADE ON DELETE CASCADE,
    vet_id INTEGER REFERENCES vets(id) ON UPDATE CASCADE ON DELETE CASCADE,
    visit_date DATE NOT NULL
);


--- Change the animals table
ALTER TABLE animals
DROP COLUMN species,
ADD COLUMN species_id INT,
ADD COLUMN owner_id INT,
ADD FOREIGN KEY (species_id) REFERENCES species(id),
ADD FOREIGN KEY (owner_id) REFERENCES owners(id);

