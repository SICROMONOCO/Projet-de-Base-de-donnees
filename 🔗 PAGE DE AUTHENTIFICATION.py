import streamlit as st
import mysql.connector
from mysql.connector import Error

# fenction de connexion à la base de données
def get_db_connection(host, user, password, database):
    try:
        connection = mysql.connector.connect(
            host=host,
            user=user,
            password=password,
            database=database
        )
        return connection
    except Error as e:
        st.error(f"Error: {e}")
        return None

st.set_page_config(
    page_title="PAGE DE AUTHENTIFICATION",
    page_icon=" 🔗 ",
    layout="wide",
    
)

st.markdown("<h1 style='text-align: center;'>🔗 PAGE DE AUTHENTIFICATION</h1>", unsafe_allow_html=True)

# collection de données d'authentification de la base de données
with st.form("db_auth_form"):
    host = st.text_input("Hôte", value="localhost")
    user = st.text_input("Utulisateur", value="root")
    password = st.text_input("Mots de Passe", type="password")
    database = st.text_input("Base de Donnee", value="educationldb2")
    submit_button = st.form_submit_button(label="Submettre")

# reservation des données d'authentification de la
if submit_button:
    st.session_state["db_auth"] = {
        "host": host,
        "user": user,
        "password": password,
        "database": database
    }
    st.success("Données d'authentification enregistrées avec succès!")

# test de la connexion à la base de données
if "db_auth" in st.session_state:
    db_auth = st.session_state["db_auth"]
    connection = get_db_connection(
        db_auth["host"],
        db_auth["user"],
        db_auth["password"],
        db_auth["database"]
    )
    if connection:
        st.info("Connexion à la base de données réussie.")
    else:
        st.error("Impossible de se connecter à la base de données.")
