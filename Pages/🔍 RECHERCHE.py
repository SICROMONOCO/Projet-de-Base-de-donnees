import mysql.connector
import pandas as pd
import streamlit as st
from fpdf import FPDF
import base64

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

class RelevePDF(FPDF):
    def __init__(self):
        super().__init__()
        self.set_auto_page_break(auto=True, margin=15)
        self.add_page()
        self.set_font("Helvetica", size=10)
        
    def create_student_info_table(self, student_info):
        """Create the student information table"""
        self.set_font("Helvetica", "B", 24)
        self.cell(0, 10, "RELEVÉ DE NOTES", 0, 1, "C")
        self.ln(5)
        
        self.set_font("Helvetica", "B", 10)
        
        # Table settings
        col_width = 47
        row_height = 7
        
        # First row - Headers
        self.cell(col_width, row_height, "NOM", 0, 0, "L")
        self.cell(col_width, row_height, "PRÉNOM", 0, 0, "L")
        self.cell(col_width, row_height, "DATE DE NAISSANCE", 0, 0, "L")
        self.cell(col_width, row_height, "SEXE", 0, 1, "L")
        
        # Second row - Values
        self.set_font("Helvetica", "", 10)
        self.cell(col_width, row_height, str(student_info["NOM"]), 0, 0, "L")
        self.cell(col_width, row_height, str(student_info["PRÉNOM"]), 0, 0, "L")
        self.cell(col_width, row_height, str(student_info["DATE DE NAISSANCE"]), 0, 0, "L")
        self.cell(col_width, row_height, str(student_info["SEXE"]), 0, 1, "L")
        
        # Third row - Headers
        self.set_font("Helvetica", "B", 10)
        self.cell(col_width, row_height, "ÉTUDIANT ID", 0, 0, "L")
        self.cell(col_width, row_height, "", 0, 0, "L")
        self.cell(col_width, row_height, "CLASS", 0, 0, "L")
        self.cell(col_width, row_height, "", 0, 1, "L")
        
        # Fourth row - Values
        self.set_font("Helvetica", "", 10)
        self.cell(col_width, row_height, str(student_info["ÉTUDIANT ID"]), 0, 0, "L")
        self.cell(col_width, row_height, "", 0, 0, "L")
        self.cell(col_width, row_height, str(student_info["CLASS"]), 0, 0, "L")
        self.cell(col_width, row_height, "", 0, 1, "L")
        
        # Fifth row - Headers
        self.set_font("Helvetica", "B", 10)
        self.cell(col_width, row_height, "EMAIL", 0, 0, "L")
        self.cell(col_width, row_height, "", 0, 0, "L")
        self.cell(col_width, row_height, "NUMÉRO DE TÉLÉPHONE", 0, 0, "L")
        self.cell(col_width, row_height, "", 0, 1, "L")
        
        # Sixth row - Values
        self.set_font("Helvetica", "", 10)
        self.cell(col_width, row_height, str(student_info["EMAIL"]), 0, 0, "L")
        self.cell(col_width, row_height, "", 0, 0, "L")
        self.cell(col_width, row_height, str(student_info["NUMÉRO DE TÉLÉPHONE"]), 0, 0, "L")
        self.cell(col_width, row_height, "", 0, 1, "L")
        
        # Seventh row - Headers
        self.set_font("Helvetica", "B", 10)
        self.cell(col_width, row_height, "ADDRESS", 0, 0, "L")
        self.cell(col_width * 3, row_height, "", 0, 1, "L")
        
        # Eighth row - Values
        self.set_font("Helvetica", "", 10)
        # Split address into multiple lines if needed
        address_lines = str(student_info["ADDRESS"]).split("\n")
        address_text = address_lines[0]
        self.cell(col_width * 4, row_height, address_text, 0, 1, "L")
        
        for i in range(1, len(address_lines)):
            self.cell(col_width * 4, row_height, address_lines[i], 0, 1, "L")

def create_pdf(student, class_name, global_average, notes_data):

    pdf = RelevePDF()
    
    # Student Information
    student_info = {
        "NOM": student[2],
        "PRÉNOM": student[3],
        "DATE DE NAISSANCE": str(student[4]) if student[4] else "",
        "SEXE": student[5],
        "ÉTUDIANT ID": student[0],
        "CLASS": class_name,
        "EMAIL": str(student[6]) if student[6] else "",
        "NUMÉRO DE TÉLÉPHONE": str(student[7]) if student[7] else "",
        "ADDRESS": str(student[8]) if student[8] else ""
    }
    pdf.create_student_info_table(student_info)
    
    # Notes Table
    exams = []
    for note in notes_data:
        exams.append([note[1], note[3], f"{note[4]}/20"])
    create_exams_table(pdf, exams)
    
    # Global Average
    create_average_table(pdf, global_average)
    
    return pdf

