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




--- Change the animals table
ALTER TABLE animals
DROP COLUMN species,
ADD COLUMN species_id INT,
ADD COLUMN owner_id INT,
ADD FOREIGN KEY (species_id) REFERENCES species(id),
ADD FOREIGN KEY (owner_id) REFERENCES owners(id);

