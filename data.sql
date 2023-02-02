/* Populate database with sample data. */

INSERT INTO
  animals (
    id,
    name,
    date_of_birth,
    escape_attempts,
    neutered,
    weight_kg,
    species
  )
VALUES
  (1,'Agumon', '2020-02-03', 0, true, 10.23),
  (2,'Gabumon', '2018-11-15', 2, true, 8),
  (3,'Pikachu', '2021-01-07', 1, false, 15.04),
  (4,'Devimon', '2017-05-12', 5, true, 11.00);
  (6	"Plantmon"	"2021-11-15"	2	true	5.7);	
  (7	"Squirtle"	"1993-04-02"	3	false	12.13)	
  (8	"Angemon"	"2005-06-12"	1	true	45);	
  (9	"Boarmon"	"2005-06-07"	7	true	20.4);	
  (10	"Blossom"	"1998-10-13"	3	true	17);
  (11	"Ditto"	"2022-05-14"	4	true	22);		


  -- Insert data into owners

INSERT INTO owners (full_name, age)
VALUES ('Sam Smith', 34),
  ('Jennifer Orwell', 19),
  ('Bob', 45),
  ('Melody Pond', 77),
  ('Dean Winchester', 14),
  ('Jodie Whittaker', 38);

  -- Insert data into Species
INSERT INTO species (name) 
VALUES ('Pokemon'),
  ('Digimon');

  -- Update the animals table with SPECIES_ID
  UPDATE animals
SET species_id = (
    SELECT id FROM species WHERE name = (
        CASE
            WHEN animals.name LIKE '%mon' THEN 'Digimon'
            ELSE 'Pokemon'
        END
    )
);

-- Update the anmila table with OWNER_ID


UPDATE animals 
SET owner_id = (
    SELECT id 
    FROM owners 
    WHERE full_name = (
        CASE animals.name 
            WHEN 'Agumon' THEN 'Sam Smith' 
            WHEN 'Gabumon' THEN 'Jennifer Orwell' 
            WHEN 'Pikachu' THEN 'Jennifer Orwell' 
            WHEN 'Devimon' THEN 'Bob' 
            WHEN 'Plantmon' THEN 'Bob' 
            WHEN 'Charmander' THEN 'Melody Pond' 
            WHEN 'Squirtle' THEN 'Melody Pond' 
            WHEN 'Blossom' THEN 'Melody Pond' 
            WHEN 'Angemon' THEN 'Dean Winchester' 
            WHEN 'Boarmon' THEN 'Dean Winchester' 
        END
    )
);