def fetch_data(query, params=None):
    db = get_db_connection()
    cursor = db.cursor()
    cursor.execute(query, params)
    data = cursor.fetchall()
    cursor.close()
    db.close()
    return data

def create_exams_table(pdf, exams):
    """Create the exams table"""
    pdf.ln(10)
    
    # Table header
    pdf.set_font("Helvetica", "B", 10)
    pdf.cell(80, 7, "NOM D'EXAMEN", 1, 0, "L")
    pdf.cell(80, 7, "MATIÈRE", 1, 0, "L")
    pdf.cell(30, 7, "NOTE", 1, 1, "C")
    
    # Table data
    pdf.set_font("Helvetica", "", 10)
    
    # If there are fewer than 9 exams, add empty rows to make 9
    exam_count = len(exams)
    for i in range(exam_count):
        pdf.cell(80, 7, exams[i][0], 1, 0, "L")
        pdf.cell(80, 7, exams[i][1], 1, 0, "L")
        pdf.cell(30, 7, exams[i][2], 1, 1, "C")
    
    # Add empty rows if needed
    for i in range(exam_count, 9):
        pdf.cell(80, 7, "", 1, 0, "L")
        pdf.cell(80, 7, "", 1, 0, "L")
        pdf.cell(30, 7, "", 1, 1, "C")

def create_average_table(pdf, average_score):
    """Create the average score table"""
    pdf.ln(10)
    pdf.set_font("Helvetica", "B", 16)
    pdf.cell(0, 10, f"NOTE MOYENNE: {average_score}/20", 1, 1, "C")
def download_pdf(pdf):
    pdf_output = pdf.output(dest='S').encode('latin1')
    b64 = base64.b64encode(pdf_output).decode()
    href = f'<a href="data:application/octet-stream;base64,{b64}" download="releve_de_notes.pdf">Télécharger le PDF</a>'
    return href

def fetch_data(query, params=None):
    db = get_db_connection()
    cursor = db.cursor()
    cursor.execute(query, params)
    data = cursor.fetchall()
    cursor.close()
    db.close()
    return data

st.markdown("<h1 style='text-align: center;'>🔍 RECHERCHE</h1>", unsafe_allow_html=True)

with st.sidebar:
     table = st.radio("Sélectionnez la table:", ("Classe", "Etudiants", "Matières", "Professeurs", "Examens", "Notes"))
     search_method = st.radio(f"Rechercher par :", ("ID", "Nom"))
     search_value = st.text_input("", help=f"Entrer le {search_method} de l'elements cherchable dans le tableau {table}")

