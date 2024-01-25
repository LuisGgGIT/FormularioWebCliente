<%-- 
    Document   : usuario-lista
    Author     : celi Diaz
    vesion     : 1.0
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">
        <%@include file="Componentes/Css.jsp"%>
    </head>
    <body>

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
                        </ol>

                        <!-- /.col-lg-12 -->
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="panel panel-default">
                                <center>
                                    <div class="panel-heading">Lista de Ventas
                                    </div>
                                </center>
                            </div>
                        </div>
                    </div> 

                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-sm-12">
                                <div class="white-box">
                                    <p class="text-muted m-b-30">Exportar los datos a Excel</p>
                                    <div class="table-responsive">
                                        <table id="tablapago" class="display nowrap" cellspacing="0" width="100%">
                                            <thead>
                                                <tr>
                                                    <th>
                                                        N°
                                                    </th>
                                                    <th>
                                                        NOMBRE
                                                    </th>                                                   
                                                    <th>
                                                        CONTENIDO
                                                    </th>
                                                    <th>
                                                        PRECIO
                                                    </th>
                                                    <th>
                                                        UNIDADES
                                                    </th>
                                                    <th>
                                                        TOTAL
                                                    </th>
                                                    <th>
                                                        FECHA
                                                    </th>
                                                </tr>
                                            </thead>
                                            <tbody id="listapago">
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <%@include file="Elementos/Footer.jsp"%>
        </div>

        <script src="Js/md5.js" type="text/javascript"></script>
        <%@include file="Componentes/Js.jsp"%>
        <script >
            var idusarioEditar = "";
            var correoviejo = "";
            var idlab;
            $(document).ready(function () {
                /*Obtener datos almacenados*/
                var email = localStorage.getItem("email");
                var nombreuser = localStorage.getItem("nombre");
                var apellidop = localStorage.getItem("apellidop");
                var apellidom = localStorage.getItem("apellidom");
                var nivel = localStorage.getItem("tipousuario");

                document.getElementById("nombrecompleto").innerHTML = nombreuser + " " + apellidop + " " + apellidom;
                document.getElementById("nombredelusario").innerHTML = nombreuser;
                let params = new URLSearchParams(location.search);
                idlab = params.get('idlab');

                listapago();
                function listapago() {
                    $.ajax({
                        url: localStorage.getItem("urlproyecto") + 'LaaServicio/ruta/servicio/listapago',
                        type: 'GET',
                        dataType: 'json',
                        success: function (data) {
                            $("#listapago").empty();
                            for (var ad in data) {
                                generartabla(data[ad].id_pago, ad, data[ad].nombre, data[ad].contenido, data[ad].precio, data[ad].unidad, data[ad].total, data[ad].fecha);
                            }
                        },
                        error: function (jqXHR, status, error) {

                        },
                        complete: function (jqXHR, status) {

                            $("#tablapago").DataTable({
                                dom: 'Bfrtip',
                                buttons: [
                                    'excel'
                                ],
                                "language": {
                                    "sProcessing": "Procesando...",
                                    "sLengthMenu": "Mostrar _MENU_ registros",
                                    "sZeroRecords": "No se encontraron resultados",
                                    "sEmptyTable": "Ningún dato disponible en esta tabla",
                                    "sInfo": "Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros",
                                    "sInfoEmpty": "Mostrando registros del 0 al 0 de un total de 0 registros",
                                    "sInfoFiltered": "(filtrado de un total de _MAX_ registros)",
                                    "sInfoPostFix": "",
                                    "sSearch": "Buscar:",
                                    "sUrl": "",
                                    "sInfoThousands": ",",
                                    "sLoadingRecords": "Cargando...",
                                    "oPaginate": {
                                        "sFirst": "Primero",
                                        "sLast": "Último",
                                        "sNext": "Siguiente",
                                        "sPrevious": "Anterior"
                                    }, "oAria": {
                                        "sSortAscending": ": Activar para ordenar la columna de manera ascendente",
                                        "sSortDescending": ": Activar para ordenar la columna de manera descendente"
                                    }
                                }}
                            );

                        }
                    });
                }
                function generartabla(idpago, indice, nombre, contenido, precio, unidad, total, fecha) {
                    var text = '<tr id="' + idpago + '">' +
                            '<td class="py-1">' + ++indice + ' </td>' +
                            '<td >' + nombre + '</td>' +
                            '<td>' + (contenido === null || contenido === undefined ? '' : contenido) + '</td>' +
                            '<td>' + precio + '</td>' +
                            '<td>' + unidad + '</td>' +
                            '<td>' + total + '</td>' +
                            '<td>' + fecha + '</td>' +
                            '</tr>';
                    $("#listapago").append(text);
                }
            });




        </script>
        <%@include file="Elementos/Session.jsp"%>
    </body>

</html>
