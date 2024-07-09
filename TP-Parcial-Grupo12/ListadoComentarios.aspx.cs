using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.EnterpriseServices;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TP_Parcial_Grupo12
{
    public partial class ListadoComentarios : System.Web.UI.Page
    {
        private SqlConnection conn;
        private DataClasses1DataContext mapeardor;

        protected void Page_Load(object sender, EventArgs e)
        {
            conn = new SqlConnection("Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=BaseCargaAlumnos;");
            conn.Open();
            mapeardor = new DataClasses1DataContext(conn);

            if (!IsPostBack)
            {
                cargarGrilla();
            }
        }

        private void cargarGrilla()
        {
            var datosComentarios = from i in mapeardor.Comentarios
                                   select i;

            grilla.DataSource = datosComentarios;
            grilla.DataBind();
        }

        protected void BotonMostrar_Click(object sender, EventArgs e)
        {
            cargarGrilla();
        }

        protected void rowCancelEditEvent(object sender, GridViewCancelEditEventArgs e)
        {
            grilla.EditIndex = -1;
            cargarGrilla();
        }


        //METODO PARA BORRAR EL RENGLON
        protected void rowDeletingEvent(object sender, GridViewDeleteEventArgs e)
        {
            /*, este código extrae el valor de la clave primaria de una fila específica en una grilla
            //y lo convierte a un tipo de dato entero, almacenándolo en la variable codigo.*/
            int codigo = Convert.ToInt32(grilla.DataKeys[e.RowIndex].Values[0]);//e.RowIndex refiere al indice de la fila en la que se desencadenó el evento.

            Comentarios comentarioEliminar = mapeardor.Comentarios.SingleOrDefault(c => c.idComentario == codigo);
            if (comentarioEliminar != null)
            {
                mapeardor.Comentarios.DeleteOnSubmit(comentarioEliminar);
                mapeardor.SubmitChanges();
            }

            cargarGrilla();
        }

        protected void rowEditingEvent(object sender, GridViewEditEventArgs e)
        {
            grilla.EditIndex = e.NewEditIndex;
            cargarGrilla();
        }

        protected void rowUpdatingEvent(object sender, GridViewUpdateEventArgs e)
        {
            //Buscamos el indice seleccionado
            GridViewRow fila = grilla.Rows[e.RowIndex];
            //hacemos que cada celda sea como un textBox para  poder modificarlo
            int codigo = Convert.ToInt32(grilla.DataKeys[e.RowIndex].Values[0]);
            string dni = (fila.FindControl("txtDNI2") as TextBox).Text;
            string apellido = (fila.FindControl("txtApellido2") as TextBox).Text;
            string coment = (fila.FindControl("txtComentario2") as TextBox).Text;

            //Busca el comentario del idComenterio y verifica que sea igual al valor de la grilla seleccionado
            Comentarios comentario = mapeardor.Comentarios.SingleOrDefault(c => c.idComentario == codigo);
            if (comentario != null)
            {
                comentario.DNI = Convert.ToInt32(dni);
                comentario.Apellido = apellido;
                comentario.ComentarioTexto = coment;
                mapeardor.SubmitChanges();
            }

            grilla.EditIndex = -1;
            cargarGrilla();
        }


    }
}