if table == "Etudiants":

     if search_method == "ID":
          db = get_db_connection()
          cursor = db.cursor()
          query = """
               SELECT * FROM etudiants WHERE étudiants_id = %s;
          """
          cursor.execute(query, (search_value,))
     else:
          db = get_db_connection()
          cursor = db.cursor()
          query = """
               SELECT * FROM etudiants WHERE famille_nom LIKE %s OR personnel_nom LIKE %s;
          """
          cursor.execute(query, (f"%{search_value}%", f"%{search_value}%"))

     student_data = cursor.fetchall()

     if student_data:

          student = student_data[0]

          class_query = """
               SELECT classe_nom FROM classe WHERE classe_id = %s;
          """

          cursor.execute(class_query, (student[1],))
          class_name = cursor.fetchone()[0]

          avg_query = """
               SELECT AVG(n.Note_obtenue) as moyenne_globale, COUNT(n.Note_obtenue) as nombre_notes
               FROM notes n
               WHERE n.étudiants_id = %s;
          """

          cursor.execute(avg_query, (student[0],))
          avg_data = cursor.fetchone()
          global_average = round(avg_data[0], 2) if avg_data[0] else 0

          notes_query = """
               SELECT n.Examen_id, e.Examen_nom, e.Examen_date, m.matières_nom, n.Note_obtenue, n.Mention
               FROM notes n
               JOIN examens e ON n.Examen_id = e.Examen_id
               JOIN matières m ON e.matières_id = m.matières_id
               WHERE n.étudiants_id = %s
               ORDER BY e.Examen_date DESC;
          """

          cursor.execute(notes_query, (student[0],))
          notes_data = cursor.fetchall()

          notes_query2 = """
               SELECT COUNT(CASE WHEN Note_obtenue >= 10 THEN 1 END), COUNT(CASE WHEN Note_obtenue < 10 THEN 1 END)
               FROM notes
               WHERE étudiants_id = %s;
          """

          cursor.execute(notes_query2, (student[0],))
          notes_data2 = cursor.fetchone()

          st.success("Etudiants trouvé.")
          st.header("Information de Base")
          st.markdown("---")

          details = {
               "Nom": student[2],
               "Prénom": student[3],
               "Date de Naissance": student[4],
               "Sexe": student[5],
               "ID Étudiant": student[0],
               "Classe": class_name,
               "Numéro de Téléphone": student[7],
               "Email": student[6],
               "Adresse": student[8]
          }

          cols = st.columns(2)
          
          for i, (key, value) in enumerate(details.items()):
              with cols[i % 2]:
                  st.markdown(
                      f"""
                      <div style="border: 1px solid #ccc; border-radius: 10px; padding: 15px; margin: 15px;">
                          <strong>{key} :</strong> \n\n <h3>{value}</h3>
                      </div>
                      """,
                      unsafe_allow_html=True
                  )

          st.header("Information Detaillee")
          st.markdown("---")

          details = {    
               "ID Étudiant": student[0],
               "ID Classe": student[1],
               "Nombre de Examens validee": notes_data2[0],
               "Nombre de Examens Non validee": notes_data2[1]
          }

          cols = st.columns(2)

          for i, (key, value) in enumerate(details.items()):
              with cols[i % 2]:
                  st.markdown(
                      f"""
                      <div style="border: 1px solid #ccc; border-radius: 10px; padding: 15px; margin: 15px;">
                          <strong>{key} :</strong> \n\n <h3>{value}</h3>
                      </div>
                      """,
                      unsafe_allow_html=True
                  )

          cols2 = st.columns(2)

          with cols2[0].container(height=150):
               classes_details = fetch_data(f"SELECT e.Examen_id, e.matières_id, m.matières_code, n.Note_obtenue FROM matières m JOIN examens e ON e.matières_id = m.matières_id JOIN notes n ON n.Examen_id = e.Examen_id WHERE n.Note_obtenue >= 10 AND n.étudiants_id = {student[0]}")
               details_df = pd.DataFrame(classes_details, columns=["Examen ID","Matières ID","Matières code","Note Obtenue"])
               st.table(details_df)
          with cols2[1].container(height=150): 
               classes_details = fetch_data(f"SELECT e.Examen_id, e.matières_id, m.matières_code, n.Note_obtenue FROM matières m JOIN examens e ON e.matières_id = m.matières_id JOIN notes n ON n.Examen_id = e.Examen_id WHERE n.Note_obtenue < 10 AND n.étudiants_id = {student[0]}")
               details_df = pd.DataFrame(classes_details, columns=["Examen ID","Matières ID","Matières code","Note Obtenue"])
               st.table(details_df)
               
          if global_average >= 10:
               color,marks = "green", "Validee"
          else:
              color,marks = "red", "Non Validee"

          st.markdown(
          f"""
          <div style="border: 1px solid #ccc; border-radius: 10px; padding: 15px; margin: 15px;">
               <div style="text-align: center;">
                    <strong style="font-size: 16px;">Moyenne Globale</strong>
                    <div style="color: {color}; font-weight: bold; font-size: 48px; margin-top: 10px;">
                         {global_average}/20
                    </div >
                    <div style="color: {color}; font-weight: bold; font-size: 16px;" >{marks}</div>
               </div>
          </div>
          """,
          unsafe_allow_html=True
          )

          pdf = create_pdf(student, class_name, global_average, notes_data)
          pdf_output = pdf.output(dest='S').encode('latin1')
          b64 = base64.b64encode(pdf_output).decode()
          href = f'<a href="data:application/octet-stream;base64,{b64}" download="releve_de_notes.pdf">Télécharger le PDF</a>'
          st.markdown(
              f"""
              <div style="text-align: center; margin-top: 20px; border: 1px solid #ccc; border-radius: 10px; padding: 15px; margin: 15px;">
                    <strong style="font-size: 16px;">Télécharger le relvé de notes</strong>
               <div>
                    <a href="data:application/octet-stream;base64,{b64}" download="(ID Etu. :{student[0]}, ID Cla. :{student[1]}) {student[2]} {student[3]}.pdf">
                         <button style="border: 1px solid #ccc; border-radius: 10px; padding: 15px; margin: 15px;"> ⬇️ Télécharger</button>
                    </a>
               </div>
               </div>
              """,
              unsafe_allow_html=True
          )

     else:
         st.error("Étudiant non trouvé.")

