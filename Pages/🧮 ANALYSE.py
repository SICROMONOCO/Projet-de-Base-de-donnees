import mysql.connector
import streamlit as st
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns



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

# Function to fetch data from the database
def fetch_data(query, params=None):
    db = get_db_connection()
    cursor = db.cursor()
    cursor.execute(query, params)
    data = cursor.fetchall()
    cursor.close()
    db.close()
    return data

# Function to display data in a table
def display_table(data, columns):
    df = pd.DataFrame(data, columns=columns)
    st.dataframe(df, use_container_width=True)

# Dashboard layout
st.markdown("<h1 style='text-align: center;'>🧮 ANALYSE</h1>", unsafe_allow_html=True)
st.sidebar.title("NAVIGATION")
options = ["LES TABLEAUX COMPLETES","ANALYTIQUE"]
choice = st.sidebar.radio("Aller a : ", options)



# Fetch summary statistics
total_classes = fetch_data("SELECT COUNT(*) FROM classe")[0][0]
total_students = fetch_data("SELECT COUNT(*) FROM etudiants")[0][0]
total_subjects = fetch_data("SELECT COUNT(*) FROM matières")[0][0]
total_professors = fetch_data("SELECT COUNT(*) FROM professeurs")[0][0]
total_exams = fetch_data("SELECT COUNT(*) FROM examens")[0][0]
total_notes = fetch_data("SELECT COUNT(*) FROM notes")[0][0]

# Display summary statistics with styling
stats = {
         "Total Classes": total_classes,
         "Total Students": total_students,
         "Total Subjects": total_subjects,
         "Total Professors": total_professors,
         "Total Exams": total_exams,
         "Total Notes": total_notes
}

cols = st.columns(3)
for i, (key, value) in enumerate(stats.items()):
         with cols[i % 3]:
                    st.markdown(
                             f"""
                             <div style="border: 1px solid #ccc; border-radius: 10px; padding: 15px; margin: 15px;">
                                       <strong>{key} :</strong> \n\n <h2>{value}</h2>
                             </div>
                             """,
                             unsafe_allow_html=True
                    )

st.markdown("---")
st.markdown(f"<h1 style='text-align: center; padding: 15px; margin: 15px;'>{choice}</h1>", unsafe_allow_html=True)

