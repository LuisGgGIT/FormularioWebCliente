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
                                <center>   <div class="panel-heading">Lista de usuarios</div></center>
                            </div>
                        </div>
                    </div> 

                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-sm-12">
                                <div class="white-box">
                                    <button style="float:right;" class="btn btn-success btn-outline" id="btnInsertar"><i class="icon-plus"></i> Agregar nuevo usuario</button>
                                    <p class="text-muted m-b-30">Exportar los datos a Excel</p>
                                    <div class="table-responsive">
                                        <table id="tablaUsuario" class="display nowrap" cellspacing="0" width="100%">
                                            <thead>
                                                <tr>
                                                    <th>
                                                        N°
                                                    </th>
                                                    <th>
                                                        NOMBRE
                                                    </th>
                                                    <th>
                                                        APELLIDO PATERNO
                                                    </th>
                                                    <th>
                                                        APELLIDO MATERNO
                                                    </th>
                                                    <th>
                                                        CORREO ELECTRONICO
                                                    </th>
                                                    <th>
                                                        TIPO USUARIO
                                                    </th>
                                                    <th>
                                                        EDITAR
                                                    </th>
                                                    <th>
                                                        ELIMINAR
                                                    </th>
                                                </tr>
                                            </thead>
                                            <tbody id="listausuario">
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
                        <h4 class="modal-title" id="exampleModalLabel1">NUEVO USUARIO</h4>
                    </div>
                    <div class="modal-body">
                        <form>
                            <div class="form-group">
                                <label for="InputNombre">Nombre</label>
                                <input type="text" class="form-control" id="nombreinsertar">
                            </div>
                            <div class="form-group">
                                <label for="InputApeliidoPaterno">Apellido Paterno</label>
                                <input type="text" class="form-control" id="apellidopaternoinsertar">
                            </div>
                            <div class="form-group">
                                <label for="InputApeliidoMaterno">Apellido Materno</label>
                                <input type="text" class="form-control" id="apellidomaternoinsertar">
                            </div>
                            <div class="form-group">
                                <label for="InputEmail">Correo eletrónico</label>
                                <input type="email" class="form-control" id="emailinsertar">
                            </div>
                            <div class="form-group">
                                <label for="InputNombre">Contraseña</label>
                                <input type="password" class="form-control" id="passwordinsertar">
                            </div>
                            <div class="form-group">
                                <div class="col-sm-12">
                                    <label for="InputEmail">Función</label>
                                    <select class="custom-select col-12" id="tipo_usuarioinsertar">
                                        <option>ADMINISTRADOR</option>
                                        <option>AUXILIAR DEL ADMINISTRADOR</option>
                                    </select>
                                </div>
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
                        <h4 class="modal-title" id="exampleModalLabel1">EDITAR USUARIO</h4>
                    </div>
                    <div class="modal-body">
                        <form>
                            <input type="number" class="form-control" id="editandoID" hidden="">
                            <div class="form-group">
                                <label for="InputNombre">Nombre</label>
                                <input type="text" class="form-control" id="nombreeditado">
                            </div>
                            <div class="form-group">
                                <label for="InputApeliidoPaterno">Apellido Paterno</label>
                                <input type="text" class="form-control" id="apellidopaternoeditado">
                            </div>
                            <div class="form-group">
                                <label for="InputApeliidoMaterno">Apellido Materno</label>
                                <input type="text" class="form-control" id="apellidomaternoeditado">
                            </div>
                            <div class="form-group">
                                <label for="InputEmail">Correo eletrónico</label>
                                <input type="email" class="form-control" id="emaileditado">
                            </div>
                            <div class="form-group">
                                <div class="col-sm-12">
                                    <label for="InputEmail">Función</label>
                                    <select class="custom-select col-12" id="tipo_usuarioeditado">
                                        <option>ADMINISTRADOR</option>
                                        <option>AUXILIAR DEL ADMINISTRADOR</option>
                                    </select>
                                </div>
                            </div>
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


                listausuario();
                function listausuario() {
                    $.ajax({
                        url: localStorage.getItem("urlproyecto") + 'LaaServicio/ruta/servicio/listausuarios',
                        type: 'GET',
                        dataType: 'json',
                        success: function (data) {
                            $("#listausuario").empty();
                            for (var ad in data) {
                                generartabla(data[ad].id_usuario, ad, data[ad].nombre, data[ad].apellidop, data[ad].apellidom, data[ad].email, data[ad].tipo_usuario);
                            }
                        },
                        error: function (jqXHR, status, error) {

                        },
                        complete: function (jqXHR, status) {

                            $("#tablaUsuario").DataTable({
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
                function generartabla(idusuario, indice, nombre, apellidopaterno, apellidomaterno, email, tipo_usuario) {
                    var text = '<tr id="' + idusuario + '">' +
                            '<td class="py-1">' + ++indice + ' </td>' +
                            '<td >' + nombre + '</td>' +
                            '<td>' + apellidopaterno + '</td>' +
                            '<td>' + apellidomaterno + '</td>' +
                            '<td>' + email + '</td>' +
                            '<td>' + tipo_usuario + '</td>' +
                            '<td style="text-align:center;" ><button  class="btn btn-success" onclick="editarUsuario(' + idusuario + ')"><i class="fa fa-edit"></i></button></td>' +
                            '<td style="text-align:center;" ><button class="btn btn-danger" onclick="eliminarUsuario(' + idusuario + ')" ><i class="icon-trash"></i></button></td>' +
                            '</tr>';
                    $("#listausuario").append(text);
                }

            });


            function editarUsuario(idusuario) {
                $.ajax({
                    url: localStorage.getItem("urlproyecto") + 'LaaServicio/ruta/servicio/buscarusuario',
                    data: {
                        idusuario: idusuario
                    },
                    type: 'GET',
                    dataType: 'json',
                    success: function (data) {

                        $("#editandoID").val(idusuario);
                        $("#nombreeditado").val(data.nombre);
                        $("#apellidopaternoeditado").val(data.apellidop);
                        $("#apellidomaternoeditado").val(data.apellidom);
                        $("#emaileditado").val(data.email);
                        $("#tipo_usuarioeditado").val(data.tipo_usuario);
                        correoviejo = data.email;
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

            //Actualizar datos de la tabla
            $("#btnactualizar").click(function () {
                Comprobarexistemail();
                return false;
            });
            function Comprobarexistemail() {
                var idusarioEditar = $("#editandoID").val();
                $.ajax({
                    url: localStorage.getItem("urlproyecto") + 'LaaServicio/ruta/servicio/comprobarexistemail',
                    data: {
                        idusuario: idusarioEditar,
                        email: $("#emaileditado").val()
                    },
                    type: 'GET',
                    dataType: 'json',
                    success: function (data) {
                        if (data.validador) {
                            Swal.fire({
                                title: 'Actualizar datos?',
                                type: 'warning',
                                showCancelButton: true,
                                confirmButtonColor: '#3085d6',
                                cancelButtonColor: '#d33',
                                confirmButtonText: 'si!',
                                cancelButtonText: 'Cancelar'
                            }).then((result) => {
                                if (result.value) {
                                    Actualizar();
                                }
                            });
                        } else {
                            Swal.fire({
                                type: 'error',
                                title: 'El correo actualmente existe',
                                text: 'Intente agregar otro correo'
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

            function Actualizar() {
                var idusarioEditar = $("#editandoID").val();
                $.ajax({
                    url: localStorage.getItem("urlproyecto") + 'LaaServicio/ruta/servicio/editarusuario',
                    data: {
                        email: $("#emaileditado").val().toUpperCase(),
                        nombre: $("#nombreeditado").val().toUpperCase(),
                        apellidopaterno: $("#apellidopaternoeditado").val().toUpperCase(),
                        apellidomaterno: $("#apellidomaternoeditado").val().toUpperCase(),
                        tipo_usuario: $("#tipo_usuarioeditado").val().toUpperCase(),
                        idusuario: idusarioEditar
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
                                window.location.href = 'usuario-lista.jsp';
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


            $("#btnInsertar").click(function () {
                $('#insertarmodal').modal('show');
            });

            $("#btnInsertandoDatos").click(function () {
                $.ajax({
                    url: localStorage.getItem("urlproyecto") + 'LaaServicio/ruta/servicio/insertarusuario',
                    data: {
                        email: $("#emailinsertar").val().toUpperCase(),
                        password: md5($("#passwordinsertar").val()),
                        nombre: $("#nombreinsertar").val().toUpperCase(),
                        apellidopaterno: $("#apellidopaternoinsertar").val().toUpperCase(),
                        apellidomaterno: $("#apellidomaternoinsertar").val().toUpperCase(),
                        tipo_usuario: $("#tipo_usuarioinsertar").val().toUpperCase()
                    },
                    type: 'GET',
                    dataType: 'json',
                    success: function (data) {
                        if (data.validador) {
                            Swal.fire({
                                position: 'center',
                                icon: 'success',
                                title: 'Se ha registrado correctamente',
                                showConfirmButton: false,
                                timer: 1500
                            }).then((result) => {
                                if (
                                        // Read more about handling dismissals
                                        result.dismiss === Swal.DismissReason.timer
                                        ) {
                                }
                                window.location.href = 'usuario-lista.jsp';
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
            function eliminarUsuario(iddato) {

                Swal.fire({
                    title: '¿Esta seguro de eliminar el usuario?',
                    text: "¡No podrás revertir esto!",
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Si, eliminar!'
                }).then((result) => {
                    if (result.isConfirmed) {
                        eliminando(iddato);
                    }
                });
            }
            function eliminando(iddato) {
                $.ajax({
                    url: localStorage.getItem("urlproyecto") + 'LaaServicio/ruta/servicio/eliminarusuario',
                    data: {
                        id_eliminar: iddato
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
                                window.location.href = 'usuario-lista.jsp';
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