if table == "Classe":
    

     if search_method == "ID":
          db = get_db_connection()
          cursor = db.cursor()
          query = """
               SELECT * FROM classe WHERE classe_id = %s;
          """
          cursor.execute(query, (search_value,))
     else:
          db = get_db_connection()
          cursor = db.cursor()
          query = """
               SELECT * FROM classe WHERE classe_nom LIKE %s;
          """
          cursor.execute(query, (f"%{search_value}%",))
     
     Classe_data = cursor.fetchall()

     if Classe_data:

          classe = Classe_data[0]

          query_count_etu ="""
          SELECT COUNT(étudiants_id)
          FROM etudiants
          WHERE classe_id = %s;"""

          cursor.execute(query_count_etu, (classe[0],))
          count_etu = cursor.fetchone()[0]


          query_count_mat = """
          SELECT COUNT(m.matières_id)
          FROM matières m
          INNER JOIN examens e ON e.matières_id = m.matières_id
          WHERE e.classe_id = %s;"""

          cursor.execute(query_count_mat, (classe[0],))
          count_mat = cursor.fetchone()[0]

          query_count_exam = """
          SELECT COUNT(Examen_id)
          FROM examens e
          JOIN classe c ON c.classe_id = e.classe_id
          WHERE e.classe_id = %s;"""

          cursor.execute(query_count_exam, (classe[0],))
          count_exam = cursor.fetchone()[0]

          query_count_prof = """
          SELECT COUNT(p.professeur_id)
          FROM professeurs p
          JOIN matières m ON m.professeur_id = p.professeur_id
          JOIN examens e ON e.matières_id = m.matières_id
          WHERE e.classe_id = %s;"""

          cursor.execute(query_count_prof, (classe[0],))
          count_prof = cursor.fetchone()[0]


          cursor.close()
          db.close()

          st.success("Classe trouvé.")
          st.header("Information de Base")
          st.markdown("---")

          details = {
              "Nom de classe": classe[1],
              "Nombres d'etudiants": count_etu,
              "Nombre de matieres": count_mat,
              "nombre de professeurs": count_prof,
              "nombre d'exames": count_exam,
          }

          cols = st.columns(2)
          
          for i, (key, value) in enumerate(details.items()):
              with cols[i % 2]:
                  st.markdown(
                      f"""
                      <div style="border: 1px solid #ccc; border-radius: 10px; padding: 15px; margin: 15px;">
                          <strong>{key} :</strong> \n\n <h3>{value}</h3>
                      </div>
                      """,
                      unsafe_allow_html=True
                  )
          
          st.header("Information Detaillee")
          st.markdown("---")
          
          st.markdown(
                      f"""
                      <div style="border: 1px solid #ccc; border-radius: 10px; padding: 15px; margin: 15px;">
                          <strong> ID Classe :</strong> \n\n <h3>{classe[0]}</h3>
                      </div>
                      """,
                      unsafe_allow_html=True
                  )
          
          cols2 = st.columns(2)

          with cols2[0]:
               st.subheader(" Les étudiants de classe :")
          with cols2[1]:
               st.subheader(" Les professeur de classe :")
               

          with cols2[0].container(height=150):
               classes_details = fetch_data(f"SELECT étudiants_id, personnel_nom, famille_nom FROM etudiants WHERE classe_id = {classe[0]}")
               details_df = pd.DataFrame(classes_details, columns=["étudiants ID","Prenom","Nom"])
               st.table(details_df)
          with cols2[1].container(height=150): 
               classes_details = fetch_data(f"SELECT p.professeur_id, p.personnel_nom, p.famille_nom, m.matières_code FROM professeurs p JOIN matières m ON m.professeur_id = p.professeur_id JOIN examens e ON e.matières_id = m.matières_id WHERE e.classe_id = {classe[0]}")
               details_df = pd.DataFrame(classes_details, columns=["Professeur ID","Prenom","Nom", "Responsable de (Matiere Code)"])
               st.table(details_df)
               
          st.subheader(" Toutes Les notes de Class :")
          with st.container(height=300):
               classes_details = fetch_data(f"SELECT n.Examen_id, m.matières_code, n.notes_id, n.Note_obtenue FROM notes n join examens e ON e.Examen_id = n.Examen_id join matières m ON m.matières_id = e.matières_id WHERE e.classe_id = {classe[0]}")
               details_df = pd.DataFrame(classes_details, columns=["Examen ID","Prenom","Nom", "Responsable de (Matiere Code)"])
               st.table(details_df)
     
     else:
         st.error("Classe non trouvé.")

