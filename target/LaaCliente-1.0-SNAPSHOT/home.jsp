<%-- 
    Document   : home
    Created on : 6/12/2020, 10:25:04 PM
    Author     : celi Diaz
    vesion     : 1.0
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <%@include file="Componentes/Css.jsp"%>

</head>

<body>
    <!-- Preloader -->
    <div class="preloader">
        <div class="cssload-speeding-wheel"></div>
    </div>
    <div id="wrapper">
        <%@include file="Elementos/Header.jsp"%>
        <!-- Left navbar-header -->
        <%@include file="Elementos/Navs.jsp"%>
        <div id="page-wrapper">
            <div class="container-fluid">
                <div class="row bg-title">
                    <div >
                        <h4 class="page-title ">TIENDA NUBE</h4> 
                    </div>
                </div>
                <!-- .row -->
                <div id="listaLaboratorio" class="row">

                </div>
            </div>
            <%@include file="Elementos/Footer.jsp"%>
        </div>

    </div>
    <%@include file="Componentes/Js.jsp"%>
    <script >
        $(document).ready(function () {

            /*Obtener datos almacenados*/
            var email = localStorage.getItem("email");
            var nombre = localStorage.getItem("nombre");
            var apellidop = localStorage.getItem("apellidop");
            var apellidom = localStorage.getItem("apellidom");
            var nivel = localStorage.getItem("rolcuenta");
            /*Mostrar datos almacenados*/

            if (localStorage.getItem("email") != null) {
                document.getElementById("nombrecompleto").innerHTML = nombre + " " + apellidop + " " + apellidom;
                document.getElementById("nombredelusario").innerHTML = nombre;
                window.location.href = 'producto-cobrar.jsp';
                
            } else {
                localStorage.clear(); //Sirve para cerrar sesion
                window.location.href = 'index.jsp';

            }
        });
    </script>
    <%@include file="Elementos/Session.jsp"%>
</body>

</html>
