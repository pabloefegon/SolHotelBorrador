<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="ProHotelBorrador.index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <%-- WEB APP DESARROLLADA POR PABLO GONZALEZ   --%>
    <%-- TODAS LAS FOTOGRAFIAS UTILIZADAS FUERON OBTENIDAS DEL SITIO WEB https://unsplash.com/ --%>

    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link href="style.css" rel="stylesheet" />

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Kaushan+Script&display=swap" rel="stylesheet">

    <link href="https://fonts.googleapis.com/css2?family=Homemade+Apple&display=swap" rel="stylesheet">

    <link href="https://fonts.googleapis.com/css2?family=Rock+Salt&display=swap" rel="stylesheet">



    <title>Fabian Bed & Breakfast  - Inicio</title>
</head>
<body>
    <form id="form1" runat="server">

        <%-- header --%>
        <header>

            <div id="nombre">
                <h1><a href="index.aspx">Fabian Bed & Breakfast</a></h1>
            </div>

            
            <%-- menu de navegacion --%>
            <nav>
                <ul>
                    <li class="pagina-actual"><a href="index.aspx">Inicio</a></li>
                    <li><a href="servicios.aspx">Servicios</a></li>
                    <li><a href="reservaciones.aspx">Reservaciones</a></li>
                    <li><a href="login.aspx">Login</a></li>

                </ul>
            </nav>

            <span class="boton-menu"><i class="fas fa-bars"></i></span>
        </header>





        <section id="paisaje-scroll-inicio">

            <div>

                <%-- fotografia scroll inicio de pagina --%>
                <div id="paisaje-scroll-inicio-foto">respira San Carlos</div>

            </div>

        </section>

        <section class="linea-divisoria">
        </section>

        <!-- mensaje banner -->
        <section id="mensaje">
            <div class="contenedor">
                <h1 id="mensaje-texto">Somos un pequeño hotel ficticio en la Fortuna de San Carlos. Acá podra disfrutar de una estadía relajante y personalizada.
                   <a id="enlace-mensaje-texto" href="reservaciones.aspx">Reserve su estadía</a> hoy mismo!
                </h1>
                <h3></h3>
            </div>

        </section>

        <section class="linea-divisoria">
        </section>

        <!-- tarjetas preview de los servicios de hotel -->

        <section id="preview-partes">

            <div id="atenuador">

                <div class="contenedor">

                    <div class="tarjeta">
                        <img src="\pics\datingscout-JTUmzXLoqHQ-unsplash.jpg" alt="Alternate Text" />

                        <div class="tarjeta-texto">

                            <h3>Instalaciones modernas</h3>
                            <p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam.</p>
                            <p>Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit.</p>

                        </div>

                    </div>

                    <div class="tarjeta">
                        <img src="\pics\dimitris-kiriakakis-uuvue8CnM6E-unsplash.jpg" alt="Alternate Text" />

                        <div class="tarjeta-texto">

                            <h3>Las mejores comodidades</h3>
                            <p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam.</p>
                            <p>Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit.</p>

                        </div>

                    </div>

                    <div class="tarjeta">
                        <img src="\pics\jake-melara-Yh6K2eTr_FY-unsplash.jpg" alt="Alternate Text" />

                        <div class="tarjeta-texto">

                            <h3>Conexion con la naturaleza</h3>
                            <p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam.</p>
                            <p>Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit.</p>

                        </div>

                    </div>

                    <div class="tarjeta">
                        <img src="\pics\alan-caishan-cU53ZFBr3lk-unsplash.jpg" alt="Alternate Text" />

                        <div class="tarjeta-texto">

                            <h3>Servicios de relajacion</h3>
                            <p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam.</p>
                            <p>Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit.</p>

                        </div>

                    </div>

                    <div class="tarjeta">
                        <img src="\pics\nathan-cima-6zjvwBNaqow-unsplash.jpg" alt="Alternate Text" />

                        <div class="tarjeta-texto">

                            <h3>Servicios de excursion en la zona</h3>
                            <p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam.</p>
                            <p>Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit.</p>

                        </div>

                    </div>

                    <div class="tarjeta">
                        <img src="\pics\megan-savoie-bHoBMkArD5k-unsplash.jpg" alt="Alternate Text" />

                        <div class="tarjeta-texto">

                            <h3>Excelente gastronomia</h3>
                            <p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam.</p>
                            <p>Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit.</p>

                        </div>

                    </div>

                </div>

            </div>



        </section>

        <section class="linea-divisoria"></section>

        <!-- fotografia scroll final de pagina -->
        <section id="paisaje-scroll-final"></section>

        <section class="linea-divisoria"></section>


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
