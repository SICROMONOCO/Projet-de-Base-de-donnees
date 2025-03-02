/* Query [Server] */

CREATE DATABASE EducationLDB2;
USE EducationLDB2;

/* Query [educationldb] */

CREATE TABLE Classe (
  classe_id INT PRIMARY KEY AUTO_INCREMENT,
  classe_nom VARCHAR(50) NOT NULL,
);

CREATE TABLE Etudiants (
  étudiants_id INT PRIMARY KEY AUTO_INCREMENT,
  classe_id INT NULL,
  personnel_nom VARCHAR(50) NOT NULL,
  famille_nom VARCHAR(50) NOT NULL,
  date_de_naissance DATE NOT NULL,
  sexe ENUM('Male', 'Female', 'Other'),
  email VARCHAR(100) UNIQUE,
  phone VARCHAR(20),
  adresse TEXT NULL
);

CREATE TABLE Matières (
  matières_id INT PRIMARY KEY AUTO_INCREMENT,
  professeur_id INT,
  matières_code VARCHAR(10) UNIQUE NOT NULL,
  matières_nom VARCHAR(100) NOT NULL
);

CREATE TABLE Professeurs (
  professeur_id INT PRIMARY KEY AUTO_INCREMENT,
  personnel_nom VARCHAR(50) NOT NULL,
  famille_nom VARCHAR(50) NOT NULL,
  email VARCHAR(100) UNIQUE,
  phone VARCHAR(20)
);

CREATE TABLE Examens (
  Examen_id INT PRIMARY KEY AUTO_INCREMENT,
  classe_id INT,
  matières_id INT,
  Examen_nom VARCHAR(50) NOT NULL,
  Examen_date DATE NOT NULL
);

CREATE TABLE Notes (
  notes_id INT PRIMARY KEY AUTO_INCREMENT,
  étudiants_id INT,
  Examen_id INT,
  Note_obtenue FLOAT CHECK ( Note_obtenue BETWEEN 0 AND 20 ),
  Mention ENUM('Passable', 'Assez bien', 'Bien', 'Très bien'),
  Commentaire TEXT
);
