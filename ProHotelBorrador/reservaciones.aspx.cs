using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProHotelBorrador
{
    public partial class reservaciones : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {

            
            //proceso para muestra de notificacion: reservacion exitosa
            if (Session["ReservacionResultado"] != null)
            {

                if (Session["ReservacionResultado"].ToString().Equals("exito"))
                {

                   
                    labelNotificacionReservaciones.Text = "MENSAJE: Su reservacion ha sido registrada! Pronto recibirá un correo de confirmación<br /> <br />Su correo de confirmación podría llegar a su carpeta de SPAM -correo no deseado-";

                    ClientScript.RegisterStartupScript(this.GetType(), "Call my function", "metodoMostrarNotificacionExito()", true);


                    Session["ReservacionResultado"] = null;

                }
                
            }

        }

        //codigo del boton 'Espacio Disponible?': comprobacion de disponibilidad del hotel para agendar una reservacion
        protected void botonDisponibilidad_Click(object sender, EventArgs e)
        {

       
            Procesos objProcesos = new Procesos();
            Reservacion objReservacion = new Reservacion();
            DateTime fechaCostaRica = TimeZoneInfo.ConvertTime(DateTime.Now, TimeZoneInfo.FindSystemTimeZoneById("Central America Standard Time"));


            try
            {

                //verificacion de valores ingresados para las fechas de la reservacion
                if (objProcesos.metodoCampoVacio(seleccionFechaIngreso.Text) || objProcesos.metodoCampoVacio(seleccionFechaSalida.Text))
                {

                    throw new ExceptionReservaciones("Por favor seleccione los valores para fechas de ingreso y salida");

                }

                //verificacion de rango de fechas: no fechas pasadas ni fechasalida antes de fechainicial
                if (objProcesos.metodoRangoFechasIncorrecto(seleccionFechaIngreso.Text, seleccionFechaSalida.Text))
                {

                    throw new ExceptionReservaciones("Rango de fechas incorrecto. Por favor seleccione un rango de fechas a partir de:<br /> <br />" + fechaCostaRica.ToString("dddd, dd MMMM yyyy"));


                }

                //verificacion maximo de dias para reservar
                if (objProcesos.metodoCantidadDiasNoAceptableReservacion(seleccionFechaIngreso.Text, seleccionFechaSalida.Text))
                {

                    throw new ExceptionReservaciones("Para reservaciones mayores a 7 dias, por favor llame a nuestro numero de telefono.");


                }

                //verificacion de fechas disponibles en la base de datos
                if (!objReservacion.metodoEspacioDisponible(seleccionFechaIngreso.Text, seleccionFechaSalida.Text))
                {

       
                    throw new ExceptionReservaciones("NO tenemos disponibilidad para ese rango de fechas. Por favor elija otro rango de fechas.");

                }

                //verificacion de grupos de personas de acuerdo a capacidad (10 personas max)
                if (seleccionNumeroPersonas.SelectedValue.Equals("+10"))
                {

                    throw new ExceptionReservaciones("Lo sentimos. Nuestra operacion esta diseñada para grupos de maximo 10 personas.");

                }


                seleccionFechaIngreso.Enabled = false;
                seleccionFechaSalida.Enabled = false;
                seleccionNumeroPersonas.Enabled = false;

                botonDisponibilidad.Visible = false;
                enlaceNuevaDisponibilidad.Visible = true;


                Session["DisponibilidadCompletada"] = "true";

                //notificacion de disponibilidad para la reservacion
                labelNotificacionReservaciones.Text = "MENSAJE: Tenemos disponilidad para esas fechas! Por favor complete el resto de datos del formulario.";

                ClientScript.RegisterStartupScript(this.GetType(), "Call my function", "metodoMostrarNotificacionExito()", true);


            }
            catch (ExceptionReservaciones r)
            {

                //notificacion de problema para comprobar la disponibilidad
                labelNotificacionReservaciones.Text = r.Message;

                ClientScript.RegisterStartupScript(this.GetType(), "Call my function", "metodoMostrarNotificacionFallo()", true);



            }
            catch (Exception x)
            {

                //notificacion de excepciones generales
                labelNotificacionReservaciones.Text = x.Message;

                ClientScript.RegisterStartupScript(this.GetType(), "Call my function", "metodoMostrarNotificacionFallo()", true);


            }


        }

        //codigo del boton 'Reservar': procesamiento de los datos de la reservacion
        protected void botonEnviarReservacion_Click(object sender, EventArgs e)
        {

            Procesos objProcesos = new Procesos();

            try
            {
                
                //verificacion de disponibilidad ya completa
                if (Session["DisponibilidadCompletada"] == null)
                {

                    throw new Exception("Por favor ingrese los datos relacionados con la disponibilidad de fechas (boton espacio disponible?)");

                }

                
                //verificaciones de valor ingresado y formato correcto para las variables de nombre, email (este procesos solo requiere esas 2 verificaciones)
                if (objProcesos.metodoCampoVacio(campoNombre.Text) || objProcesos.metodoCampoVacio(campoEmail.Text))
                {

                    throw new ExceptionReservaciones("Por favor asegurese de ingresar su nombre y su direccion de correo email");

                }

                //--------------------sandbox

                //transformacion de email (campos vacios eliminados y formato lower case)
                string emailFormatoCorrecto = objProcesos.metodoTrimLowerParaTextos(campoEmail.Text);


                //--------------------sandbox

                if (!objProcesos.metodoEmailFormatoValido(emailFormatoCorrecto))
                {

                    throw new ExceptionReservaciones("Por favor asegurese de ingresar el formato correcto de la direccion de correo email");

                }


                //ALMACENAMIENTO DE RESERVACION EN LA BASE DE DATOS Y ENVIO DE EMAIL DE CONFIRMACION


                Reservacion objReservacion = new Reservacion(seleccionFechaIngreso.Text, seleccionFechaSalida.Text, seleccionNumeroPersonas.SelectedValue,
                campoNombre.Text, emailFormatoCorrecto, checkboxServicioTodoIncluido.Checked.ToString(), checkboxServicioMasaje.Checked.ToString(),
                checkboxServicioExcursion.Checked.ToString(), campoServicioComentario.Text);


                //Almacenamiento de datos de la reservacion en la tabla 'reservacion'. Devuelve el numero ID de la reservacion creada
                int idUltimaReservacionRegistradaNumero = 0;

                if (!int.TryParse(objReservacion.metodoRegistrarDatosReservacion(), out idUltimaReservacionRegistradaNumero))
                {

                    throw new Exception("Error en el almacenamiento en la base de datos (Reservacion). La reservacion no fue registrada");

                }

                //Almacenamiento de los servicios en la tabla: 'servicio'. Devuelve valor boolean segun el exito del procedimiento
                if (!objReservacion.metodoRegistrarServicios(idUltimaReservacionRegistradaNumero))
                {

                    throw new Exception("Error en el almacenamiento en la base de datos (Servicio). La reservacion no fue registrada");

                }



                //------PABLO----LLAMADO AL METODO QUE ENVIA CONFIRMACION POR EMAIL. DESCOMENTAR SOLO PARA PRODUCCION!!
                if (!objReservacion.metodoEnviarConfirmacionReservacion(idUltimaReservacionRegistradaNumero).Equals("exito"))
                {

                    throw new Exception("Error en el envio del correo de confirmacion\\nLa reservacion no fue registrada");

                }


                //reload de la pagina para mostrar mensaje de confirmacion de proceso exitoso
                Session["DisponibilidadCompletada"] = null;
                Session["ReservacionResultado"] = "exito";
                Response.Redirect(Request.RawUrl);


            }
            catch (ExceptionReservaciones r)
            {

                //notificacion de problema para completar la reservacion
                labelNotificacionReservaciones.Text = r.Message;

                ClientScript.RegisterStartupScript(this.GetType(), "Call my function", "metodoMostrarNotificacionFallo()", true);



            }
            catch (Exception x)
            {

                //notificacion de excepciones generales
                labelNotificacionReservaciones.Text = x.Message;

                ClientScript.RegisterStartupScript(this.GetType(), "Call my function", "metodoMostrarNotificacionFallo()", true);


            }

        }

      
        protected void enlaceNuevaDisponibilidad_Click(object sender, EventArgs e)
        {

            Response.Redirect(Request.RawUrl);

        }

        //excepcion para el manejo de errores de los procesos en webform reservaciones
        public class ExceptionReservaciones : Exception
        {
            public ExceptionReservaciones(string message) : base(message)
            {


            }
        }


    }
}