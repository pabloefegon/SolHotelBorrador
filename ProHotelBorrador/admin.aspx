<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="admin.aspx.cs" Inherits="ProHotelBorrador.admin" %>

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



    <title>Fabian Bed & Breakfast  - Admin</title>
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
                    <li><a href="reservaciones.aspx">Reservaciones</a></li>
                    <li><a href="login.aspx">Login</a></li>
                    <li class="pagina-actual"><asp:LinkButton ID="linkBotonSalirAdmin" runat="server" ForeColor="Red" OnClick="linkBotonSalirAdmin_Click">Salir</asp:LinkButton></li>
                    


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

        <section class="pagina-titulo">
            <div class="contenedor">
                <h1>Administrador</h1>
            </div>
        </section>


        <section class="linea-divisoria">
        </section>


        <%-- tabla gridview para deplegar los datos basicos de las reservaciones  --%>

        <div id="seccion-tabla-grid-reservaciones"> 



                <asp:GridView ID="GridViewReservaciones" runat="server" AutoGenerateColumns="False" DataKeyNames="id_reservacion" DataSourceID="SqlDataSourceTablaReservaciones" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" CssClass="tablas-admin" ForeColor="Black" GridLines="Vertical" OnRowCommand="GridViewReservaciones_RowCommand" OnSelectedIndexChanged="GridViewReservaciones_SelectedIndexChanged" AllowPaging="True">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" Visible="False" />
                        <asp:TemplateField HeaderText="ID Reservacion" InsertVisible="False" SortExpression="id_reservacion">
                            <ItemTemplate>
                                <asp:Label ID="labelReservacionId" runat="server" Text='<%# Eval("id_reservacion") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="fecha_ingreso_reservacion" HeaderText="Fecha Ingreso" SortExpression="fecha_ingreso_reservacion" DataFormatString="{0:dd/MM/yyyy}" />
                        <asp:BoundField DataField="fecha_salida_reservacion" HeaderText="Fecha Salida" SortExpression="fecha_salida_reservacion" DataFormatString="{0:dd/MM/yyyy}" />
                        <asp:BoundField DataField="personas_reservacion" HeaderText="Cantidad personas" SortExpression="personas_reservacion" />
                        <asp:BoundField DataField="nombre_reservacion" HeaderText="Nombre" SortExpression="nombre_reservacion" />
                        <asp:BoundField DataField="email_reservacion" HeaderText="E-mail" SortExpression="email_reservacion" />
                        <asp:ButtonField ButtonType="Button" CommandName="comandoBotonServicio" HeaderText="Servicio" ShowHeader="True" Text="ver" />
                    </Columns>
                    <FooterStyle BackColor="#CCCC99" />
                    <HeaderStyle BackColor="#05386B" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                    <RowStyle BackColor="#F7F7DE" />
                    <SelectedRowStyle BackColor="#3333FF" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#FBFBF2" />
                    <SortedAscendingHeaderStyle BackColor="#848384" />
                    <SortedDescendingCellStyle BackColor="#EAEAD3" />
                    <SortedDescendingHeaderStyle BackColor="#575357" />
                </asp:GridView>


        </div>

          
        <section class="linea-divisoria">
        </section>

        <%-- tabla gridview para desplegar los datos relacionados a los servicios para una reservacion --%>

        <div id="seccion-tabla-grid-servicios">

            <div class="contenedor">

                <asp:GridView ID="GridViewServicios" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" CssClass="tablas-admin" DataSourceID="SqlDataSourceServicios" GridLines="Vertical" ForeColor="Black">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="id_reservacion" HeaderText="Id Reservacion" SortExpression="id_reservacion" />
                        <asp:CheckBoxField DataField="todo_incluido_servicio" HeaderText="Todo Incluido" SortExpression="todo_incluido_servicio"></asp:CheckBoxField>
                        <asp:CheckBoxField DataField="masaje_servicio" HeaderText="Masaje" SortExpression="masaje_servicio"></asp:CheckBoxField>
                        <asp:CheckBoxField DataField="excursion_servicio" HeaderText="Excursion" SortExpression="excursion_servicio"></asp:CheckBoxField>
                        <asp:BoundField DataField="comentario_servicio" HeaderText="Comentario/Solicitud" SortExpression="comentario_servicio"></asp:BoundField>
                    </Columns>
                    <FooterStyle BackColor="#CCCC99" />
                    <HeaderStyle BackColor="#05386B" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                    <RowStyle BackColor="#F7F7DE" />
                    <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#FBFBF2" />
                    <SortedAscendingHeaderStyle BackColor="#848384" />
                    <SortedDescendingCellStyle BackColor="#EAEAD3" />
                    <SortedDescendingHeaderStyle BackColor="#575357" />
                </asp:GridView>
                  
            </div>

        </div>

        <asp:SqlDataSource ID="SqlDataSourceReservaciones" runat="server" ConnectionString="<%$ ConnectionStrings:BDHotelConnectionString %>" SelectCommand="select reservacion.id_reservacion, fecha_ingreso_reservacion, fecha_salida_reservacion, nombre_reservacion,
email_reservacion, personas_reservacion , id_servicio from reservacion, servicio where reservacion.id_reservacion = servicio.id_reservacion
"></asp:SqlDataSource>

        <asp:SqlDataSource ID="SqlDataSourceTablaReservaciones" runat="server" ConnectionString="<%$ ConnectionStrings:BDHotelConnectionString %>" SelectCommand="SELECT * FROM [reservacion]"></asp:SqlDataSource>

        <asp:SqlDataSource ID="SqlDataSourceServicios" runat="server" ConnectionString="<%$ ConnectionStrings:BDHotelConnectionString %>" SelectCommand="sp_servicio_en_reservacion" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="0" Name="id_reservacion" SessionField="idReservacionSession" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>

        <script src="https://kit.fontawesome.com/c8504a1df9.js" crossorigin="anonymous"></script>


        <script src="app.js"></script>

    </form>
</body>
</html>
