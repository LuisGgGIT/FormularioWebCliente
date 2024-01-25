<%-- 
    Document   : bitacora_de_acceso_laboratorio
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
        <style>
            .popover {
                z-index: 999999;
            }
        </style>
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
                    <div class="row bg-title" id="referencias">
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="panel panel-default">
                                <center>   <div class="panel-heading">Bitacora de acceso de laboratorio</div></center>
                            </div>
                            <hr>
                        </div>
                    </div> 
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-sm-12">
                                <div class="white-box">
                                    <button style="float:right;" class="btn btn-success btn-outline" id="btnInsertar"><i class="icon-plus"></i> Agregar nuevo elemento</button>
                                    <p class="text-muted m-b-30">Exportar los datos a Excel</p>
                                    <div class="table-responsive">
                                        <table id="tablaAccesoLaboratorio" class="display nowrap" cellspacing="0" width="100%">
                                            <thead>
                                                <tr>
                                                    <th>
                                                        N°
                                                    </th>
                                                    <th>
                                                        NOMBRE
                                                    </th>
                                                    <th>
                                                        TUTOR DE TESIS
                                                    </th>
                                                    <th>
                                                        FECHA Y HORA DE ENTRADA
                                                    </th>
                                                    <th>
                                                        FECHA Y HORA DE SALIDA
                                                    </th>
                                                    <th>
                                                        CARRERA
                                                    </th>
                                                    <th>
                                                        ACTIVIDAD
                                                    </th>
                                                    <th>
                                                        OBSERVACIÓN
                                                    </th>
                                                    <th>
                                                        LABORATORIO
                                                    </th>
                                                    <th>
                                                        EDITAR
                                                    </th>
                                                    <th>
                                                        ELIMINAR
                                                    </th>
                                                </tr>
                                            </thead>
                                            <tbody id="listaAccesoLaboratorio">
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
                        <h4 class="modal-title" id="exampleModalLabel1">NUEVO ELEMENTO</h4>
                    </div>
                    <div class="modal-body">
                        <form data-toggle="validator">
                            <div class="form-group">
                                <label for="message-text" class="control-label">Nombre del usuario</label>
                                <input type="text" class="form-control" id="insertarNombre" required>
                            </div>
                            <div class="form-group">
                                <label for="recipient-name" class="control-label">Nombre del tutor o profesor</label>
                                <input type="text" class="form-control" id="insertarTutor" required>
                            </div>
                            <div class="form-group">
                                <div class="col-md-6">
                                    <label for="recipient-name" class="control-label">Fecha de entrada</label>
                                    <input type="text" id="insertarFechaEntrada" class="form-control">
                                </div>
                                <div class="col-md-6">
                                    <label for="recipient-name" class="control-label">Hora de entrada</label>
                                    <div class="input-group clockpicker " data-placement="bottom" data-align="top" data-autoclose="true">
                                        <input id="insertarHoraEntrada" type="text" class="form-control" value="" required>
                                        <span class="input-group-addon"> <span class="glyphicon glyphicon-time"></span> </span>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-md-6">
                                    <label for="recipient-name" class="control-label">Fecha de salida</label>
                                    <input type="text" id="insertarFechaSalida" class="form-control">
                                </div>
                                <div class="col-md-6">
                                    <label for="recipient-name" class="control-label">Hora de salida</label>
                                    <div class="input-group clockpicker " data-placement="bottom" data-align="top" data-autoclose="true">
                                        <input id="insertarHoraSalida" type="text" class="form-control" value="" required>
                                        <span class="input-group-addon"> <span class="glyphicon glyphicon-time"></span> </span>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="recipient-name" class="control-label">Carrera</label>
                                <div class="col-sm-12">
                                    <select class="custom-select col-12" id="insertarCarrera">
                                        <option ></option>
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
                                <input type="text" class="form-control" id="insertaractividad" required>
                            </div>   
                            <div class="form-group">
                                <label for="recipient-name" class="control-label">Oservacion</label>
                                <input type="text" class="form-control" id="insertarobservacion">
                            </div>  
                            <div class="form-group">
                                <label class="col-sm-12">Laboratorio de</label>
                                <div class="col-10">
                                    <input class="form-control" type="text"  id="insertarLabIngresado" readonly>
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
                        <h4 class="modal-title" id="exampleModalLabel1">EDITAR ELEMENTO</h4>
                    </div>
                    <div class="modal-body">
                        <form>
                            <input type="number" class="form-control" id="editandoID" hidden="">
                            <div class="form-group">
                                <label for="message-text" class="control-label">Nombre del usuario</label>
                                <input type="text" class="form-control" id="editandoNombre">
                            </div>
                            <div class="form-group">
                                <label for="recipient-name" class="control-label">Nombre del tutor o profesor</label>
                                <input type="text" class="form-control" id="editandoTutor">
                            </div>                            
                            <div class="form-group">
                                <div class="col-md-6">
                                    <label for="recipient-name" class="control-label">Fecha de entrada</label>
                                    <input type="text" id="editandoFechaEntrada" class="form-control ">
                                </div>
                                <div class="col-md-6">
                                    <label for="recipient-name" class="control-label">Hora de entrada</label>
                                    <div class="input-group clockpicker " data-placement="bottom" data-align="top" data-autoclose="true">
                                        <input id="editandoHoraEntrada" type="text" class="form-control" value="">
                                        <span class="input-group-addon"> <span class="glyphicon glyphicon-time"></span> </span>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-md-6">
                                    <label for="recipient-name" class="control-label">Fecha de salida</label>
                                    <input type="text" id="editandoFechaSalida" class="form-control ">
                                </div>
                                <div class="col-md-6">
                                    <label for="recipient-name" class="control-label">Hora de salida</label>
                                    <div class="input-group clockpicker " data-placement="bottom" data-align="top" data-autoclose="true">
                                        <input id="editandoHoraSalida" type="text" class="form-control" value="">
                                        <span class="input-group-addon"> <span class="glyphicon glyphicon-time"></span> </span>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="recipient-name" class="control-label">Carrera</label>
                                <div class="col-sm-12">
                                    <select class="custom-select col-12" id="editandoCarrera">
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
                                <input type="text" class="form-control" id="editandoactividad">
                            </div>   
                            <div class="form-group">
                                <label for="recipient-name" class="control-label">Oservacion</label>
                                <input type="text" class="form-control" id="editandoobservacion">
                            </div>   
                            <div class="form-group">
                                <label class="col-sm-12">Laboratorio ingresado</label>
                                <div class="col-sm-12">
                                    <select class="custom-select col-12" id="editandoLabIngresado">
                                        <option>Aguas y suelos</option>
                                        <option>Bioquímica molecular</option>
                                        <option>Ciencias de la tierra</option>
                                        <option>Ecología y biodiversidad</option>
                                        <option>Ecotoxicología</option>
                                        <option>Geología ambiental</option>
                                        <option>Instrumentación</option>
                                        <option>Laboratorio de analisis ambiental</option>
                                        <option>Microbiología ambiental</option>
                                        <option>Química ambiental </option>
                                        <option>Sistemas de información geográfica</option>
                                    </select>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button id="cancelarActualizacion" class="btn btn-inverse">Cancelar</button>
                        <button id="btnactualizar" class="btn btn-success" >Actualizar datos</button>
                    </div>
                </div>
            </div>
        </div>

        <%@include file="Componentes/Js.jsp"%>
        <script >
            var idlab;
            $(document).ready(function () {
                $('.mydatepicker').datepicker({
                    format: "dd/mm/yyyy",
                    language: "es",
                    orientation: "bottom auto",
                    autoclose: true
                });
                $('.clockpicker').clockpicker({
                    donetext: 'Done'
                }).find('input').change(function () {
                    console.log(this.value);
                });

                if (/mobile/i.test(navigator.userAgent)) {
                    $('input').prop('readOnly', true);
                }

                $.fn.datepicker.dates['es'] = {
                    days: ['Domingo', 'Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado'],
                    daysShort: ['Dom', 'Lun', 'Mar', 'Mié', 'Juv', 'Vie', 'Sáb'],
                    daysMin: ['Do', 'Lu', 'Ma', 'Mi', 'Ju', 'Vi', 'Sá'],
                    months: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'],
                    monthsShort: ['Ene', 'Feb', 'Mar', 'Abr', 'May', 'Jun', 'Jul', 'Ago', 'Sep', 'Oct', 'Nov', 'Dic']
                };

                $('#insertarFechaEntrada').datepicker({
                    format: "dd/mm/yyyy",
                    language: "es",
                    orientation: "bottom auto"
                });
                $('#insertarFechaSalida').datepicker({
                    format: "dd/mm/yyyy",
                    language: "es",
                    orientation: "bottom auto"
                });
                $('#editandoFechaEntrada').datepicker({
                    format: "dd/mm/yyyy",
                    language: "es",
                    orientation: "bottom auto"
                });
                $('#editandoFechaSalida').datepicker({
                    format: "dd/mm/yyyy",
                    language: "es",
                    orientation: "bottom auto"
                });

                // Date Picker
                jQuery('.mydatepicker, #datepicker').datepicker();
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

                Referencias();
                function Referencias() {
                    var text = '<ol class="breadcrumb">' +
                            '       <li><a href="home.jsp">Inicio</a></li>' +
                            '       <li class="active" > <a href="BitacoraeInventario.jsp?var1=' + idlab + '">Bitacoras e invetarios</a>  /  Laboratorio de <label id="nombrelaboratorio"></label></li>' +
                            '   </ol>';

                    $("#referencias").append(text);
                }

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
                RecuperarListaAccesoLaboratorio();
                function RecuperarListaAccesoLaboratorio() {
                    $.ajax({
                        url: localStorage.getItem("urlproyecto") + 'LaaServicio/ruta/servicioListas/lista_bitacora_de_acceso_laboratorio',
                        data: {
                            idlaboratorio: idlab
                        },
                        type: 'GET',
                        dataType: 'json',
                        success: function (data) {
                            $("#listaAccesoLaboratorio").empty();
                            for (var ad in data) {

                                generartabla(data[ad].id_bitacora_acceso_cada_laboratorio, ad, data[ad].fecha_de_entrada, data[ad].fecha_de_salida, data[ad].nombre_de_usuario, data[ad].tutor_de_tesis, data[ad].hora_de_entrada, data[ad].hora_de_salida, data[ad].carrera, data[ad].actividad, data[ad].observacion, data[ad].id_laboratorio);
                            }
                        },
                        error: function (jqXHR, status, error) {

                        },
                        complete: function (jqXHR, status) {

                            $("#tablaAccesoLaboratorio").DataTable({
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

                function generartabla(id_bitacora_acceso_cada_laboratorio, ad, fecha_de_entrada, fecha_de_salida, nombre_de_usuario, tutor_de_tesis, hora_de_entrada, hora_de_salida, carrera, actividad, observacion, id_laboratorio) {
                    var nombrelaboratorio = document.getElementById('nombrelaboratorio').textContent;
                    var text = '<tr id="' + id_bitacora_acceso_cada_laboratorio + '">' +
                            '<td class="py-1">' + ++ad + ' </td>' +
                            '<td>' + nombre_de_usuario + '</td>' +
                            '<td>' + tutor_de_tesis + '</td>' +
                            '<td>' + fecha_de_entrada + '  ' + hora_de_entrada + '</td>' +
                            '<td>' + fecha_de_salida + '  ' + hora_de_salida + '</td>' +
                            '<td>' + carrera + '</td>' +
                            '<td>' + actividad + '</td>' +
                            '<td>' + observacion + '</td>' +
                            '<td>' + nombrelaboratorio + '</td>' +
                            '<td style="text-align:center;" ><button  class="btn btn-success" onclick="editarAccesoLaboratorio(' + id_bitacora_acceso_cada_laboratorio + ')" ><i class="fa fa-edit"></i></button></td>' +
                            '<td style="text-align:center;" ><button class="btn btn-danger" onclick="eliminarAccesoLaboratorio(' + id_bitacora_acceso_cada_laboratorio + ')" ><i class="icon-trash"></i></button></td>' +
                            '</tr>';
                    $("#listaAccesoLaboratorio").append(text);
                }
            });

            function editarAccesoLaboratorio(id_bitacora_acceso_cada_laboratorio) {
                var nombrelaboratorio = document.getElementById('nombrelaboratorio').textContent;
                $.ajax({
                    url: localStorage.getItem("urlproyecto") + 'LaaServicio/ruta/servicioBuscar/buscaraccesoidlab',
                    data: {
                        id: id_bitacora_acceso_cada_laboratorio
                    },
                    type: 'GET',
                    dataType: 'json',
                    success: function (data) {
                        $("#editandoID").val(id_bitacora_acceso_cada_laboratorio);
                        $("#editandoNombre").val(data.nombre_de_usuario);
                        $("#editandoTutor").val(data.tutor_de_tesis);
                        $("#editandoFechaEntrada").val(data.fecha_de_entrada);
                        $("#editandoHoraEntrada").val(data.hora_de_entrada);
                        $("#editandoFechaSalida").val(data.fecha_de_salida);
                        $("#editandoHoraSalida").val(data.hora_de_salida);
                        $("#editandocarrera").val(data.carrera);
                        $("#editandoactividad").val(data.actividad);
                        $("#editandoobservacion").val(data.observacion);
                        $("#editandoLabIngresado").val(nombrelaboratorio);
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
            $("#btnactualizar").click(function () {
                Swal.fire({
                    title: 'Desea realizar los cambios?',
                    icon: 'question',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Si, Actualizar!'
                }).then((result) => {
                    if (result.isConfirmed) {
                        Actualizar();
                    }
                });
            });

            function Actualizar() {
                console.log("idlaboratorio" + document.getElementById("editandoLabIngresado").value);
                $.ajax({
                    url: localStorage.getItem("urlproyecto") + 'LaaServicio/ruta/servicioeditar/editarbitacora_de_acceso_laboratorio',
                    data: {
                        id_bitacora_acceso_cada_laboratorio: $("#editandoID").val(),
                        nombre_de_usuario: $("#editandoNombre").val(),
                        tutor_de_tesis: $("#editandoTutor").val(),
                        fechaentrada: $("#editandoFechaEntrada").val(),
                        fechasalida: $("#editandoFechaSalida").val(),
                        horaentrada: $("#editandoHoraEntrada").val(),
                        horasalida: $("#editandoHoraSalida").val(),
                        carrera: $("#editandoCarrera").val(),
                        actividad: $("#editandoactividad").val(),
                        observacion: $("#editandoobservacion").val(),
                        nombrelaboratorio: document.getElementById("editandoLabIngresado").value
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
                                window.location.href = 'bitacora_de_acceso_laboratorio.jsp?idlab=' + idlab;
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
                $("#insertarLabIngresado").val(document.getElementById('nombrelaboratorio').textContent);
                $('#insertarmodal').modal('show');
            });

            $("#btnInsertandoDatos").click(function () {
                var aux1 = $("#insertarNombre").val();
                var aux2 = $("#insertarTutor").val();
                var aux3 = $("#insertarFechaEntrada").val();
                var aux4 = $("#insertarFechaSalida").val();
                var aux5 = $("#insertarHoraEntrada").val();
                var aux6 = $("#insertarHoraSalida").val();
                var aux7 = $("#insertarCarrera").val();
                var aux8 = $("#insertaractividad").val();
                if (aux1 != "" && aux2 != "" && aux3 != "" && aux4 != "" && aux5 != "" && aux6 != "" && aux7 != "" && aux8 != "") {
                    $.ajax({
                        url: localStorage.getItem("urlproyecto") + 'LaaServicio/ruta/servicioinsertar/insertarbitacora_de_acceso_laboratorio',
                        data: {
                            nombre_de_usuario: $("#insertarNombre").val(),
                            tutor_de_tesis: $("#insertarTutor").val(),
                            fechaentrada: $("#insertarFechaEntrada").val(),
                            fechasalida: $("#insertarFechaSalida").val(),
                            horaentrada: $("#insertarHoraEntrada").val(),
                            horasalida: $("#insertarHoraSalida").val(),
                            carrera: $("#insertarCarrera").val(),
                            actividad: $("#insertaractividad").val(),
                            observacion: $("#insertarobservacion").val(),
                            id_laboratorio: idlab
                        },
                        type: 'GET',
                        dataType: 'json',
                        success: function (data) {
                            if (data.validador) {
                                Swal.fire({
                                    position: 'center',
                                    icon: 'success',
                                    title: 'Se ha insertado correctamente',
                                    showConfirmButton: false,
                                    timer: 1500
                                }).then((result) => {
                                    if (
                                            result.dismiss === Swal.DismissReason.timer
                                            ) {
                                    }
                                    window.location.href = 'bitacora_de_acceso_laboratorio.jsp?idlab=' + idlab;
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
                        document.getElementById("insertarNombre").style.borderColor = "red";
                    } else {
                        document.getElementById("insertarNombre").style.borderColor = "#e4e7ea";
                    }
                    if ($.trim(aux2) === "") {
                        document.getElementById("insertarTutor").style.borderColor = "red";
                    } else {
                        document.getElementById("insertarTutor").style.borderColor = "#e4e7ea";
                    }
                    if ($.trim(aux3) === "") {
                        document.getElementById("insertarFechaEntrada").style.borderColor = "red";
                    } else {
                        document.getElementById("insertarFechaEntrada").style.borderColor = "#e4e7ea";
                    }
                    if ($.trim(aux4) === "") {
                        document.getElementById("insertarFechaSalida").style.borderColor = "red";
                    } else {
                        document.getElementById("insertarFechaSalida").style.borderColor = "#e4e7ea";
                    }
                    if ($.trim(aux5) === "") {
                        document.getElementById("insertarHoraEntrada").style.borderColor = "red";
                    } else {
                        document.getElementById("insertarHoraEntrada").style.borderColor = "#e4e7ea";
                    }
                    if ($.trim(aux6) === "") {
                        document.getElementById("insertarHoraSalida").style.borderColor = "red";
                    } else {
                        document.getElementById("insertarHoraSalida").style.borderColor = "#e4e7ea";
                    }
                    if ($.trim(aux7) === "") {
                        document.getElementById("insertarCarrera").style.borderColor = "red";
                    } else {
                        document.getElementById("insertarCarrera").style.borderColor = "#e4e7ea";
                    }
                    if ($.trim(aux8) === "") {
                        document.getElementById("insertaractividad").style.borderColor = "red";
                    } else {
                        document.getElementById("insertaractividad").style.borderColor = "#e4e7ea";
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

            //Eliminar un elemento de una tabla
            function eliminarAccesoLaboratorio(iddato) {

                Swal.fire({
                    title: '¿Esta seguro de eliminar el dato?',
                    text: "¡No podrás revertir esto!",
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Si, eliminar !'
                }).then((result) => {
                    if (result.isConfirmed) {
                        eliminando(iddato);
                    }
                });
            }
            function eliminando(iddato) {
                $.ajax({
                    url: localStorage.getItem("urlproyecto") + 'LaaServicio/ruta/servicioeliminar/eliminarbitacora_de_acceso_laboratorio',
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
                                if (
                                        result.dismiss === Swal.DismissReason.timer
                                        ) {
                                }
                                window.location.href = 'bitacora_de_acceso_laboratorio.jsp?idlab=' + idlab;
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
        </script>
        <%@include file="Elementos/Session.jsp"%>
    </body>

</html>