if table == "Notes":
     if search_method == "ID":
          db = get_db_connection()
          cursor = db.cursor()
          query = """
               SELECT n.notes_id, n.étudiants_id, e.personnel_nom, e.famille_nom, 
                       n.Examen_id, m.matières_id, m.matières_code, m.matières_nom, p.professeur_id, 
                       p.personnel_nom as prof_prenom, p.famille_nom as prof_nom,
                       n.Note_obtenue, n.Mention, n.Commentaire, ex.Examen_nom
               FROM notes n
               JOIN etudiants e ON e.étudiants_id = n.étudiants_id
               JOIN examens ex ON ex.Examen_id = n.Examen_id
               JOIN matières m ON m.matières_id = ex.matières_id
               JOIN professeurs p ON p.professeur_id = m.professeur_id
               WHERE n.notes_id = %s
          """
          cursor.execute(query, (search_value,))
          note_data = cursor.fetchall()
          cursor.close()
          db.close()

          if note_data:
               
               note = note_data[0]
               Note_status = "Validee" if note[11] >= 10 else "Non Validee"
               details = {
                    "ID Note": note[0],
                    "Étudiant": f"{note[2]} {note[3]} (ID: {note[1]})",
                    "ID Examen": note[4], 
                    "Matière": f"{note[7]} (Code: {note[6]}, ID: {note[5]})",
                    "Professeur": f"{note[9]} {note[10]} (ID: {note[8]})",
                    "Note Obtenue": f"{note[11]}/20 ({Note_status})",
                    "Mention": note[12] if note[12] else "Non définie",
                    
               }

               st.success("Note trouvée.")
               st.header("Information de Base")
               st.markdown("---")

               cols = st.columns(2)
               for i, (key, value) in enumerate(details.items()):
                    with cols[i % 2]:
                         st.markdown(
                              f"""
                              <div style="border: 1px solid #ccc; border-radius: 10px; padding: 15px; margin: 15px;">
                                   <strong>{key} :</strong> \n\n <h3>{value}</h3>
                              </div>
                              """,
                              unsafe_allow_html=True
                         )

               details2 = {
                    "Nom Examen": note[14],
                    "Commentaire": note[13] if note[13] else "Aucun commentaire"
               }

               for i, (key, value) in enumerate(details2.items()):
                         st.markdown(
                              f"""
                              <div style="border: 1px solid #ccc; border-radius: 10px; padding: 15px; margin: 15px;">
                                   <strong>{key} :</strong> \n\n <h3>{value}</h3>
                              </div>
                              """,
                              unsafe_allow_html=True
                         )

               st.header("Information Detaillee")
               st.markdown("---")

               cols2 = st.columns(3)
               st.subheader("Notes de l'étudiant" +" "+f"{note[2]} {note[3]} (ID: {note[1]}):")
               with st.container(height=300):
                    student_notes = fetch_data("""SELECT n.notes_id, n.Note_obtenue, n.Mention FROM notes n JOIN etudiants e ON e.étudiants_id = n.étudiants_id WHERE n.étudiants_id = %s""", (note[1],))
                    student_df = pd.DataFrame(student_notes, columns=["Note ID", "Note obtenue", "Mention"])
                    st.table(student_df)


               st.subheader("Notes du professeur"+" "+f"{note[9]} {note[10]} (ID: {note[8]}):")
               with st.container(height=300):
                    prof_notes = fetch_data("""SELECT n.notes_id, n.étudiants_id, CONCAT(e.personnel_nom, ' ', e.famille_nom) as full_name, n.Note_obtenue, n.Mention FROM notes n JOIN etudiants e ON e.étudiants_id = n.étudiants_id JOIN examens ex ON ex.Examen_id = n.Examen_id JOIN matières m ON m.matières_id = ex.matières_id WHERE m.professeur_id = %s""", (note[8],))
                    prof_df = pd.DataFrame(prof_notes, columns=["Note ID", "Étudiant ID", "Nom complet", "Note obtenue", "Mention"])
                    st.table(prof_df)

               st.subheader("Notes de la matière" +" "+f"{note[7]} (Code: {note[6]}, ID: {note[5]}):")
               with st.container(height=300):
                    subject_notes = fetch_data("""SELECT n.notes_id, n.étudiants_id, CONCAT(e.personnel_nom, ' ', e.famille_nom) as full_name, n.Note_obtenue, n.Mention FROM notes n JOIN etudiants e ON e.étudiants_id = n.étudiants_id JOIN examens ex ON ex.Examen_id = n.Examen_id WHERE ex.matières_id = %s""", (note[5],))
                    subject_df = pd.DataFrame(subject_notes, columns=["Note ID", "Étudiant ID", "Nom complet", "Note obtenue", "Mention"])
                    st.table(subject_df)
          else:
               st.error("Note non trouvée.")

