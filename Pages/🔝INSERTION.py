import streamlit as st
import mysql.connector

# Function to get database connection
def get_db_connection():
     if "db_auth" in st.session_state:
          db_auth = st.session_state["db_auth"]
          return mysql.connector.connect(
               host=db_auth["host"],
               user=db_auth["user"],
               password=db_auth["password"],
               database=db_auth["database"]
          )
     else:
          st.error("Entrez les informations de connexion à la base de données")
          return None

# Function to insert data into the database
def insert_data(table, data):
     try:
          db = get_db_connection()
          if db is None:
               return False
          cursor = db.cursor()
          placeholders = ", ".join(["%s"] * len(data))
          columns = ", ".join(data.keys())
          query = f"INSERT INTO {table} ({columns}) VALUES ({placeholders})"
          cursor.execute(query, list(data.values()))
          db.commit()
          cursor.close()
          db.close()
          return True
     except mysql.connector.Error as e:
          st.error(f"Erreur de base de données: {str(e)}")
          return False

st.markdown("<h1 style='text-align: center;'>🔝INSERTION</h1>", unsafe_allow_html=True)
tables = ["Classe", "Etudiants", "Matières", "Professeurs", "Examens", "Notes"]
selected_table = st.sidebar.radio("Sélectionnez la table pour l'insertion:", tables)

