using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Net;
using System.Net.Mail;

namespace ProHotelBorrador
{
    //CLASE PARA LA CREACION DE OBJETOS DE RESERVACIONES Y PROCESAMIENTO DE ESTOS OBJETOS (METODOS PARA ALMACENAMIENTO EN LA BASE DE DATOS, ENVIO DE EMAIL, ETC)
    public class Reservacion
    {

        SqlConnection objCon = new SqlConnection(WebConfigurationManager.ConnectionStrings["BDHotelConnectionString"].ConnectionString);


      
        private string fechaIngreso;
        private string fechaSalida;
        private string cantidadPersonas;
        private string nombreReservacion;
        private string emailReservacion;
        private string todoIncluidoServicio;
        private string masajeServicio;
        private string excursionServicio;
        private string comentarioServicio;




        public Reservacion(string fechaIngreso, string fechaSalida, string cantidadPersonas, string nombreReservacion, string emailReservacion,
        string todoIncluidoServicio, string masajeServicio, string excursionServicio, string comentarioServicio)
        {

            this.FechaIngreso = fechaIngreso;
            this.FechaSalida = fechaSalida;
            this.CantidadPersonas = cantidadPersonas;
            this.NombreReservacion = nombreReservacion;
            this.EmailReservacion = emailReservacion;
            this.TodoIncluidoServicio = todoIncluidoServicio;
            this.MasajeServicio = masajeServicio;
            this.ExcursionServicio = excursionServicio;
            this.ComentarioServicio = comentarioServicio;

        }

        public Reservacion()
        {
        }


        public string FechaIngreso { get => fechaIngreso; set => fechaIngreso = value; }
        public string FechaSalida { get => fechaSalida; set => fechaSalida = value; }
        public string CantidadPersonas { get => cantidadPersonas; set => cantidadPersonas = value; }
        public string NombreReservacion { get => nombreReservacion; set => nombreReservacion = value; }
        public string EmailReservacion { get => emailReservacion; set => emailReservacion = value; }
        public string TodoIncluidoServicio { get => todoIncluidoServicio; set => todoIncluidoServicio = value; }
        public string MasajeServicio { get => masajeServicio; set => masajeServicio = value; }
        public string ExcursionServicio { get => excursionServicio; set => excursionServicio = value; }
        public string ComentarioServicio { get => comentarioServicio; set => comentarioServicio = value; }


        //metodo para el registro de datos en la tabla reservacion
        public string metodoRegistrarDatosReservacion()
        {

            int numeroIdReservacionInsertada = 0;


            try
            {

                SqlCommand objSqlCom = objCon.CreateCommand();
                objSqlCom.CommandType = CommandType.Text;
                objCon.Open();

                objSqlCom.CommandText = "insert into reservacion output inserted.id_reservacion values(@FechaIngreso," +
                                "@FechaSalida,@CantidadPersonas,@NombreReservacion,@EmailReservacion)";

                objSqlCom.Parameters.AddWithValue("@FechaIngreso", FechaIngreso);
                objSqlCom.Parameters.AddWithValue("@FechaSalida", FechaSalida);
                objSqlCom.Parameters.AddWithValue("@CantidadPersonas", CantidadPersonas);
                objSqlCom.Parameters.AddWithValue("@NombreReservacion", NombreReservacion);
                objSqlCom.Parameters.AddWithValue("@EmailReservacion", EmailReservacion);

                numeroIdReservacionInsertada = (int)objSqlCom.ExecuteScalar();

                objCon.Close();

                return numeroIdReservacionInsertada.ToString();


            }
            catch (Exception x)
            {

                return x.Message;
                
            }


        }