if table == "Professeurs":
     if search_method == "ID":
          db = get_db_connection()
          cursor = db.cursor()
          query = """
               SELECT p.professeur_id, p.famille_nom, p.personnel_nom, p.phone, p.email,
                       GROUP_CONCAT(DISTINCT m.matières_nom) as subjects,
                       GROUP_CONCAT(DISTINCT CONCAT(c.classe_nom, ' (ID:', c.classe_id, ')')) as class_ids
               FROM professeurs p
               LEFT JOIN matières m ON m.professeur_id = p.professeur_id
               LEFT JOIN examens e ON e.matières_id = m.matières_id
               LEFT JOIN classe c ON c.classe_id = e.classe_id
               WHERE p.professeur_id = %s
               GROUP BY p.professeur_id
          """
          cursor.execute(query, (search_value,))
          prof_data = cursor.fetchall()
          cursor.close()
          db.close()
     else:
          db = get_db_connection()
          cursor = db.cursor()
          query = """
               SELECT p.professeur_id, p.famille_nom, p.personnel_nom, p.phone, p.email,
                       GROUP_CONCAT(DISTINCT m.matières_nom) as subjects,
                       GROUP_CONCAT(DISTINCT CONCAT(c.classe_nom, ' (ID:', c.classe_id, ')')) as class_ids
               FROM professeurs p
               LEFT JOIN matières m ON m.professeur_id = p.professeur_id
               LEFT JOIN examens e ON e.matières_id = m.matières_id
               LEFT JOIN classe c ON c.classe_id = e.classe_id
               WHERE p.famille_nom LIKE %s OR p.personnel_nom LIKE %s
               GROUP BY p.professeur_id
          """
          cursor.execute(query, (f"%{search_value}%", f"%{search_value}%"))

          prof_data = cursor.fetchall()
          cursor.close()
          db.close()

     if prof_data:
          prof = prof_data[0]
                         
          st.success("Professeur trouvé.")
          st.header("Information de Base")
          st.markdown("---")

          details = {
               "Nom": prof[1],
               "Prénom": prof[2],
               "ID": prof[0],
               "Téléphone": prof[3] if prof[3] else "Non renseigné",
               "Email": prof[4] if prof[4] else "Non renseigné",
               "Matière(s)": prof[5] if prof[5] else "Aucune matière assignée",
               "Classe(s)": prof[6] if prof[6] else "Aucune classe assignée"
          }

          cols = st.columns(2)
          for i, (key, value) in enumerate(details.items()):
               with cols[i % 2]:
                    st.markdown(
                         f"""
                         <div style="border: 1px solid #ccc; border-radius: 10px; padding: 15px; margin: 15px;">
                              <strong>{key} :</strong> \n\n <h3>{value}</h3>
                         </div>
                         """,
                         unsafe_allow_html=True
                    )
          
          st.header("Information Detaillee")
          st.markdown("---")

          # Table 1: Professor's subjects overview
          st.subheader("Vue d'ensemble des matières:")
          with st.container(height=300):

               subject_stats = fetch_data("""
                    SELECT m.matières_nom, m.matières_code,
                         COUNT(DISTINCT e.étudiants_id) as student_count,
                         COUNT(DISTINCT ex.Examen_id) as exam_count,
                         ROUND(AVG(n.Note_obtenue), 2) as moyenne_generale
                    FROM professeurs p
                    JOIN matières m ON m.professeur_id = p.professeur_id
                    LEFT JOIN examens ex ON ex.matières_id = m.matières_id
                    LEFT JOIN notes n ON n.Examen_id = ex.Examen_id
                    LEFT JOIN etudiants e ON e.étudiants_id = n.étudiants_id
                    WHERE p.professeur_id = %s
                    GROUP BY m.matières_id
               """, (prof[0],))
               st.table(pd.DataFrame(subject_stats, columns=["Matière", "Code", "Étudiants", "Examens", "Moyenne Générale"]))

          # Table 2: Recent exam results
          st.subheader("Résultats des derniers examens:")
          with st.container(height=300):
               exam_stats = fetch_data("""
                    SELECT ex.Examen_nom,
                         DATE_FORMAT(ex.Examen_date, '%d/%m/%Y') as date_exam,
                         ROUND(AVG(n.Note_obtenue), 2) as moyenne,
                         COUNT(DISTINCT CASE WHEN n.Note_obtenue >= 10 THEN n.étudiants_id END) as reussis,
                         COUNT(DISTINCT n.étudiants_id) as total_participants
                    FROM professeurs p
                    JOIN matières m ON m.professeur_id = p.professeur_id
                    JOIN examens ex ON ex.matières_id = m.matières_id
                    LEFT JOIN notes n ON n.Examen_id = ex.Examen_id
                    WHERE p.professeur_id = %s
                    GROUP BY ex.Examen_id
                    ORDER BY ex.Examen_date DESC
                    LIMIT 10
               """, (prof[0],))

               st.table(pd.DataFrame(exam_stats, columns=["Examen", "Date", "Moyenne", "Réussis", "Total"]))
     else:
          st.error("Professeur non trouvé.")

