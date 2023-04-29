using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;

namespace ProHotelBorrador
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {


        }

        //codigo del boton 'Ingresar': Ingreso autorizado a la pantalla Admin
        protected void botonLogin_Click(object sender, EventArgs e)
        {

            //verificacion de usuario y password autorizados
            try
            {

                if ( !(campoUsuarioLogin.Text == WebConfigurationManager.AppSettings["usernameWebConfig"].ToString()) ||
                    !(campoPasswordLogin.Text == WebConfigurationManager.AppSettings["passwordWebConfig"].ToString()))
                {

                    throw new Exception("Usuario o password incorrecto");


                }

                //redireccionamiento a la pantalla Admin
                Session["usuarioLogueado"] = WebConfigurationManager.AppSettings["palabraClaveAdmin"].ToString();
                Response.Redirect("admin.aspx");



            }
            catch (Exception x)
            {

                //notificacion de excepciones generales
                labelNotificacionReservaciones.Text = x.Message;

                ClientScript.RegisterStartupScript(this.GetType(), "Call my function", "metodoMostrarNotificacionFallo()", true);


            }


        }
    }
}