        //metodo para registrar datos en la tabla servicio
        public bool metodoRegistrarServicios(int idUltimaReservacionAlmacenadaNumero)
        {

            
            string idUltimaReservacionAlmacenadaString = idUltimaReservacionAlmacenadaNumero.ToString();

            try
            {

                SqlCommand objSqlCom = objCon.CreateCommand();
                objSqlCom.CommandType = CommandType.Text;

                
                objCon.Open();


                objSqlCom.CommandText = "insert into servicio values(@TodoIncluidoServicio," +
                                "@MasajeServicio,@ExcursionServicio,@ComentarioServicio,@idUltimaReservacionAlmacenadaNumero)";


                objSqlCom.Parameters.AddWithValue("@TodoIncluidoServicio", TodoIncluidoServicio);
                objSqlCom.Parameters.AddWithValue("@MasajeServicio", MasajeServicio);
                objSqlCom.Parameters.AddWithValue("@ExcursionServicio", ExcursionServicio);
                objSqlCom.Parameters.AddWithValue("@ComentarioServicio", ComentarioServicio);
                objSqlCom.Parameters.AddWithValue("@idUltimaReservacionAlmacenadaNumero", idUltimaReservacionAlmacenadaNumero);


                objSqlCom.ExecuteNonQuery();

                objCon.Close();

                return true;

            }
            catch (Exception)
            {

                metodoEliminarReservacion(idUltimaReservacionAlmacenadaNumero);
                return false;


            }


        }

        //metodo para eliminar datos de una reservacion y servicio correspondiente
        private bool metodoEliminarReservacion(int idNumeroReservacion)
        {

            string idReservacionString = idNumeroReservacion.ToString();

            try
            {

                SqlCommand objSqlCom = objCon.CreateCommand();
                objSqlCom.CommandType = CommandType.Text;
                objCon.Open();

                objSqlCom.CommandText = "delete from reservacion where id_reservacion = '" + idReservacionString  +"'";
                
                objSqlCom.ExecuteNonQuery();

                objCon.Close();

                return true;

            }
            catch (Exception)
            {

                return false;

            }


        }

        //metodo para el envio de confirmacion de reservacion (email) a usuario
        public string metodoEnviarConfirmacionReservacion(int idUltimaReservacionAlmacenadaNumero)
        {

            string respuesta = "";


            //datos de puerto SMTP, direccion email, password
            string emailEmisorNotificaciones = WebConfigurationManager.AppSettings["emailEmisorNotificaciones"].ToString();

            string clienteSmtpEmail = WebConfigurationManager.AppSettings["clienteSmtpEmail"].ToString();

            int clienteSmtpPuerto = Convert.ToInt32(WebConfigurationManager.AppSettings["clienteSmtpPuerto"].ToString());

            string credencialSmtpEmail = WebConfigurationManager.AppSettings["credencialSmtpEmail"].ToString();

            string credencialSmtpClave = WebConfigurationManager.AppSettings["credencialSmtpClave"].ToString();

            string emailCC = WebConfigurationManager.AppSettings["emailCC"].ToString();


            //email receptor confirmacion
            MailAddress direccionPara = new MailAddress(EmailReservacion);

            //email emisor confirmacion
            MailAddress direccionDesde = new MailAddress(emailEmisorNotificaciones);

            MailMessage mensajeCorreo = new MailMessage(direccionDesde, direccionPara);

            mensajeCorreo.Subject = "-- Reservacion Confirmada Fabian B&B --";

            //String y proceso para mostrar datos de servicio para la confirmacion de reservacion
            string serviciosReservados = "";

          
            if (Boolean.Parse(TodoIncluidoServicio))
            {

                serviciosReservados += "\n- Todo Incluido";

            }
            if (Boolean.Parse(MasajeServicio))
            {
                serviciosReservados += "\n- Masaje";

            }
            if (Boolean.Parse(ExcursionServicio))
            {

                serviciosReservados += "\n- Excursion";

            }
            if (serviciosReservados.Equals(""))
            {

                serviciosReservados = "\nN/A";

            }
         
            //cuerpo del mensaje para email
            mensajeCorreo.Body = "DETALLE DE LA RESERVACION\n\n------------------" +
                "\n\nFecha ingreso: " + DateTime.Parse(FechaIngreso).ToString("dddd, dd MMMM yyyy") +
                "\n\nFecha salida: " + DateTime.Parse(FechaSalida).ToString("dddd, dd MMMM yyyy") +
                "\n\nNombre: " + NombreReservacion +
                "\n\nCantidad personas: " + CantidadPersonas +
                "\n\nServicio requerido:\n " + serviciosReservados +
                "\n\nComentario: " + ComentarioServicio +
                "\n\n------------------\n\n" +
                "\n\nCORREO GENERADO DE FORMA AUTOMATICA POR EL SISTEMA DEL HOTEL" +
                "\n\nPOR FAVOR NO RESPONDER A ESTE CORREO";


            mensajeCorreo.CC.Add(emailCC);



            SmtpClient clienteSmtp = new SmtpClient(clienteSmtpEmail, clienteSmtpPuerto)
            {
                Credentials = new NetworkCredential(credencialSmtpEmail, credencialSmtpClave),
                EnableSsl = true

            };

            try
            {

                clienteSmtp.Send(mensajeCorreo);


                respuesta = "exito";


            }
            catch (SmtpException ex)
            {

                metodoEliminarReservacion(idUltimaReservacionAlmacenadaNumero);
                respuesta = ex.ToString();

            }

            return respuesta;

        }