if table == "Matières":
     if search_method == "ID":
          db = get_db_connection()
          cursor = db.cursor()
          query = """
               SELECT m.matières_id, m.matières_code, m.matières_nom,
                       p.professeur_id, p.personnel_nom, p.famille_nom,
                       COUNT(DISTINCT c.classe_id) as nb_classes,
                       COUNT(DISTINCT ex.Examen_id) as nb_examens,
                       COUNT(DISTINCT n.étudiants_id) as nb_etudiants,
                       ROUND(AVG(n.Note_obtenue), 2) as moyenne_generale
               FROM matières m
               LEFT JOIN professeurs p ON p.professeur_id = m.professeur_id
               LEFT JOIN examens ex ON ex.matières_id = m.matières_id
               LEFT JOIN notes n ON n.Examen_id = ex.Examen_id
               LEFT JOIN classe c ON c.classe_id = ex.classe_id
               WHERE m.matières_id = %s
               GROUP BY m.matières_id
          """
          cursor.execute(query, (search_value,))

          matiere_data = cursor.fetchall()
          cursor.close()
          db.close()
     else:
          db = get_db_connection()
          cursor = db.cursor()
          query = """
               SELECT m.matières_id, m.matières_code, m.matières_nom,
                       p.professeur_id, p.personnel_nom, p.famille_nom,
                       COUNT(DISTINCT c.classe_id) as nb_classes,
                       COUNT(DISTINCT ex.Examen_id) as nb_examens,
                       COUNT(DISTINCT n.étudiants_id) as nb_etudiants,
                       ROUND(AVG(n.Note_obtenue), 2) as moyenne_generale
               FROM matières m
               LEFT JOIN professeurs p ON p.professeur_id = m.professeur_id
               LEFT JOIN examens ex ON ex.matières_id = m.matières_id
               LEFT JOIN notes n ON n.Examen_id = ex.Examen_id
               LEFT JOIN classe c ON c.classe_id = ex.classe_id
               WHERE m.matières_nom LIKE %s OR m.matières_code LIKE %s
               GROUP BY m.matières_id
          """
          cursor.execute(query, (f"%{search_value}%", f"%{search_value}%"))

          matiere_data = cursor.fetchall()
          cursor.close()
          db.close()

     if matiere_data:
          matiere = matiere_data[0]
                    
          st.success("Matière trouvée.")
          st.header("Information de Base")
          st.markdown("---")

          details = {
               "Code Matière": matiere[1],
               "Nom Matière": matiere[2],
               "Professeur": f"{matiere[4]} {matiere[5]} (ID: {matiere[3]})" if matiere[3] else "Non assigné",
               "Nombre de Classes": matiere[6],
               "Nombre d'Examens": matiere[7],
               "Nombre d'Étudiants": matiere[8],
               "Moyenne Générale (Toutes Notes)": f"{matiere[9]}/20" if matiere[9] else "Pas de notes"
          }

          cols = st.columns(2)
          for i, (key, value) in enumerate(details.items()):
               with cols[i % 2]:
                    st.markdown(
                         f"""
                         <div style="border: 1px solid #ccc; border-radius: 10px; padding: 15px; margin: 15px;">
                              <strong>{key} :</strong> \n\n <h3>{value}</h3>
                         </div>
                         """,
                         unsafe_allow_html=True
                    )

          st.header("Information Detaillee")
          st.markdown("---")

          cols2 = st.columns(2)

          # Display examinations
          st.subheader("Examens pour cette matière:")
          with st.container(height=300):
               exam_details = fetch_data("""
                    SELECT ex.Examen_id, ex.Examen_nom, ex.Examen_date, 
                         c.classe_nom,
                         COUNT(n.étudiants_id) as participants,
                         ROUND(AVG(n.Note_obtenue), 2) as moyenne
                    FROM examens ex
                    LEFT JOIN classe c ON c.classe_id = ex.classe_id
                    LEFT JOIN notes n ON n.Examen_id = ex.Examen_id
                    WHERE ex.matières_id = %s
                    GROUP BY ex.Examen_id
                    ORDER BY ex.Examen_date DESC
               """, (matiere[0],))
               exam_df = pd.DataFrame(exam_details, columns=["ID", "Nom", "Date", "Classe", "Participants", "Moyenne"])
               st.table(exam_df)

          # Performance metrics by class
          st.subheader("Performance par classe:")
          with st.container(height=300):
               class_stats = fetch_data("""
                    SELECT c.classe_nom,
                         COUNT(DISTINCT ex.Examen_id) as nb_examens,
                         COUNT(DISTINCT CASE WHEN n.Note_obtenue >= 10 THEN n.étudiants_id END) as reussites,
                         COUNT(DISTINCT n.étudiants_id) as total_etudiants,
                         ROUND(AVG(n.Note_obtenue), 2) as moyenne
                    FROM classe c
                    JOIN examens ex ON ex.classe_id = c.classe_id
                    LEFT JOIN notes n ON n.Examen_id = ex.Examen_id
                    WHERE ex.matières_id = %s
                    GROUP BY c.classe_id
               """, (matiere[0],))
               class_df = pd.DataFrame(class_stats, columns=["Classe", "Examens", "Réussites", "Total Étudiants", "Moyenne"])
               st.table(class_df)
     else:
          st.error("Matière non trouvée.")

