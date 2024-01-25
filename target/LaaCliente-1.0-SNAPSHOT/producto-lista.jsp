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
                                    <div class="panel-heading">Lista de Productos
                                    </div>
                                </center>
                            </div>
                        </div>
                    </div> 

                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-sm-12">
                                <div class="white-box">
                                    <button style="float:right;" class="btn btn-success btn-outline" id="btnInsertar"><i class="icon-plus"></i> Agregar nuevo producto</button>
                                    <p class="text-muted m-b-30">Exportar los datos a Excel</p>
                                    <div class="table-responsive">
                                        <table id="tablaProducto" class="display nowrap" cellspacing="0" width="100%">
                                            <thead>
                                                <tr>
                                                    <th>
                                                        N°
                                                    </th>
                                                    <th>
                                                        NOMBRE
                                                    </th>
                                                    <th>
                                                        DESCRIPCION
                                                    </th>                                                    
                                                    <th>
                                                        CONTENIDO
                                                    </th>
                                                    <th>
                                                        PRECIO
                                                    </th>
                                                    <th>
                                                        EDITAR
                                                    </th>
                                                    <th>
                                                        ELIMINAR
                                                    </th>
                                                </tr>
                                            </thead>
                                            <tbody id="listaproducto">
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

        <div class="modal loadingModal" id="insertarmodal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"  aria-hidden="true">
            <div class="modal-dialog modal-lg " role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="exampleModalLabel1">NUEVO PRODUTO</h4>
                    </div>
                    <div class="modal-body">
                        <form>
                            <div class="form-group">
                                <label for="nombre">Nombre</label>
                                <input type="text" class="form-control" name="nombre" id="nombre">
                            </div>
                            <div class="form-group">
                                <label for="descripcion">Descripcion</label>
                                <input type="text" class="form-control" name="descripcion" id="descripcion">
                            </div>
                            <div class="form-group">
                                <label for="contenido">Contenido</label>
                                <input type="text" class="form-control" name="contenido" id="contenido">
                            </div>
                            <div class="form-group">
                                <label for="precio">Precio</label>
                                <input type="number" class="form-control" name="precio" id="precio">
                            </div>

                        </form>
                    </div>
                    <div class="modal-footer">
                        <button id="cancelarRegistro" class="btn btn-inverse">Cancelar</button>
                        <button id="btnInsertandoDatos"  class="btn btn-success" >Registrar</button>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal loadingModal" id="actualizarmodal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"  aria-hidden="true">
            <div class="modal-dialog modal-lg " role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="exampleModalLabel1">EDITAR PRODUCTO</h4>
                    </div>
                    <div class="modal-body">
                        <form>
                            <input type="number" class="form-control" id="editandoID" hidden="">
                            <div class="form-group">
                                <label for="nombre">Nombre</label>
                                <input type="text" class="form-control" name="nombreeditado" id="nombreeditado">
                            </div>
                            <div class="form-group">
                                <label for="descripcion">Descripcion</label>
                                <input type="text" class="form-control" name="descripcioneditado" id="descripcioneditado">
                            </div>
                            <div class="form-group">
                                <label for="contenido">Contenido</label>
                                <input type="text" class="form-control" name="contenidoeditado" id="contenidoeditado">
                            </div>
                            <div class="form-group">
                                <label for="precio">Precio</label>
                                <input type="number" class="form-control" name="precioeditado" id="precioeditado">
                            </div>
                            <input type="hidden" name="idproductoeditado" id="idproductoeditado">
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button id="cancelarActualizacion" class="btn btn-inverse">Cancelar</button>
                        <button id="btnactualizar"  class="btn btn-success" >Actualizar</button>
                    </div>
                </div>
            </div>
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

                listaproducto();
                function listaproducto() {
                    $.ajax({
                        url: localStorage.getItem("urlproyecto") + 'LaaServicio/ruta/servicio/listaproducto',
                        type: 'GET',
                        dataType: 'json',
                        success: function (data) {
                            $("#listaproducto").empty();
                            for (var ad in data) {
                                generartabla(data[ad].id_producto, ad, data[ad].nombre, data[ad].descripcion, data[ad].precio, data[ad].contenido);
                            }
                        },
                        error: function (jqXHR, status, error) {

                        },
                        complete: function (jqXHR, status) {

                            $("#tablaProducto").DataTable({
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
                function generartabla(idproducto, indice, nombre, descripcion, precio, contenido) {
                    var text = '<tr id="' + idproducto + '">' +
                            '<td class="py-1">' + ++indice + ' </td>' +
                            '<td >' + nombre + '</td>' +
                            '<td>' + descripcion + '</td>' +
                            '<td>' + contenido + '</td>' +
                            '<td>' + precio + '</td>' +
                            '<td style="text-align:center;" ><button  class="btn btn-success" onclick="buscarProducto(' + idproducto + ')"><i class="fa fa-edit"></i></button></td>' +
                            '<td style="text-align:center;" ><button class="btn btn-danger" onclick="eliminarproducto(' + idproducto + ')" ><i class="icon-trash"></i></button></td>' +
                            '</tr>';
                    $("#listaproducto").append(text);
                }
            });

            function buscarProducto(idproducto) {
                $.ajax({
                    url: localStorage.getItem("urlproyecto") + 'LaaServicio/ruta/servicio/buscarproducto',
                    data: {
                        idproducto: idproducto
                    },
                    type: 'GET',
                    dataType: 'json',
                    success: function (data) {
                        $("#nombreeditado").val(data.nombre);
                        $("#descripcioneditado").val(data.descripcion);
                        $("#contenidoeditado").val(data.contenido);
                        $("#precioeditado").val(data.precio);
                        $("#idproductoeditado").val(data.id_producto);
                        $('#actualizarmodal').modal('show');
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
            
            $("#btnactualizar").click(function () {
                $.ajax({
                    url: localStorage.getItem("urlproyecto") + 'LaaServicio/ruta/servicio/editarproduto',
                    data: {
                        nombre: $("#nombreeditado").val().toUpperCase(),
                        descripcion: $("#descripcioneditado").val().toUpperCase(),
                        contenido: $("#contenidoeditado").val().toUpperCase(),
                        precio: $("#precioeditado").val(),
                        idproducto: $("#idproductoeditado").val() 
                    },
                    type: 'GET',
                    dataType: 'json',
                    success: function (data) {
                        if (data.validador) {
                            Swal.fire({
                                position: 'center',
                                icon: 'success',
                                title: 'Se ha actualizado correctamente',
                                showConfirmButton: false,
                                timer: 1500
                            }).then((result) => {
                                if (
                                        result.dismiss === Swal.DismissReason.timer
                                        ) {
                                }
                                window.location.href = 'producto-lista.jsp';
                            });
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
            });

            $("#btncobrar").click(function () {
                $('#cobrarmodal').modal('show');
            });

            $("#btnInsertar").click(function () {
                $('#insertarmodal').modal('show');
            });

            $("#btnInsertandoDatos").click(function () {
                $.ajax({
                    url: localStorage.getItem("urlproyecto") + 'LaaServicio/ruta/servicio/registrarproducto',
                    data: {
                        nombre: $("#nombre").val().toUpperCase(),
                        descripcion: $("#descripcion").val().toUpperCase(),
                        contenido: $("#contenido").val().toUpperCase(),
                        precio: $("#precio").val()
                    },
                    type: 'GET',
                    dataType: 'json',
                    success: function (data) {
                        if (data.validador) {
                            Swal.fire({
                                position: 'center',
                                icon: 'success',
                                title: 'Se ha registrado correctamente',
                                showConfirmButton: true
                            }).then((result) => {
                                if (
                                        // Read more about handling dismissals
                                        result.dismiss === Swal.DismissReason.timer
                                        ) {
                                }
                                window.location.href = 'producto-lista.jsp';
                            });

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
            });

            //Eliminar un elemento de una tabla
            function eliminarproducto(idproducto) {

                Swal.fire({
                    title: '¿Esta seguro de eliminar el Producto?',
                    text: "¡No podrás revertir esto!",
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Si, eliminar!'
                }).then((result) => {
                    if (result.isConfirmed) {
                        eliminando(idproducto);
                    }
                });
            }
            function eliminando(idproducto) {
                $.ajax({
                    url: localStorage.getItem("urlproyecto") + 'LaaServicio/ruta/servicio/eliminarproducto',
                    data: {
                        id_producto: idproducto
                    },
                    type: 'GET',
                    dataType: 'json',
                    success: function (data) {
                        if (data.validador) {
                            Swal.fire({
                                position: 'center',
                                icon: 'success',
                                title: 'Se ha eliminado correctamente',
                                showConfirmButton: false,
                                timer: 1500
                            }).then((result) => {
                                if (result.dismiss === Swal.DismissReason.timer) {
                                }
                                window.location.href = 'producto-lista.jsp';
                            });

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

            $("#cancelarRegistro").click(function () {
                $('#insertarmodal').modal('hide');
                $("#insertarmodal").find("input,textarea,select").val("");

            });

            $("#cancelarActualizacion").click(function () {
                $('#actualizarmodal').modal('hide');
                $("#actualizarmodal").find("input,textarea,select").val("");

            });

        </script>
        <%@include file="Elementos/Session.jsp"%>
    </body>

</html>
