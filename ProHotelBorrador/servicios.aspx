<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="servicios.aspx.cs" Inherits="ProHotelBorrador.servicios" %>

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

    <title>Fabian Bed & Breakfast - Servicios</title>


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
                    <li class="pagina-actual"><a href="servicios.aspx">Servicios</a></li>
                    <li><a href="reservaciones.aspx">Reservaciones</a></li>
                    <li><a href="login.aspx">Login</a></li>


                </ul>
            </nav>

            <span class="boton-menu"><i class="fas fa-bars"></i></span>
        </header>




        <section class="pagina-titulo">
            <div class="contenedor">
                <h1>Servicios</h1>
            </div>
        </section>


        <section class="linea-divisoria">
        </section>

        <%-- tarjetas informativas de servicios del hotel --%>
        <section id="grupo-tarjetas-servicios">


            <%-- tarjeta izquierda para servicio todo incluido --%>
            <div class="tarjeta-servicios-izquierda" id="servicio-todo-incluido">

                <div class="atenuador-servicios">

                    <div class="contenido-tarjeta-servicios">

                        <img src="\pics\lily-banse - YHSwy6uqvk-unsplash.jpg" alt="">


                        <div class="texto-servicios">

                            <h3>Servicio Todo Incluido</h3>

                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>

                            <ul>
                                <li>Lorem ipsum dolor sit amet</li>
                                <li>tempor incididunt ut labore et dolore magna aliqua</li>
                                <li>Ut enim ad minim veniam</li>
                                <li>Lorem ipsum dolor sit amet</li>
                                <li>tempor incididunt ut labore et dolore magna aliqua</li>
                                <li>Ut enim ad minim veniam</li>
                            </ul>

                        </div>

                    </div>

                </div>

            </div>


            <%-- tarjeta derecha para servicio masaje --%>
            <div class="tarjeta-servicios-derecha" id="servicio-masaje">

                <div class="atenuador-servicios">

                    <div class="contenido-tarjeta-servicios">

                        <img src="\pics\conscious-design-1YclEyrXWSs-unsplash.jpg" alt="">

                        <div class="texto-servicios">

                            <h3>Servicio de Masaje / SPA</h3>

                            <ul>
                                <li>Lorem ipsum dolor sit amet</li>
                                <li>tempor incididunt ut labore et dolore magna aliqua</li>
                                <li>Ut enim ad minim veniam</li>

                            </ul>
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.</p>

                        </div>


                    </div>


                </div>

            </div>

            <%-- tarjeta izquierda para servicio excursion --%>
            <div class="tarjeta-servicios-izquierda" id="servicio-excursion">

                <div class="atenuador-servicios">

                    <div class="contenido-tarjeta-servicios">

                        <img src="\pics\austin-ban-juHayWuaaoQ-unsplash.jpg" alt="">

                        <div class="texto-servicios">

                            <h3>Servicio de Excursion</h3>

                            <p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt.</p>

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
