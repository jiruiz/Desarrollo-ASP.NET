using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Threading;

namespace TP_Parcial_Grupo12
{
    public partial class WebForm2 : System.Web.UI.Page
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

            var datos = from a in mapeardor.TablaCargaAlumno
                        select new
                        {
                            a.Apellido,
                            a.Nombre,
                            a.Dni,
                            a.Email,
                            a.Turno
                        };
            foreach (var dato in datos)
            {
                txtApellido.Text = dato.Apellido;
                txtNombre.Text = dato.Nombre;
                txtDNI.Text = dato.Dni.ToString();
                txtEmail.Text = dato.Email;
                txtTurno.Text = dato.Turno;
            }
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                int dni = Convert.ToInt32(txtDNI.Text);

                // verificamos si existen dos comentarios con el mismo DNI creando un booleano 
                bool comentariosDuplicados = mapeardor.Comentarios
                    .Count(c => c.DNI == dni) > 1;

                if (comentariosDuplicados)
                {
                    txtTitulo.Text = "El DNI ingresado ya existe";
                    txtTitulo.BackColor = System.Drawing.Color.Red;
                    txtTitulo.Font.Size = new FontUnit(20);

                    botonComentario.Visible = false;
                }
                else
                {
                    TablaCargaAlumno alumno = new TablaCargaAlumno();
                    Comentarios coment = new Comentarios();

                    coment.DNI = dni;
                    coment.Apellido = txtApellido.Text;
                    coment.ComentarioTexto = txtComentario.Text;

                    mapeardor.Comentarios.InsertOnSubmit(coment);
                    mapeardor.SubmitChanges();

                    Response.Redirect("ListadoComentarios.aspx");
                }
            }
            catch (Exception ex)
            {
                throw new Exception("Error en el servidor Comentarios. Contactese con el Administrador." + ex);
            }
        }



    }
}