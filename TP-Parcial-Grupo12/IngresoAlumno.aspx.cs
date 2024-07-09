using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Threading;
using System.Net;

namespace TP_Parcial_Grupo12
{
    public partial class IngresoAlumno : System.Web.UI.Page
    {

        //CREAMOS LAS VARIABLES PROVADAS
        private SqlConnection conn;
        //DATACLASS1DATACONEXT -> conexion a LINQ (ORM - mapeador de la base de datos)
        private DataClasses1DataContext mapeardor;
        protected void Page_Load(object sender, EventArgs e)
        {
            conn = new SqlConnection("Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=BaseCargaAlumnos;");
            conn.Open();
            mapeardor = new DataClasses1DataContext(conn);
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {

                TablaCargaAlumno carga = new TablaCargaAlumno();

                carga.Apellido = txtApellido.Text;
                carga.Nombre = txtNombre.Text;
                carga.Dni = Convert.ToInt32(txtDNI.Text);
                carga.Email = txtEmail.Text;
                carga.Turno = txtTurno.Text;

                mapeardor.TablaCargaAlumno.InsertOnSubmit(carga);
                mapeardor.SubmitChanges();

                Response.Redirect("MostrarDatos.aspx");

                //Response.Redirect("MostrarDatos.aspx?ape=" + carga.Apellido + "&nom=" + carga.Nombre + "&docu=" + (int)carga.Dni + "&mail=" + carga.Email + "&tur=" + carga.Turno);

                //mapeardor.BaseCargaAlumnos.InsertOnSubmit(carga);
            }
            catch (Exception ex)
            {

                throw new Exception("Error en el servidor. Contactese con el Administrador." + ex); 
            }
        }
    }
}