if choice == "LES TABLEAUX COMPLETES":
     # Récupération des données
     def get_data(num):
          table_names = ["classe", "etudiants", "professeurs", "matières", "examens", "notes"]
          if num in range(1, 7):
               db = get_db_connection()
               cursor = db.cursor()

               query = f"SELECT * FROM {table_names[num-1]};"
               cursor.execute(query)
               data = cursor.fetchall()

               cursor.close()
               db.close()

               return data
          else:
               return []

     # Multiselect for column selection
     def multiselect(table_name, columns):
          st.header(table_name)
          st.markdown("---")
          selected_columns = st.multiselect(f"Sélectionnez les colonnes pour {table_name}", columns, default=columns)
          return selected_columns
     # Classes
     classes_data = get_data(1)
     classes_columns = ["ID Classe", "Nom_Classe"]
     selected_classes_columns = multiselect("Classes", classes_columns)
     classes_df = pd.DataFrame([{"ID Classe": row[0], "Nom_Classe": row[1]} for row in classes_data], columns=selected_classes_columns)
     st.dataframe(classes_df, use_container_width=True)
     st.markdown("\n")

     # Étudiants
     etudiants_data = get_data(2)
     etudiants_columns = ["ID Étudiant", "ID Classe", "Nom", "Prénom", "Date de Naissance", "Sexe", "Email", "N° de Téléphone", "Adresse"]
     selected_etudiants_columns = multiselect("Étudiants", etudiants_columns)
     etudiants_df = pd.DataFrame([{"ID Étudiant": row[0], "ID Classe": row[1], "Nom": row[2], "Prénom": row[3], "Date de Naissance": row[4], "Sexe": row[5], "Email": row[6], "N° de Téléphone": row[7], "Adresse": row[8]} for row in etudiants_data], columns=selected_etudiants_columns)
     st.dataframe(etudiants_df, use_container_width=True)
     st.markdown("\n")

     # Professeurs
     profs_data = get_data(3)
     profs_columns = ["ID Prof", "Nom", "Prénom", "Email", "N° de Téléphone"]
     selected_profs_columns = multiselect("Professeurs", profs_columns)
     profs_df = pd.DataFrame([{"ID Prof": row[0], "Nom": row[1], "Prénom": row[2], "Email": row[3], "N° de Téléphone": row[4]} for row in profs_data], columns=selected_profs_columns)
     st.dataframe(profs_df, use_container_width=True)
     st.markdown("\n")

     # Matières
     matieres_data = get_data(4)
     matieres_columns = ["ID Matière", "ID Prof", "Nom Matière", "Code Matière"]
     selected_matieres_columns = multiselect("Matières", matieres_columns)
     matieres_df = pd.DataFrame([{"ID Matière": row[0], "ID Prof": row[1], "Nom Matière": row[2], "Code Matière": row[3]} for row in matieres_data], columns=selected_matieres_columns)
     st.dataframe(matieres_df, use_container_width=True)
     st.markdown("\n")

     # Examens
     examens_data = get_data(5)
     examens_columns = ["ID Examen", "ID Classe", "ID Matière", "Date Examen", "Nom Matière"]
     selected_examens_columns = multiselect("Examens", examens_columns)
     examens_df = pd.DataFrame([{"ID Examen": row[0], "ID Classe": row[1], "ID Matière": row[2], "Date Examen": row[3], "Nom Matière": row[4]} for row in examens_data], columns=selected_examens_columns)
     st.dataframe(examens_df, use_container_width=True)
     st.markdown("\n")

     # Notes
     notes_data = get_data(6)
     notes_columns = ["ID Note", "ID Étudiant", "ID Examen", "Note Obtenue", "Mention", "Commentaire"]
     selected_notes_columns = multiselect("Notes", notes_columns)
     notes_df = pd.DataFrame([{"ID Note": row[0], "ID Étudiant": row[1], "ID Examen": row[2], "Note Obtenue": row[3], "Mention": row[4], "Commentaire": row[5]} for row in notes_data], columns=selected_notes_columns)
     st.dataframe(notes_df, use_container_width=True)
     st.markdown("\n")