with st.form("insert_form"):
     if selected_table == "Classe":
          classe_nom = st.text_input("Nom de la Classe", max_chars=50)
          submit_button = st.form_submit_button(label="Insérer")
          if submit_button:
               if classe_nom:
                    insert_data("classe", {"classe_nom": classe_nom})
                    st.success("Données insérées avec succès!")
               else:
                    st.error("Le champ 'Nom de la Classe' est obligatoire.")

     elif selected_table == "Etudiants":
          # Get available classe IDs
          db = get_db_connection()
          cursor = db.cursor()
          cursor.execute("SELECT classe_id, classe_nom FROM classe")
          classes = cursor.fetchall()
          classe_dict = {str(cid): f"{cid} - {cnom}" for cid, cnom in classes}
          classe_id = st.selectbox("Classe", options=list(classe_dict.keys()), format_func=lambda x: classe_dict[x])
          classe_id = int(classe_id)

          personnel_nom = st.text_input("Nom de l'Étudiant", max_chars=50)
          famille_nom = st.text_input("Prénom de l'Étudiant", max_chars=50)
          date_de_naissance = st.date_input("Date de Naissance")
          sexe = st.selectbox("Sexe", ["Male", "Female", "Other"])
          email = st.text_input("Email", max_chars=100)
          phone = st.text_input("Numéro de Téléphone", max_chars=20)
          adresse = st.text_area("Adresse")
          submit_button = st.form_submit_button(label="Insérer")
          if submit_button:
               if personnel_nom and famille_nom and date_de_naissance and sexe:
                    insert_data("etudiants", {
                         "classe_id": classe_id,
                         "personnel_nom": personnel_nom,
                         "famille_nom": famille_nom,
                         "date_de_naissance": date_de_naissance,
                         "sexe": sexe,
                         "email": email,
                         "phone": phone,
                         "adresse": adresse
                    })
                    st.success("Données insérées avec succès!")
               else:
                    st.error("Les champs 'Nom', 'Prénom', 'Date de Naissance' et 'Sexe' sont obligatoires.")

     elif selected_table == "Matières":
          # Get available professeur IDs
          db = get_db_connection()
          cursor = db.cursor()
          cursor.execute("SELECT professeur_id, personnel_nom FROM professeurs")
          professeurs = cursor.fetchall()
          professeur_dict = {str(pid): f"{pid} - {pnom}" for pid, pnom in professeurs}
          professeur_id = st.selectbox("Professeur", options=list(professeur_dict.keys()), format_func=lambda x: professeur_dict[x])
          professeur_id = int(professeur_id)

          matières_code = st.text_input("Code de la Matière", max_chars=10)
          matières_nom = st.text_input("Nom de la Matière", max_chars=100)
          submit_button = st.form_submit_button(label="Insérer")
          if submit_button:
               if professeur_id and matières_code and matières_nom:
                    insert_data("matières", {
                         "professeur_id": professeur_id,
                         "matières_code": matières_code,
                         "matières_nom": matières_nom
                    })
                    st.success("Données insérées avec succès!")
               else:
                    st.error("Les champs 'ID du Professeur', 'Code de la Matière' et 'Nom de la Matière' sont obligatoires.")

     elif selected_table == "Professeurs":
          personnel_nom = st.text_input("Nom du Professeur", max_chars=50)
          famille_nom = st.text_input("Prénom du Professeur", max_chars=50)
          email = st.text_input("Email", max_chars=100)
          phone = st.text_input("Numéro de Téléphone", max_chars=20)
          submit_button = st.form_submit_button(label="Insérer")
          if submit_button:
               if personnel_nom and famille_nom:
                    insert_data("professeurs", {
                         "personnel_nom": personnel_nom,
                         "famille_nom": famille_nom,
                         "email": email,
                         "phone": phone
                    })
                    st.success("Données insérées avec succès!")
               else:
                    st.error("Les champs 'Nom' et 'Prénom' sont obligatoires.")

     elif selected_table == "Examens":
          # Get available classe IDs
          db = get_db_connection()
          cursor = db.cursor()
          cursor.execute("SELECT classe_id, classe_nom FROM classe")
          classes = cursor.fetchall()
          classe_dict = {str(cid): f"{cid} - {cnom}" for cid, cnom in classes}
          classe_id = st.selectbox("Classe", options=list(classe_dict.keys()), format_func=lambda x: classe_dict[x])
          classe_id = int(classe_id)
          
          # Get available matières IDs
          cursor.execute("SELECT matières_id, matières_nom FROM matières")
          matières = cursor.fetchall()
          matières_dict = {str(mid): f"{mid} - {mnom}" for mid, mnom in matières}
          matières_id = st.selectbox("Matière", options=list(matières_dict.keys()), format_func=lambda x: matières_dict[x])
          matières_id = int(matières_id)

          Examen_nom = st.text_input("Nom de l'Examen", max_chars=50)
          Examen_date = st.date_input("Date de l'Examen")
          submit_button = st.form_submit_button(label="Insérer")
          if submit_button:
               if classe_id and matières_id and Examen_nom and Examen_date:
                    insert_data("examens", {
                         "classe_id": classe_id,
                         "matières_id": matières_id,
                         "Examen_nom": Examen_nom,
                         "Examen_date": Examen_date
                    })
                    st.success("Données insérées avec succès!")
               else:
                    st.error("Les champs 'ID de la Classe', 'ID de la Matière', 'Nom de l'Examen' et 'Date de l'Examen' sont obligatoires.")

     elif selected_table == "Notes":
          # Get available étudiants IDs
          db = get_db_connection()
          cursor = db.cursor()
          cursor.execute("SELECT étudiants_id, personnel_nom FROM etudiants")
          etudiants = cursor.fetchall()
          etudiants_dict = {str(eid): f"{eid} - {enom}" for eid, enom in etudiants}
          étudiants_id = st.selectbox("Étudiant", options=list(etudiants_dict.keys()), format_func=lambda x: etudiants_dict[x])
          étudiants_id = int(étudiants_id)

          # Get available examen IDs
          cursor.execute("SELECT Examen_id, Examen_nom FROM examens")
          examens = cursor.fetchall()
          examens_dict = {str(eid): f"{eid} - {enom}" for eid, enom in examens}
          Examen_id = st.selectbox("Examen", options=list(examens_dict.keys()), format_func=lambda x: examens_dict[x])
          Examen_id = int(Examen_id)
          Note_obtenue = st.number_input("Note Obtenue", min_value=0.0, max_value=20.0)

          # Automatically determine mention based on note
          if Note_obtenue < 10:
               Mention = "Echec"
          elif Note_obtenue < 12:
               Mention = "Passable"
          elif Note_obtenue < 14:
               Mention = "Assez bien"
          elif Note_obtenue < 16:
               Mention = "Bien"
          else:
               Mention = "Très bien"

          st.text(f"Mention: {Mention}")

          Commentaire = st.text_area("Commentaire")
          submit_button = st.form_submit_button(label="Insérer")
          if submit_button:
               if étudiants_id and Examen_id and Note_obtenue:
                    insert_data("notes", {
                         "étudiants_id": étudiants_id,
                         "Examen_id": Examen_id,
                         "Note_obtenue": Note_obtenue,
                         "Mention": Mention,
                         "Commentaire": Commentaire
                    })
                    st.success("Données insérées avec succès!")
               else:
                    st.error("Les champs 'ID de l'Étudiant', 'ID de l'Examen' et 'Note Obtenue' sont obligatoires.")