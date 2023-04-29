<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="reservaciones.aspx.cs" Inherits="ProHotelBorrador.reservaciones" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link href="style.css" rel="stylesheet" />

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Kaushan+Script&display=swap" rel="stylesheet">

    <link href="https://fonts.googleapis.com/css2?family=Homemade+Apple&display=swap" rel="stylesheet">

    <link href="https://fonts.googleapis.com/css2?family=Rock+Salt&display=swap" rel="stylesheet">

    <title>Fabian Bed & Breakfast - Reservaciones
    </title>
</head>
<body>
    <form id="form1" runat="server">

        <%-- header --%>
        <header style="border-bottom: 4px solid #05386B">

            <div id="nombre">
                <h1><a href="index.aspx">Fabian Bed & Breakfast</a></h1>
            </div>

            <%-- menu de navegacion --%>
            <nav>
                <ul>
                    <li><a href="index.aspx">Inicio</a></li>
                    <li><a href="servicios.aspx">Servicios</a></li>
                    <li class="pagina-actual"><a href="reservaciones.aspx">Reservaciones</a></li>
                    <li><a href="login.aspx">Login</a></li>

                </ul>
            </nav>

            <span class="boton-menu"><i class="fas fa-bars"></i></span>
        </header>

        <%-- barra de notificaciones del sistema --%>
        <section class="seccion-notificacion">

            <div class="contenido-notificacion">

                <div class="texto-notificacion">

                    <asp:Label ID="labelNotificacionReservaciones" runat="server" Text="Label"></asp:Label>

                </div>

                <div class="area-boton-cerrar-notificacion">

                    <span class="boton-cerrar-notificacion" onclick="metodoCajaNotificacion()"><i class="fa fa-times" aria-hidden="true"></i></span>


                </div>


            </div>


        </section>

        <%-- titulo de pagina --%>
        <section class="pagina-titulo">
            <div class="contenedor">
                <h1>Reserve su estadía</h1>
            </div>
        </section>

        <section class="linea-divisoria">
        </section>


        <!-- formulario para realizar reservaciones por medio del sistema -->
        <section id="formulario-reservaciones">

            <div class="tono-background">

                <div class="contenedor-area-formulario">


                    <!-- instrucciones para la utilizacion del sistema del formulario -->
                    <div id="instrucciones-color-reservaciones" class="instrucciones">

                        <div class="contenedor">

                            <div class="caja-boton-instrucciones">

                                <input id="botonInstruccionesSolicitudCita" type="button" class="boton-general-asp boton-html-instrucciones" value="Instrucciones" onclick="metodoDesplegarInstrucciones()" />

                            </div>

                            <div class="instrucciones-parrafo">

                                <p>Para agendar una cita por medio de la web app:</p>

                                <p>1. Verifique la disponibilidad del hotel para las fechas (cuadro verde). Presione el boton 'Espacio Disponible?' una vez ingresados los datos que se solicitan.</p>

                                <p>2. Si el espacio se encuentra esta disponible, proceda a ingresar el resto de datos del formulario. Presione el boton "Reservar" para agendar su reservacion.</p>

                                <p>3. Recibira un correo electronico de confirmacion una vez que el sistema haya registrado su reservacion (puede que su confirmacion sea enviada a su carpeta de CORREO NO DESEADO -SPAM-)</p>

                            </div>

                        </div>

                    </div>


                    <div class="contenedor-formulario">

                        <div class="formulario">


                            <%-- segmento para la comprobacion de la disponibilidad de fechas (cuadro verde) --%>
                            <div id="segmento-disponibilidad">

                                <div id="segmento-fechas-personas">

                                    <div class="fila-fechas-personas">
                                        <label for="seleccionFechaIngreso">Fecha Ingreso</label>

                                        <asp:TextBox runat="server" ID="seleccionFechaIngreso" TextMode="Date"></asp:TextBox>
                                    </div>

                                    <div class="fila-fechas-personas">
                                        <label for="seleccionFechaSalida">Fecha Salida</label>

                                        <asp:TextBox ID="seleccionFechaSalida" runat="server" TextMode="Date"></asp:TextBox>
                                    </div>

                                    <div class="fila-fechas-personas">

                                        <label for="seleccionNumeroPersonas">Cantidad Personas</label>

                                        <asp:DropDownList ID="seleccionNumeroPersonas" runat="server">
                                            <asp:ListItem>1</asp:ListItem>
                                            <asp:ListItem Value="2"></asp:ListItem>
                                            <asp:ListItem Value="3"></asp:ListItem>
                                            <asp:ListItem Value="4"></asp:ListItem>
                                            <asp:ListItem Value="5"></asp:ListItem>
                                            <asp:ListItem Value="+6">+6 personas</asp:ListItem>
                                            <asp:ListItem Value="+10">+10 personas</asp:ListItem>
                                        </asp:DropDownList>

                                    </div>

                                </div>

                                <asp:Button ID="botonDisponibilidad" runat="server" Text="Espacio disponible?" OnClick="botonDisponibilidad_Click" />

                                <asp:LinkButton ID="enlaceNuevaDisponibilidad" runat="server" OnClick="enlaceNuevaDisponibilidad_Click" Font-Underline="False" Visible="False">cambiar datos?</asp:LinkButton>

                            </div>

                            <%-- segmento para completar formulario con resto de datos (nombre, email, servicios, comentarios) --%>

                            <div id="segmento-nombre-email">

                                <div class="fila-nombre-email">

                                    <div class="fila-nombre-email-titulo">
                                        <label for="campoNombre">Nombre</label>
                                    </div>

                                    <asp:TextBox ID="campoNombre" runat="server"></asp:TextBox>
                                </div>

                                <div class="fila-nombre-email">

                                    <div class="fila-nombre-email-titulo">
                                        <label for="campoEmail">Email</label>
                                    </div>

                                    <asp:TextBox ID="campoEmail" runat="server"></asp:TextBox>
                                </div>


                            </div>


                            <div id="segmento-servicios-comentario-boton">


                                <div id="segmento-servicios">

                                    <h4>Servicios</h4>

                                    <div
                                        id="segmento-servicios-checkbox">

                                        <div>
                                            <asp:CheckBox ID="checkboxServicioTodoIncluido" runat="server" />


                                            <label for="checkboxServicioTodoIncluido">Todo Incluido</label>

                                        </div>

                                        <div>
                                            <asp:CheckBox ID="checkboxServicioMasaje" runat="server" />

                                            <label for="checkboxServicioMasaje">Masaje</label>

                                        </div>

                                        <div>
                                            <asp:CheckBox ID="checkboxServicioExcursion" runat="server" />

                                            <label for="checkboxServicioExcursion">Excursion</label>

                                        </div>

                                    </div>

                                </div>

                                <div id="segmento-comentario">

                                    <h4>Comentario</h4>

                                    <asp:TextBox ID="campoServicioComentario" runat="server" TextMode="MultiLine" Rows="10" placeholder="Tiene alguna condicion o solicitud para los servicios que desea? Comentenoslo aca!"></asp:TextBox>

                                </div>

                                <div id="segmento-boton-enviar-reservacion">

                                    <asp:Button ID="botonEnviarReservacion" runat="server" Text="Reservar" class="boton-general-asp" OnClick="botonEnviarReservacion_Click" />

                                </div>

                                <asp:SqlDataSource ID="SqlDataSourceParaEnlaceBD" runat="server" ConnectionString="<%$ ConnectionStrings:BDHotelConnectionString %>" SelectCommand="SELECT * FROM [reservacion]"></asp:SqlDataSource>

                            </div>


                        </div>

                    </div>

                </div>

            </div>

        </section>

        <section class="linea-divisoria">
        </section>

        <!-- footer -->
        <footer>
            <div class="contenedor">

                <div id="datos-logos">
                    <p class="datos-contacto">
                        <span>Dirección </span>La Fortuna, San Carlos. 1km oeste del Cementerio La Fortuna
                    </p>
                    <hr>

                    <p class="datos-contacto"><span>Telefono </span><a href="tel:+506000000">0000000</a></p>

                    <hr>


                    <div id="datos-horario">

                        <div id="datos-horario-titulo">
                            <span>Horario Recepcion</span>
                        </div>

                        <div id="datos-horario-horas">

                            <ul>
                                <li><span>Lunes - Sabado</span> 9am - 5pm</li>
                            </ul>


                        </div>

                    </div>


                    <hr>


                    <div id="logos">

                        <ul>
                            <li><a href="#"><i
                                class="fab fa-facebook-f"></i></a></li>
                            <li><a href="#"><i class="fab fa-whatsapp"></i></a></li>
                            <li><a href="#"><i class="fab fa-instagram"></i></a></li>

                        </ul>
                    </div>

                </div>

                <div id="ubicacion">

                    <iframe src="https://www.google.com/maps/embed?pb=!1m14!1m12!1m3!1d693.5666655605224!2d-84.66187979021943!3d10.468661884359918!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!5e0!3m2!1ses!2scr!4v1678917462618!5m2!1ses!2scr" width="600" height="450" style="border: 0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
                </div>



            </div>

            <section class="linea-divisoria"></section>

            <div id="seccion-autoria">

                <h4><a href="https://github.com/pabloefegon/SolHotelBorrador"><i class="fa fa-github" aria-hidden="true"></i></a> / <a href="mailto: pabloefegon@gmail.com">pabloefegon</a> / 2023</h4>

            </div>

        </footer>

        <script src="https://kit.fontawesome.com/c8504a1df9.js" crossorigin="anonymous"></script>
        <script src="app.js"></script>
    </form>
</body>
</html>