if choice == "ANALYTIQUE":    
     # Create a grid layout for the plots
     col1, col2 = st.columns(2)
     # 1. Distribution of Students by Class
     with col1:
          st.markdown("### Distribution des Étudiants par Classe")
          students_by_class = fetch_data("SELECT c.classe_nom, COUNT(e.étudiants_id) FROM classe c JOIN etudiants e ON c.classe_id = e.classe_id GROUP BY c.classe_nom")
          df_students_by_class = pd.DataFrame(students_by_class, columns=["Classe", "Nombre d'Étudiants"])
          fig1, ax1 = plt.subplots()
          sns.barplot(x="Classe", y="Nombre d'Étudiants", data=df_students_by_class, ax=ax1)
          st.pyplot(fig1)

     with col2:
          st.markdown("### Répartition des Étudiants par Sexe")
          gender_distribution = fetch_data("SELECT sexe, COUNT(*) FROM etudiants GROUP BY sexe")
          df_gender_distribution = pd.DataFrame(gender_distribution, columns=["Sexe", "Nombre"])
          fig2, ax2 = plt.subplots()
          sns.barplot(x="Sexe", y="Nombre", data=df_gender_distribution, ax=ax2)
          st.pyplot(fig2)

     with col1:
          st.markdown("### Moyenne des Notes par Classe")
          avg_grades_by_class = fetch_data("SELECT c.classe_nom, AVG(n.Note_obtenue) FROM classe c JOIN etudiants e ON c.classe_id = e.classe_id JOIN notes n ON e.étudiants_id = n.étudiants_id GROUP BY c.classe_nom")
          df_avg_grades_by_class = pd.DataFrame(avg_grades_by_class, columns=["Classe", "Moyenne des Notes"])
          fig3, ax3 = plt.subplots()
          sns.barplot(x="Classe", y="Moyenne des Notes", data=df_avg_grades_by_class, ax=ax3)
          st.pyplot(fig3)

     with col2:
          st.markdown("### Répartition des Notes par Mention")
          grades_by_mention = fetch_data("SELECT Mention, COUNT(*) FROM notes GROUP BY Mention")
          df_grades_by_mention = pd.DataFrame(grades_by_mention, columns=["Mention", "Nombre"])
          fig4, ax4 = plt.subplots()
          sns.barplot(x="Mention", y="Nombre", data=df_grades_by_mention, ax=ax4)
          st.pyplot(fig4)

     with col1:
          st.markdown("### Nombre d'Examens par Classe")
          exams_by_class = fetch_data("SELECT c.classe_nom, COUNT(e.Examen_id) FROM classe c JOIN examens e ON c.classe_id = e.classe_id GROUP BY c.classe_nom")
          df_exams_by_class = pd.DataFrame(exams_by_class, columns=["Classe", "Nombre d'Examens"])
          fig5, ax5 = plt.subplots()
          sns.barplot(x="Classe", y="Nombre d'Examens", data=df_exams_by_class, ax=ax5)
          st.pyplot(fig5)

     with col2:
          st.markdown("### Répartition des Étudiants par Âge")
          age_distribution = fetch_data("SELECT YEAR(CURDATE()) - YEAR(date_de_naissance) AS Age, COUNT(*) FROM etudiants GROUP BY Age")
          df_age_distribution = pd.DataFrame(age_distribution, columns=["Âge", "Nombre d'Étudiants"])
          fig7, ax7 = plt.subplots()
          sns.barplot(x="Âge", y="Nombre d'Étudiants", data=df_age_distribution, ax=ax7)
          ax7.set_xticklabels(ax7.get_xticklabels(), rotation=0)
          st.pyplot(fig7)

     with col1:
          st.markdown("### Distribution des Notes")
          grades_distribution = fetch_data("SELECT Note_obtenue, COUNT(*) FROM notes GROUP BY Note_obtenue")
          df_grades_distribution = pd.DataFrame(grades_distribution, columns=["Note Obtenue", "Nombre"])
          fig8, ax8 = plt.subplots()
          sns.lineplot(x="Note Obtenue", y="Nombre", data=df_grades_distribution, ax=ax8, marker='o')
          ax8.set_xticklabels(ax8.get_xticklabels(), rotation=90)
          st.pyplot(fig8)

     with col2:
          st.markdown("### Taux de Réussite/Échec par Classe")
          pass_fail_rate_by_class = fetch_data("SELECT c.classe_nom, COUNT(CASE WHEN n.Note_obtenue >= 10 THEN 1 END) AS Pass, COUNT(CASE WHEN n.Note_obtenue < 10 THEN 1 END) AS Fail FROM classe c JOIN etudiants e ON c.classe_id = e.classe_id JOIN notes n ON e.étudiants_id = n.étudiants_id GROUP BY c.classe_nom")
          df_pass_fail_rate_by_class = pd.DataFrame(pass_fail_rate_by_class, columns=["Classe", "Réussite", "Échec"])
          fig9, ax9 = plt.subplots()
          df_pass_fail_rate_by_class.set_index("Classe").plot(kind="bar", stacked=True, ax=ax9)
          st.pyplot(fig9)

     with col1:
          st.markdown("### Taux de Réussite/Échec par Matière")
          pass_fail_rate_by_subject = fetch_data("SELECT m.matières_nom, COUNT(CASE WHEN n.Note_obtenue >= 10 THEN 1 END) AS Pass, COUNT(CASE WHEN n.Note_obtenue < 10 THEN 1 END) AS Fail FROM matières m JOIN examens e ON m.matières_id = e.matières_id JOIN notes n ON e.Examen_id = n.Examen_id GROUP BY m.matières_nom")
          df_pass_fail_rate_by_subject = pd.DataFrame(pass_fail_rate_by_subject, columns=["Matière", "Réussite", "Échec"])
          fig10, ax10 = plt.subplots()
          df_pass_fail_rate_by_subject.set_index("Matière").plot(kind="bar", stacked=True, ax=ax10)
          st.pyplot(fig10)