if table == "Examens":
     if search_method == "ID":
          db = get_db_connection() 
          cursor = db.cursor()
          query = """
               SELECT e.Examen_id, e.Examen_nom, e.Examen_date,
                      m.matières_id, m.matières_nom, m.matières_code,
                      c.classe_id, c.classe_nom,
                      p.professeur_id, p.personnel_nom, p.famille_nom,
                      COUNT(n.notes_id) as nb_notes,
                      ROUND(AVG(n.Note_obtenue), 2) as moyenne,
                      COUNT(CASE WHEN n.Note_obtenue >= 10 THEN 1 END) as reussites
               FROM examens e
               JOIN matières m ON m.matières_id = e.matières_id  
               JOIN classe c ON c.classe_id = e.classe_id
               JOIN professeurs p ON p.professeur_id = m.professeur_id
               LEFT JOIN notes n ON n.Examen_id = e.Examen_id
               WHERE e.Examen_id = %s
               GROUP BY e.Examen_id
          """
          cursor.execute(query, (search_value,))

          examen_data = cursor.fetchall()
          cursor.close()
          db.close()
     else:
          db = get_db_connection()
          cursor = db.cursor()
          query = """
               SELECT e.Examen_id, e.Examen_nom, e.Examen_date,
                      m.matières_id, m.matières_nom, m.matières_code,
                      c.classe_id, c.classe_nom,
                      p.professeur_id, p.personnel_nom, p.famille_nom,
                      COUNT(n.notes_id) as nb_notes,
                      ROUND(AVG(n.Note_obtenue), 2) as moyenne,
                      COUNT(CASE WHEN n.Note_obtenue >= 10 THEN 1 END) as reussites
               FROM examens e
               JOIN matières m ON m.matières_id = e.matières_id
               JOIN classe c ON c.classe_id = e.classe_id 
               JOIN professeurs p ON p.professeur_id = m.professeur_id
               LEFT JOIN notes n ON n.Examen_id = e.Examen_id
               WHERE e.Examen_nom LIKE %s
               GROUP BY e.Examen_id
          """
          cursor.execute(query, (f"%{search_value}%",))

          examen_data = cursor.fetchall()
          cursor.close()
          db.close()

     if examen_data:
          examen = examen_data[0]
          
          st.success("Examen trouvé.")
          st.header("Information de Base")
          st.markdown("---")

          details = {
               "Nom d'examen": examen[1],
               "Date": examen[2].strftime("%d/%m/%Y"),
               "Matière": f"{examen[4]} (Code: {examen[5]})",
               "Classe": f"{examen[7]} (ID: {examen[6]})",
               "Professeur": f"{examen[9]} {examen[10]} (ID: {examen[8]})",
               "Nombre de notes": examen[11],
               "Moyenne générale (Toutes Notes)": f"{examen[12]}/20" if examen[12] else "Pas de notes",
               "Nombre de réussites": f"{examen[13]} / {examen[11]}" if examen[11] > 0 else "Pas de notes"
          }

          cols = st.columns(2)
          for i, (key, value) in enumerate(details.items()):
               with cols[i % 2]:
                    st.markdown(
                         f"""
                         <div style="border: 1px solid #ccc; border-radius: 10px; padding: 15px; margin: 15px;">
                              <strong>{key} :</strong> \n\n <h3>{value}</h3>
                         </div>
                         """,
                         unsafe_allow_html=True
                    )

          st.header("Information Detaillee")
          st.markdown("---")

          cols2 = st.columns(2)

          # Basic stats
          st.subheader("Statistiques de notes:")
          with st.container(height=150):
               stats = fetch_data("""
                      SELECT 
                            COUNT(CASE WHEN Note_obtenue >= 16 THEN 1 END) as très_bien,
                            COUNT(CASE WHEN Note_obtenue >= 14 AND Note_obtenue < 16 THEN 1 END) as bien,
                            COUNT(CASE WHEN Note_obtenue >= 12 AND Note_obtenue < 14 THEN 1 END) as assez_bien,
                            COUNT(CASE WHEN Note_obtenue >= 10 AND Note_obtenue < 12 THEN 1 END) as passable,
                            COUNT(CASE WHEN Note_obtenue < 10 THEN 1 END) as échec
                      FROM notes
                      WHERE Examen_id = %s
               """, (examen[0],))
               stats_df = pd.DataFrame(stats, columns=["Très bien", "Bien", "Assez bien", "Passable", "Échec"])
               st.table(stats_df)

          # Detailed notes
          st.subheader("Notes détaillées:")
          with st.container(height=300):
                notes = fetch_data("""
                       SELECT n.notes_id, 
                             CONCAT(e.personnel_nom, ' ', e.famille_nom) as étudiant,
                             n.Note_obtenue,
                             n.Mention,
                             n.Commentaire
                       FROM notes n
                       JOIN etudiants e ON e.étudiants_id = n.étudiants_id
                       WHERE n.Examen_id = %s
                       ORDER BY n.Note_obtenue DESC
                """, (examen[0],))
                notes_df = pd.DataFrame(notes, columns=["ID Note", "Étudiant", "Note", "Mention", "Commentaire"])
                st.table(notes_df)
     else:
          st.error("Examen non trouvé.")