        //metodo verificacion de espacio disponible para reservacion 
        public bool metodoEspacioDisponible(string fechaIngresoInteresString, string fechaSalidaInteresString)
        {
            bool respuesta = true;

            DateTime fechaIngresoInteres = DateTime.Parse(fechaIngresoInteresString);
            DateTime fechaSalidaInteres = DateTime.Parse(fechaSalidaInteresString);



            SqlCommand cmd = new SqlCommand("select fecha_ingreso_reservacion, fecha_salida_reservacion from reservacion", objCon);

            objCon.Open();
            SqlDataReader reader = cmd.ExecuteReader();

            while (reader.Read())
            {
                

                if (
                    
                    ((DateTime.Parse(reader["fecha_ingreso_reservacion"].ToString()).Date <= fechaIngresoInteres.Date) &&
                    (DateTime.Parse(reader["fecha_salida_reservacion"].ToString()).Date >= fechaIngresoInteres.Date)) 
                    ||
                    ((DateTime.Parse(reader["fecha_ingreso_reservacion"].ToString()).Date <= fechaSalidaInteres.Date) &&
                    (DateTime.Parse(reader["fecha_salida_reservacion"].ToString()).Date >= fechaSalidaInteres.Date))

                    )
                {

                    respuesta = false;

                }



            }

            objCon.Close();



            return respuesta;
        }


        //metodo para eliminar las reservaciones expiradas de la base de datos
        public string metodoEliminacionReservacionesExpiradas()
        {

            List<string> listafilasExpiradas = new List<string>();

            DateTime fechaIteracion;

            try
            {

                SqlCommand cmd = new SqlCommand("select id_reservacion, fecha_salida_reservacion from reservacion", objCon);


                objCon.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                DateTime fechaHoraCostaRicaDateTime = TimeZoneInfo.ConvertTime(DateTime.Now, TimeZoneInfo.FindSystemTimeZoneById("Central America Standard Time"));

                while (reader.Read())
                {

                    fechaIteracion = DateTime.Parse(reader["fecha_salida_reservacion"].ToString());

                    if (fechaIteracion.Date < fechaHoraCostaRicaDateTime.Date)
                    {

                        listafilasExpiradas.Add(reader["id_reservacion"].ToString());

                    }


                }


                objCon.Close();


                if (listafilasExpiradas.Any())
                {

                    objCon.Open();

                    SqlCommand command;

                    foreach (var i in listafilasExpiradas)
                    {

                        command = new SqlCommand("DELETE FROM reservacion WHERE id_reservacion = '" + i + "'", objCon);
                        command.ExecuteNonQuery();

                    }

                    objCon.Close();


                }

                return listafilasExpiradas.Count().ToString();

            }
            catch (Exception)
            {

                return "Mensaje: Error en el proceso de eliminacion de citas expiradas";

            }


        }


    }
}