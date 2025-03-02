/* Query [educationldb] */

-- Ajoutons les clés étrangères

-- Ajouter les clés étrangères à la table Etudiants
ALTER TABLE Etudiants
ADD CONSTRAINT fk_etudiants_classe
FOREIGN KEY (classe_id) REFERENCES Classe(classe_id); -- Lie chaque étudiant à sa classe id

-- Ajouter les clés étrangères à la table Classe
ALTER TABLE Classe
ADD CONSTRAINT fk_classe_matieres
FOREIGN KEY (matières_id) REFERENCES Matières(matières_id); -- Associe chaque classe à une matière via son id

-- Ajouter les clés étrangères à la table Professeurs 
ALTER TABLE Professeurs
ADD CONSTRAINT fk_professeurs_matieres
FOREIGN KEY (matières_id) REFERENCES Matières(matières_id); -- Relie chaque professeur à la matière qu'il enseigne par id

-- Ajouter une colonne et une clé étrangère à la table Matières
ALTER TABLE Matières
ADD CONSTRAINT fk_matieres_professeur
FOREIGN KEY (professeur_id) REFERENCES Professeurs(professeur_id); -- Relie chaque matière au professeur qui l'enseignepar id

-- Ajouter les clés étrangères à la table Examens
ALTER TABLE Examens
ADD CONSTRAINT fk_examens_classe
FOREIGN KEY (classe_id) REFERENCES Classe(classe_id); -- Relie chaque examen à la classe qui le passe

-- Ajouter les clés étrangères à la table Notes
ALTER TABLE Notes
ADD CONSTRAINT fk_notes_etudiants
FOREIGN KEY (étudiants_id) REFERENCES Etudiants(étudiants_id) ON DELETE CASCADE, -- Lie chaque note à un étudiant par id
ADD CONSTRAINT fk_notes_matieres
FOREIGN KEY (matières_id) REFERENCES Matières(matières_id) ON DELETE CASCADE, -- Associe chaque note à une matière par id
ADD CONSTRAINT fk_notes_examens
FOREIGN KEY (Examen_id) REFERENCES Examens(Examen_id) ON DELETE CASCADE, -- Relie chaque note à un examen par id
ADD CONSTRAINT fk_notes_classe
FOREIGN KEY (classe_id) REFERENCES Classe(classe_id) ON DELETE CASCADE; -- Associe chaque note à une classe par id
