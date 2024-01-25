<%-- 
    Document   : home
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
        <!-- Left navbar-header end -->
        <!-- Page Content -->
        <div id="page-wrapper">
            <div class="container-fluid">
                <div class="row bg-title">

                    <ol class="breadcrumb">
                        <li><a href="home.jsp">INICIO</a></li>
                        <li class="active"><label id="nombrelaboratorio"></label></li>
                    </ol>

                    <!-- /.col-lg-12 -->
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="panel panel-default">
                            <center>   <div class="panel-heading">Productos e Inventarios</div></center>
                        </div>
                    </div>
                </div> 

                <div class="row">
                    <div class="col-md-12">
                        <section class="m-t-40">
                            <div class="sttabs tabs-style-iconbox">
                                <nav>
                                    <ul>
                                        <li><a href="#section-iconbox-2" class="sticon icon-book-open"><span>Productos </span></a></li>
                                        <li><a href="#section-iconbox-3" class="sticon  icon-list"><span>Inventarios</span></a></li>
                                    </ul>
                                </nav>
                                <div class="content-wrap" id="secciones">

                                </div>
                                <!-- /content -->
                            </div>
                            <!-- /tabs -->
                        </section>

                    </div>
                </div>

            </div>
        </div>
        <%@include file="Elementos/Footer.jsp"%>
    </div>

    <%@include file="Componentes/Js.jsp"%>
    <script >
        $(document).ready(function () {

            /*Obtener datos almacenados*/
            var email = localStorage.getItem("email");
            var nombreuser = localStorage.getItem("nombre");
            var apellidop = localStorage.getItem("apellidop");
            var apellidom = localStorage.getItem("apellidom");
            var nivel = localStorage.getItem("tipousuario");

            /*Mostrar datos almacenados*/
            document.getElementById("nombrecompleto").innerHTML = nombreuser + " " + apellidop + " " + apellidom;
            document.getElementById("nombredelusario").innerHTML = nombreuser;

            let params = new URLSearchParams(location.search);
            var idlab = params.get('var1');

            datosLaboratorio();
            function datosLaboratorio() {
                $.ajax({
                    url: localStorage.getItem("urlproyecto") + 'LaaServicio/ruta/servicio/buscarlaboratorio',
                    data: {
                        idlaboratorio: idlab
                    },
                    type: 'GET',
                    dataType: 'json',
                    success: function (data) {
                        if (data.id_laboratorio !== "") {
                            document.getElementById("nombrelaboratorio").innerHTML = data.nombre;
                        }
                    },
                    error: function (jqXHR, status, error) {
                        Swal.fire(
                                'No se ha podido establecer conexión con el Servidor',
                                'Verifique su conexión a internet!',
                                'question'
                                );
                    },
                    complete: function (jqXHR, status) {

                    }
                });
            }
            crearDatos();
            function crearDatos() {
                var text = '<section id="section-iconbox-2">' +
                        '<div class="row">' +
                        '<div class="col-lg-4 col-sm-6 col-xs-12">' +
                        '<div class="white-box">' +
                        '<center>' +
                        '<a href="bitacora_de_gases.jsp?idlab=' + idlab + '">' +
                        '<h3 class="box-title">GASES</h3>' +
                        '<br>' +
                        '<ul class="list-inline two-part">' +
                        '<li><i class="icon-folder-alt text-success"></i></li>' +
                        '</ul>' +
                        '</a>' +
                        '</center>' +
                        '</div>' +
                        '</div>' +
                        '<div class="col-lg-4 col-sm-6 col-xs-12">' +
                        '<div class="white-box">' +
                        '<center>' +
                        '<a href="bitacora_de_acceso_laboratorio.jsp?idlab=' + idlab + '">' +
                        '<h3 class="box-title">ACCESO AL LABORATORIO</h3>' +
                        '<br>' +
                        '<ul class="list-inline two-part">' +
                        '<li><i class="icon-folder-alt text-success"></i></li>' +
                        '</ul>' +
                        '</a>' +
                        '</center>' +
                        '</div>' +
                        '</div>' +
                        '<div class="col-lg-4 col-sm-6 col-xs-12">' +
                        '<div class="white-box">' +
                        '<center>' +
                        '<a href="bitacora_de_residuos.jsp?idlab=' + idlab + '">' +
                        '<h3 class="box-title">RESIDUOS</h3>' +
                        '<br>' +
                        '<ul class="list-inline two-part">' +
                        '<li><i class="icon-folder-alt text-success"></i></li>' +
                        '</ul>' +
                        '</a>' +
                        '</center>' +
                        '</div>' +
                        '</div>' +
                        '<div class="col-lg-4 col-sm-6 col-xs-12">' +
                        '<div class="white-box">' +
                        '<center>' +
                        '<a href="bitacora_prestamo_de_material.jsp?idlab=' + idlab + '">' +
                        '<h3 class="box-title">PRESTAMOS DE MATERIAL</h3>' +
                        '<br>' +
                        '<ul class="list-inline two-part">' +
                        '<li><i class="icon-folder-alt text-success"></i></li>' +
                        '</ul>' +
                        '</a>' +
                        '</center>' +
                        '</div>' +
                        '</div>' +
                        '<div class="col-lg-4 col-sm-6 col-xs-12">' +
                        '<div class="white-box">' +
                        '<center>' +
                        '<a href="bitacora_de_equipo_mantenimiento.jsp?idlab=' + idlab + '">' +
                        '<h3 class="box-title">EQUIPOS EN SERVICIO Y MANTENIMIENTO</h3>' +
                        '<br>' +
                        '<ul class="list-inline two-part">' +
                        '<li><i class="icon-folder-alt text-success"></i></li>' +
                        '</ul>' +
                        '</a>' +
                        '</center>' +
                        '</div>' +
                        '</div>' +
                        '</div>' +
                        '</section>' +
                        '<section id="section-iconbox-3">' +
                        '<div class="row">' +
                        '<div class="col-lg-4 col-sm-6 col-xs-12">' +
                        '<div class="white-box">' +
                        '<center>' +
                        '<a href="inventario_de_cristaleria.jsp?idlab=' + idlab + '">' +
                        '<h3 class="box-title">CRISTALERIA</h3>' +
                        '<br>' +
                        '<ul class="list-inline two-part">' +
                        '<li><i class="icon-folder-alt text-success"></i></li>' +
                        '</ul>' +
                        '</a>' +
                        '</center>' +
                        '</div>' +
                        '</div>' +
                        '<div class="col-lg-4 col-sm-6 col-xs-12">' +
                        '<div class="white-box">' +
                        '<center>' +
                        '<a href="inventario_de_equipos.jsp?idlab=' + idlab + '">' +
                        '<h3 class="box-title">EQUIPOS</h3>' +
                        '<br>' +
                        '<ul class="list-inline two-part">' +
                        '<li><i class="icon-folder-alt text-success"></i></li>' +
                        '</ul>' +
                        '</a>' +
                        '</center>' +
                        '</div>' +
                        '</div>' +
                        '<div class="col-lg-4 col-sm-6 col-xs-12">' +
                        '<div class="white-box">' +
                        '<center>' +
                        '<a href="inventario_de_reactivos.jsp?idlab=' + idlab + '">' +
                        '<h3 class="box-title">REACTIVOS</h3>' +
                        '<br>' +
                        '<ul class="list-inline two-part">' +
                        '<li><i class="icon-folder-alt text-success"></i></li>' +
                        '</ul>' +
                        '</a>' +
                        '</center>' +
                        '</div>' +
                        '</div>' +
                        '</div>' +
                        '</section>';
                $("#secciones").append(text);
            }

            (function () {
                [].slice.call(document.querySelectorAll('.sttabs')).forEach(function (el) {
                    new CBPFWTabs(el);
                });
            })();
        });
    </script>
    <%@include file="Elementos/Session.jsp"%>
</body>

</html>
