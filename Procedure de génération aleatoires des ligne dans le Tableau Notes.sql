
DELIMITER //

CREATE PROCEDURE `AttribuerNotesAleatoiresAuxEtudiants`()
BEGIN
    -- Déclarer les variables
    DECLARE terminé BOOLEAN DEFAULT FALSE;
    DECLARE id_etudiant INT;
    DECLARE id_classe_etudiant INT;
    DECLARE id_examen INT;
    DECLARE note_aleatoire FLOAT;
    DECLARE mention VARCHAR(20);
    
    -- Curseur pour tous les étudiants
    DECLARE curseur_etudiant CURSOR FOR
        SELECT étudiants_id, classe_id FROM Etudiants;
    
    -- Gestionnaire pour quand le curseur est terminé
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET terminé = TRUE;
    
    -- Ouvrir le curseur des étudiants
    OPEN curseur_etudiant;
    
    -- Boucle à travers tous les étudiants
    boucle_etudiant: LOOP
        -- Récupérer le prochain étudiant
        FETCH curseur_etudiant INTO id_etudiant, id_classe_etudiant;
        
        -- Quitter la boucle si terminé
        IF terminé THEN
            LEAVE boucle_etudiant;
        END IF;
        
        -- Maintenant récupérer tous les examens pour la classe de cet étudiant à partir de la table Examens existante
        BEGIN
            DECLARE examen_terminé BOOLEAN DEFAULT FALSE;
            DECLARE curseur_examen CURSOR FOR
                SELECT Examen_id 
                FROM Examens
                WHERE classe_id = id_classe_etudiant;
                
            DECLARE CONTINUE HANDLER FOR NOT FOUND SET examen_terminé = TRUE;
            
            -- Ouvrir le curseur des examens
            OPEN curseur_examen;
            
            -- Boucle à travers tous les examens pour cette classe
            boucle_examen: LOOP
                -- Récupérer le prochain examen
                FETCH curseur_examen INTO id_examen;
                
                -- Quitter la boucle si terminé
                IF examen_terminé THEN
                    LEAVE boucle_examen;
                END IF;
                
                -- Générer une note aléatoire entre 0 et 20
                SET note_aleatoire = ROUND(RAND() * 20, 1);
                
                -- Déterminer la mention en fonction de la note
                IF note_aleatoire < 10 THEN
                    SET mention = NULL;
                ELSEIF note_aleatoire < 14 THEN
                    SET mention = 'Assez bien';
                ELSEIF note_aleatoire < 16 THEN
                    SET mention = 'Bien';
                ELSEIF note_aleatoire <= 20 THEN
                    SET mention = 'Très bien';
                END IF;
                
                -- Vérifier si une note existe déjà pour cet étudiant et cet examen
                IF NOT EXISTS (SELECT 1 FROM Notes WHERE étudiants_id = id_etudiant AND Examen_id = id_examen) THEN
                    -- Insérer une nouvelle note
                    INSERT INTO Notes (étudiants_id, Examen_id, Note_obtenue, Mention)
                    VALUES (id_etudiant, id_examen, note_aleatoire, mention);
                END IF;
            END LOOP boucle_examen;
            
            -- Fermer le curseur des examens
            CLOSE curseur_examen;
        END;
        
    END LOOP boucle_etudiant;
    
    -- Fermer le curseur des étudiants
    CLOSE curseur_etudiant;
    
    -- Retourner un message de statut
    SELECT 'Notes aléatoires attribuées avec succès à tous les étudiants.' AS Resultat;
END

DELIMITER ;
