using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;


namespace ProHotelBorrador
{

    public partial class admin : System.Web.UI.Page
    {


        protected void Page_Load(object sender, EventArgs e)
        {

            
            //verificacion de reservaciones expiradas en la base de datos. Si hay reservaciones expiradas, se eliminan y se despliega un mensaje al usuario
            if (!Page.IsPostBack)
            {

                Reservacion objReservacion = new Reservacion();

                string respuestametodoReservacionesExpiradas = objReservacion.metodoEliminacionReservacionesExpiradas();

                int numeroCitasExpiradasEliminadas = 0;

                string mensajeReservacionesExpiradas = ""; 

                if (int.TryParse(respuestametodoReservacionesExpiradas, out numeroCitasExpiradasEliminadas))
                {

                    if (numeroCitasExpiradasEliminadas > 0)
                    {


                        mensajeReservacionesExpiradas = numeroCitasExpiradasEliminadas + " reservaciones expiradas han sido eliminadas del sistema";

                        labelNotificacionReservaciones.Text = "MENSAJE: " + mensajeReservacionesExpiradas;

                        ClientScript.RegisterStartupScript(this.GetType(), "Call my function", "metodoMostrarNotificacionExito()", true);


                    }


                }
                else
                {
                    
                    mensajeReservacionesExpiradas = respuestametodoReservacionesExpiradas;             

                    labelNotificacionReservaciones.Text = mensajeReservacionesExpiradas;

                    ClientScript.RegisterStartupScript(this.GetType(), "Call my function", "metodoMostrarNotificacionFallo()", true);

                }

                

            }


            //manejo de accesos no autorizados a la pagina
            if (Session["usuarioLogueado"] == null)
            {


                Response.Redirect("index.aspx");


            }

            if (!Session["usuarioLogueado"].ToString().Equals(WebConfigurationManager.AppSettings["palabraClaveAdmin"].ToString()))
            {


                Response.Redirect("index.aspx");

            }


            //codigo para el procesamiento correcto de la session activa de login
            HttpContext.Current.Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.Cache.SetExpires(DateTime.UtcNow.AddHours(-1));
            HttpContext.Current.Response.Cache.SetNoStore();


        }

        //codigo de los botones 'ver' en la tabla de reservaciones
        protected void GridViewReservaciones_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            //dentro de este proceso se obtiene el numero ID de la reservacion para la fila asi como tambien se resalta dicha fila
            try
            {
                
                if (e.CommandName == "comandoBotonServicio")
                {

                    int idReservacionFilaBotonPresionado = 0;


                    int numeroIndexActual = Convert.ToInt32(e.CommandArgument.ToString());

                  
                    GridViewReservaciones.SelectedIndex = numeroIndexActual;


                    GridViewRow rowBotonPresionado = GridViewReservaciones.Rows[numeroIndexActual];

                    Label idReservacionL = (Label)rowBotonPresionado.FindControl("labelReservacionId");


                    if (!int.TryParse(idReservacionL.Text.ToString(), out idReservacionFilaBotonPresionado))
                    {

                        throw new Exception("Error. Problema en la obtencion de numero de identificador de reservacion.");

                    }

                    Session["idReservacionSession"] = idReservacionFilaBotonPresionado.ToString();


                }


            }
            catch (Exception x)
            {

                //notificacion de excepciones generales
                labelNotificacionReservaciones.Text = x.Message;

                ClientScript.RegisterStartupScript(this.GetType(), "Call my function", "metodoMostrarNotificacionFallo()", true);

            }


        }

   

        protected void botonIdServicio_Command(object sender, CommandEventArgs e)
        {



        }

        protected void GridViewReservaciones_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        //codigo del enlace boton 'salir': para abandonar la pantalla Admin
        protected void linkBotonSalirAdmin_Click(object sender, EventArgs e)
        {

                 
            Session.Abandon();   
            Response.Redirect("login.aspx");
     

        }



        //excepcion para el manejo de errores en los procesos del modulo admin
        public class ExceptionAdmin : Exception
        {
            public ExceptionAdmin(string message) : base(message)
            {


            }
        }

    }
}