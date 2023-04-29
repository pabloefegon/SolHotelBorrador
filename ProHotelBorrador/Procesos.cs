using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Globalization;


namespace ProHotelBorrador
{
    //CLASE QUE CONTIENE METODOS PARA OBJETIVOS GENERALES (ORDEN DE ELEMENTOS, ESPACIOS VACIOS, FORMATOS CORRECTOS, ETC)
    public class Procesos
    {


        public Procesos()
        {


        }

        //metodo verificacion orden correcto de rango fecha inicio, fecha final
        public bool metodoRangoFechasIncorrecto(string seleccionFechaIngreso, string seleccionFechaSalida)
        {
            bool respuesta = false;

            DateTime fechaIngreso = DateTime.Parse(seleccionFechaIngreso);
            DateTime fechaSalida = DateTime.Parse(seleccionFechaSalida);
            DateTime fechaCostaRica = TimeZoneInfo.ConvertTime(DateTime.Now, TimeZoneInfo.FindSystemTimeZoneById("Central America Standard Time"));


            if ((fechaIngreso.Date < fechaCostaRica.Date)||(fechaIngreso > fechaSalida))
            {

                respuesta = true;
              
            }

            return respuesta;


        }

        //metodo verificacion cantidad dias para reservacion es menor a 7 dias
        public bool metodoCantidadDiasNoAceptableReservacion(string seleccionFechaIngreso, string seleccionFechaSalida)
        {
            bool respuesta = false;

            DateTime fechaIngreso = DateTime.Parse(seleccionFechaIngreso);
            DateTime fechaSalida = DateTime.Parse(seleccionFechaSalida);

            int substractfechasSalidaIngreso = int.Parse(fechaSalida.Subtract(fechaIngreso).Days.ToString());

            if (substractfechasSalidaIngreso > 7)
            {

                respuesta = true;


            }

            return respuesta;

        }

        //metodo para verificar que el usuario haya ingresado valores para un input
        public bool metodoCampoVacio(String valor)
        {
            bool respuesta = false;

            if (valor.Equals(""))
            {

                respuesta = true;

            }

            return respuesta;

        }

        //metodo para verificar que el formato de direccion de email es correcto
        public bool metodoEmailFormatoValido(string email)
        {
            try
            {
                var addr = new System.Net.Mail.MailAddress(email);
                return addr.Address == email;
            }
            catch
            {
                return false;
            }

        }

        //metodo para eliminar espacios vacios y transformar caracteres a lower case
        public string metodoTrimLowerParaTextos(string cadena)
        {

            cadena = cadena.Trim();
            cadena = cadena.ToLower();

            return cadena;

        }


    }
}