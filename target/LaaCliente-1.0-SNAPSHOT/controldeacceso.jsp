<%-- 
    Document   : controldeacceso
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

    <nav class="navbar navbar-default navbar-static-top m-b-0">
        <div class="navbar-header"> <a class="navbar-toggle hidden-sm hidden-md hidden-lg " href="javascript:void(0)" data-toggle="collapse" data-target=".navbar-collapse"><i class="ti-menu"></i></a>
            <div class="top-left-part"><span class="hidden-xs"><img src="plugins/images/unsij.png" alt="home" width="220" height="55" /></span></div>
            <br>
            <b class="hidden-xs" style="color:white;">UNIVERSIDAD DE LA SIERRA JUÁREZ</b> 
        </div>
    </nav>

    <div id="wrapper">
        <br>
        <center>  <b> <h4 class=" bg-title"  style="color:#014017;">CONTROL DE ACCESO DE LABORATORIO DE ANALISIS AMBIENTAL</h4> </b> </center>
        <div class="jumbotron jumbotron-fluid">
            <div class="row">
                <div class="col-lg-1"></div>
                <div class="col-lg-10">
                    <div class="white-box">
                        <button style="float:right;" class="btn btn-success" id="btnInsertar"><i class="icon-clock"></i> Registrar hora de entrada</button>
                        <div class="table-responsive">
                            <br>
                            <table id="tablaUsuariosConectados" class="display nowrap" cellspacing="0" width="100%">
                                <thead>
                                    <tr>
                                        <th>
                                            N°
                                        </th>
                                        <th>
                                            FECHA Y HORA DE ENTRADA
                                        </th>
                                        <th>
                                            NOMBRE DEL USUARIO
                                        </th>
                                        <th>
                                            LABORATORIO 
                                        </th>
                                        <th>
                                            ACCIÓN 
                                        </th>
                                    </tr>
                                </thead>
                                <tbody id="listaUsuariosConectados">
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="col-lg-1"></div>
            </div>
            <br><br><br><br><br><br>
            <footer class="footer text-center">
                2021 &copy; Universidad de la Sierra Juárez
            </footer>

        </div>
    </div>

    <div class="modal loadingModal" id="insertarmodal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"  aria-hidden="true">
        <div class="modal-dialog modal-lg " role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="exampleModalLabel1"><i class="icon-clock"></i> REGISTRAR HORA DE ENTRADA</h4>
                </div>
                <div class="modal-body">
                    <form>
                        <div class="form-group">
                            <label for="recipient-name" class="control-label">Nombre completo del usuario</label>
                            <input type="text" class="form-control" id="insertarnombre">
                        </div>
                        <div class="form-group">
                            <label for="recipient-name" class="control-label">Profesor o tutor</label>
                            <input type="text" class="form-control" id="insertarprofesor">
                        </div>
                        <div class="form-group">
                            <label for="recipient-name" class="control-label">Carrera</label>
                            <div class="col-sm-12">
                                <select class="custom-select col-12" id="insertarcarrera">
                                    <option >--Seleccionar--</option>
                                    <option >Ingeniería Forestal</option>
                                    <option >Licenciatura en Ciencias Ambientales</option>
                                    <option >Licenciatura en Informática</option>
                                    <option >Licenciatura en Biología</option>
                                    <option >Ingeniería en Tecnología de la Madera</option>
                                    <option >Licenciatura en Administración Turística</option>
                                    <option >Maestría en Ciencias en Conservación de los Recursos Forestales</option>
                                    <option >Maestría en Ciencias en Gestión Ambiental</option>
                                    <option >Otro</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="recipient-name" class="control-label">Actividad a realizar</label>
                            <input type="text" class="form-control" id="insertaractividad">
                        </div>
                        <div class="form-group">
                            <label class="col-sm-12">Laboratorio a ingresar</label>
                            <div class="col-sm-12">
                                <select class="custom-select col-12" id="listaLaboratorio">
                                </select>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button id="cancelarRegistro" class="btn btn-inverse">Cancelar</button>
                    <button id="btnInsertandoDatos"  class="btn btn-success" >Guardar datos</button>
                </div>
            </div>
        </div>
    </div>

    <div class="modal loadingModal" id="actualizarmodal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"  aria-hidden="true">
        <div class="modal-dialog modal-lg " role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="exampleModalLabel1"><i class="icon-clock"></i> REGISTRAR HORA DE SALIDA</h4>
                </div>
                <div class="modal-body">
                    <form>
                        <input type="number" class="form-control" id="editandoID" hidden="">
                        <div class="form-group">
                            <label for="recipient-name" class="control-label" >Nombre</label><br><br>
                            <label for="recipient-name" class="control-label" id="nombreusuario"></label>
                        </div>
                        <div class="form-group">
                            <label for="recipient-name" class="control-label">Observaciones</label>
                            <input type="text" class="form-control" id="insertarobservaciones">
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button id="cancelarActualizacion" class="btn btn-inverse">Cancelar</button>
                    <button id="btnInsertandohoradesalida"  class="btn btn-success">Registrar</button>
                </div>
            </div>
        </div>
    </div>

    <%@include file="Componentes/Js.jsp"%>
    <script >
        $(document).ready(function () {
            $("#btnEntrada").click(function () {
                $('#insertarEntrada').modal('show');
            });

            listaUsuariosConectados();
            function listaUsuariosConectados() {
                $.ajax({
                    url: localStorage.getItem("urlproyecto") + 'LaaServicio/ruta/servicioListas/lista_control_laboratorio',
                    type: 'GET',
                    dataType: 'json',
                    success: function (data) {

                        $("#listaUsuariosConectados").empty();
                        for (var ad in data) {
                            generartabla(data[ad].id_bitacora_acceso_cada_laboratorio, ad, data[ad].nombre_de_usuario, data[ad].tutor_de_tesis, data[ad].fecha_de_entrada, data[ad].hora_de_entrada);
                        }
                    },
                    error: function (jqXHR, status, error) {

                    },
                    complete: function (jqXHR, status) {
                        $("#tablaUsuariosConectados").DataTable({
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

            function generartabla(iduser, ad, nombre, nombrelab, fecha_de_entrada, hora_de_entrada) {
                var text = '<tr id="' + iduser + '">' +
                        '<td class="py-1">' + ++ad + ' </td>' +
                        '<td >' + fecha_de_entrada + ' ' + hora_de_entrada + '</td>' +
                        '<td >' + nombre + '</td>' +
                        '<td>' + nombrelab + '</td>' +
                        '<td style="text-align:center;" ><button class="btn btn-danger btn-outline" onclick="registrarFechadeSalida(' + iduser + ')"><i class="icon-clock"></i> Registrar hora de salida</button></td>' +
                        '</tr>';
                $("#listaUsuariosConectados").append(text);
            }
        });

        $("#btnInsertar").click(function () {
            listaLaboratorio();
            $('#insertarmodal').modal('show');
        });
        function listaLaboratorio() {
            $.ajax({
                url: localStorage.getItem("urlproyecto") + 'LaaServicio/ruta/servicio/listalaboratorio',
                type: 'GET',
                dataType: 'json',
                success: function (data) {
                    $("#listaLaboratorio").empty();
                    for (var ad in data) {
                        generarContenidoLaboratorio(data[ad].id_laboratorio, ad, data[ad].nombre);
                    }
                },
                error: function (jqXHR, status, error) {

                },
                complete: function (jqXHR, status) {
                }
            });
        }

        function generarContenidoLaboratorio(id_laboratorio, indice, nombre) {
            var text = '<option>' + nombre + '</option>';
            $("#listaLaboratorio").append(text);
        }

        $("#btnInsertandoDatos").click(function () {
            var aux1 = $("#insertarnombre").val();
            var aux2 = $("#insertarcarrera").val();
            var aux3 = $("#insertaractividad").val();
            var aux4 = $("#listaLaboratorio").val();

            if (aux1 != "" && aux2 != "" && aux3 != "" && aux4 != "") {
                $.ajax({
                    url: localStorage.getItem("urlproyecto") + 'LaaServicio/ruta/servicioinsertar/insertarbitacora_de_acceso_laboratorioByUsuario',
                    data: {
                        nombre_de_usuario: $("#insertarnombre").val(),
                        tutor_de_tesis: $("#insertarprofesor").val(),
                        carrera: $("#insertarcarrera").val(),
                        actividad: $("#insertaractividad").val(),
                        id_laboratorio: $("#listaLaboratorio").val()
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
                                window.location.href = 'controldeacceso.jsp';
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
            } else {
                if ($.trim(aux1) === "") {
                    document.getElementById("insertarnombre").style.borderColor = "red";
                } else {
                    document.getElementById("insertarnombre").style.borderColor = "#e4e7ea";
                }
                if ($.trim(aux2) === "") {
                    document.getElementById("insertarcarrera").style.borderColor = "red";
                } else {
                    document.getElementById("insertarcarrera").style.borderColor = "#e4e7ea";
                }
                if ($.trim(aux3) === "") {
                    document.getElementById("insertaractividad").style.borderColor = "red";
                } else {
                    document.getElementById("insertaractividad").style.borderColor = "#e4e7ea";
                }
                if ($.trim(aux4) === "") {
                    document.getElementById("listaLaboratorio").style.borderColor = "red";
                } else {
                    document.getElementById("listaLaboratorio").style.borderColor = "#e4e7ea";
                }
                const Toast = Swal.mixin({
                    toast: true,
                    position: 'top',
                    showConfirmButton: false,
                    timer: 3000,
                    timerProgressBar: true,
                    didOpen: (toast) => {
                        toast.addEventListener('mouseenter', Swal.stopTimer);
                        toast.addEventListener('mouseleave', Swal.resumeTimer);
                    }
                });
                Toast.fire({
                    icon: 'error',
                    title: 'Favor de llenar el fórmulario'
                });
            }
        });

        function registrarFechadeSalida(iduser) {
            $.ajax({
                url: localStorage.getItem("urlproyecto") + 'LaaServicio/ruta/servicioBuscar/buscaraccesoidlab',
                data: {
                    id: iduser
                },
                type: 'GET',
                dataType: 'json',
                success: function (data) {
                    $("#editandoID").val(iduser);
                    document.getElementById('nombreusuario').innerHTML = data.nombre_de_usuario
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

        $("#cancelarRegistro").click(function () {
            $('#insertarmodal').modal('hide');
            $("#insertarmodal").find("input,textarea,select").val("");

        });

        $("#cancelarActualizacion").click(function () {
            $('#actualizarmodal').modal('hide');
            $("#actualizarmodal").find("input,textarea,select").val("");

        });

        //Actualizar datos de la tabla
        $("#btnInsertandohoradesalida").click(function () {
            $.ajax({
                url: localStorage.getItem("urlproyecto") + 'LaaServicio/ruta/servicioeditar/editarbitacora_de_acceso_laboratoriohorasalida',
                data: {
                    id_bitacora_acceso_cada_laboratorio: $("#editandoID").val(),
                    observaciones: $("#insertarobservaciones").val()
                },
                type: 'GET',
                dataType: 'json',
                success: function (data) {
                    if (data.validador) {
                        
                        Swal.fire({
                            position: 'center',
                            icon: 'success',
                            title: 'Ha registrado su hora de salida correctamente',
                            showConfirmButton: false,
                            timer: 1500
                        }).then((result) => {
                            if (result.dismiss === Swal.DismissReason.timer) {
                            }
                            window.location.href = 'controldeacceso.jsp';
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





    </script>
</body>
</html>
