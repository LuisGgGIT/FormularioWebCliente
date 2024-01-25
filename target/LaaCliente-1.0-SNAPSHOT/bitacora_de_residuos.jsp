<%-- 
    Document   : bitacora_de_residuos
    Author     : celi
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
                    <div class="row bg-title" id="referencias">
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="panel panel-default">
                                <center>   <div class="panel-heading">Bitacoras de residuos</div></center>
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
                                        <table id="tablaResiduos" class="display nowrap" cellspacing="0" width="100%">
                                            <thead>
                                                <tr>
                                                    <th>
                                                        N°
                                                    </th>
                                                    <th>
                                                        FECHA DE INGRESO
                                                    </th>
                                                    <th>
                                                        NOMBRE DEL QUIMICO
                                                    </th>
                                                    <th>
                                                        TIPO DE RESIDUO
                                                    </th>
                                                    <th>
                                                        ESTADO FISICO
                                                    </th>
                                                    <th>
                                                        FECHA DE INGRESO AL ALMACEN
                                                    </th>
                                                    <th>
                                                        NOMBRE DEL RESPONSABLE<br>
                                                        DE AUTORIAZACION DEL AMACENAJE<br>
                                                        DEL RESIDUO
                                                    </th>
                                                    <th>
                                                        DESTINO FINAL
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
                                            <tbody id="listaResiduos">
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
                        <form>
                            <div class="form-group">
                                <label for="recipient-name" class="control-label">Fecha de ingreso</label>
                                <input type="text" id="insertarFechaIngreso" class="form-control">
                            </div>
                            <div class="form-group">
                                <label for="message-text" class="control-label">Nombre del quimico</label>
                                <input type="text" class="form-control" id="insertarnombreQuimico">
                            </div>
                            <div class="form-group">
                                <label for="recipient-name" class="control-label">Tipo de residuo</label>
                                <input type="text" class="form-control" id="insertarTiporesiduo">
                            </div>
                            <div class="form-group">
                                <label for="recipient-name" class="control-label">Estado fisico</label>
                                <input type="text" class="form-control" id="insertarEstadoFisico">
                            </div>
                            <div class="form-group">
                                <label for="recipient-name" class="control-label">Fecha de ingreso al almacen</label>
                                <input type="text" id="insertarfechaAlmacen" class="form-control">
                            </div>
                            <div class="form-group">
                                <label for="recipient-name" class="control-label">Nombre del responsable de autorización del almacenaje</label>
                                <input type="text" class="form-control" id="insertarNombreResponsable">
                            </div>
                            <div class="form-group">
                                <label for="recipient-name" class="control-label">Destino final</label>
                                <input type="text" class="form-control" id="insertarDestino">
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
                                <label for="recipient-name" class="control-label">Fecha de ingreso</label>
                                <input type="text" id="editandoFechaIngreso" class="form-control">
                            </div>
                            <div class="form-group">
                                <label for="message-text" class="control-label">Nombre del quimico</label>
                                <input type="text" class="form-control" id="editandonombreQuimico">
                            </div>
                            <div class="form-group">
                                <label for="recipient-name" class="control-label">Tipo de residuo</label>
                                <input type="text" class="form-control" id="editandoTiporesiduo">
                            </div>
                            <div class="form-group">
                                <label for="recipient-name" class="control-label">Estado fisico</label>
                                <input type="text" class="form-control" id="editandoEstadoFisico">
                            </div>
                            <div class="form-group">
                                <label for="recipient-name" class="control-label">Fecha de ingreso al almacen</label>
                                <input type="text" id="editandofechaAlmacen" class="form-control">
                            </div>
                            <div class="form-group">
                                <label for="recipient-name" class="control-label">Nombre del responsable de autorización del almacenaje</label>
                                <input type="text" class="form-control" id="editandoNombreResponsable">
                            </div>
                            <div class="form-group">
                                <label for="recipient-name" class="control-label">Destino final</label>
                                <input type="text" class="form-control" id="editandoDestino">
                            </div>
                            <div class="form-group">
                                <label class="col-sm-12">Laboratorio ingresado</label>
                                <div class="col-sm-12">
                                    <select class="custom-select col-12" id="editandoLabIngresado">
                                        <option >Aguas y suelos</option>
                                        <option >Bioquímica molecular</option>
                                        <option >Ciencias de la tierra</option>
                                        <option >Ecología y biodiversidad</option>
                                        <option >Ecotoxicología</option>
                                        <option >Geología ambiental</option>
                                        <option >Instrumentación</option>
                                        <option >Laboratorio de analisis ambiental</option>
                                        <option >Microbiología ambiental</option>
                                        <option >Química ambiental</option>
                                        <option >Sistemas de información geográfica</option>
                                    </select>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button id="cancelarActualizacion" class="btn btn-inverse">Cancelar</button>
                        <button id="btnactualizar"  class="btn btn-success" >Actualizar datos</button>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="Componentes/Js.jsp"%>
        <script >
            var idlab;
            $(document).ready(function () {

                $('#insertarFechaIngreso').datepicker({
                    format: "dd/mm/yyyy",
                    language: "es",
                    orientation: "bottom auto"
                });
                $('#insertarfechaAlmacen').datepicker({
                    format: "dd/mm/yyyy",
                    language: "es",
                    orientation: "bottom auto"
                });

                $('#editandoFechaIngreso').datepicker({
                    format: "dd/mm/yyyy",
                    language: "es",
                    orientation: "bottom auto"
                });
                $('#editandofechaAlmacen').datepicker({
                    format: "dd/mm/yyyy",
                    language: "es",
                    orientation: "bottom auto"
                });

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
                            '       <li class="active" > <a href="BitacoraeInventario.jsp?var1=' + idlab + '">Bitacoras e invetarios</a>  / Laboratorio de <label id="nombrelaboratorio"></label></li>' +
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

                RecuperarListaResiduos();
                function RecuperarListaResiduos() {
                    $.ajax({
                        url: localStorage.getItem("urlproyecto") + 'LaaServicio/ruta/servicioListas/lista_bitacora_de_residuos',
                        data: {
                            idlaboratorio: idlab
                        },
                        type: 'GET',
                        dataType: 'json',
                        success: function (data) {
                            $("#listaResiduos").empty();
                            for (var ad in data) {

                                generartabla(data[ad].id_bitacora_de_residuo, ad, data[ad].fecha_de_ingreso, data[ad].nombre_quimico, data[ad].tipo_de_residuo, data[ad].estado_fisico, data[ad].fecha_de_ingreso_almacen, data[ad].nombre_de_autorizacion_almacenaje_residuo, data[ad].destino_final, data[ad].id_laboratorio);
                            }
                        },
                        error: function (jqXHR, status, error) {

                        },
                        complete: function (jqXHR, status) {

                            $("#tablaResiduos").DataTable({
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

                function generartabla(id_bitacora_de_residuo, ad, fecha_de_ingreso, nombre_quimico, tipo_de_residuo, estado_fisico, fecha_de_ingreso_almacen, nombre_de_autorizacion_almacenaje_residuo, destino_final, id_laboratorio) {
                    var nombrelaboratorio = document.getElementById('nombrelaboratorio').textContent;
                    var text = '<tr id="' + id_bitacora_de_residuo + '">' +
                            '<td class="py-1">' + ++ad + ' </td>' +
                            '<td >' + fecha_de_ingreso + '</td>' +
                            '<td>' + nombre_quimico + '</td>' +
                            '<td>' + tipo_de_residuo + '</td>' +
                            '<td>' + estado_fisico + '</td>' +
                            '<td>' + fecha_de_ingreso_almacen + '</td>' +
                            '<td>' + nombre_de_autorizacion_almacenaje_residuo + '</td>' +
                            '<td>' + destino_final + '</td>' +
                            '<td>' + nombrelaboratorio + '</td>' +
                            '<td style="text-align:center;" ><button  class="btn btn-success" onclick="editarBitacoraResiduos(' + id_bitacora_de_residuo + ')" ><i class="fa fa-edit"></i></button></td>' +
                            '<td style="text-align:center;" ><button class="btn btn-danger" onclick="eliminarBitacoraResiduos(' + id_bitacora_de_residuo + ')" ><i class="icon-trash"></i></button></td>' +
                            '</tr>';
                    $("#listaResiduos").append(text);
                }
            });

            function editarBitacoraResiduos(id_bitacora_de_residuo) {
                var nombrelaboratorio = document.getElementById('nombrelaboratorio').textContent;
               
                $.ajax({
                    url: localStorage.getItem("urlproyecto") + 'LaaServicio/ruta/servicioBuscar/buscarbitacoraresiduo',
                    data: {
                        id: id_bitacora_de_residuo
                    },
                    type: 'GET',
                    dataType: 'json',
                    success: function (data) {
                        $("#editandoID").val(id_bitacora_de_residuo);
                        $("#editandoFechaIngreso").val(data.fecha_de_ingreso);
                        $("#editandonombreQuimico").val(data.nombre_quimico);
                        $("#editandoTiporesiduo").val(data.tipo_de_residuo);
                        $("#editandoEstadoFisico").val(data.estado_fisico);
                        $("#editandofechaAlmacen").val(data.fecha_de_ingreso_almacen);
                        $("#editandoNombreResponsable").val(data.nombre_de_autorizacion_almacenaje_residuo);
                        $("#editandoDestino").val(data.destino_final);
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
               
                $.ajax({
                    url: localStorage.getItem("urlproyecto") + 'LaaServicio/ruta/servicioeditar/editarbitacora_de_residuos',
                    data: {
                        id_bitacora_de_residuo: $("#editandoID").val(),
                        fecha_de_ingreso: $("#editandoFechaIngreso").val(),
                        nombre_quimico: $("#editandonombreQuimico").val(),
                        tipo_de_residuo: $("#editandoTiporesiduo").val(),
                        estado_fisico: $("#editandoEstadoFisico").val(),
                        fecha_de_ingreso_almacen: $("#editandofechaAlmacen").val(),
                        nombre_de_autorizacion_almacenaje_residuo: $("#editandoNombreResponsable").val(),
                        destino_final: $("#editandoDestino").val(),
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
// Read more about handling dismissals
                                        result.dismiss === Swal.DismissReason.timer
                                        ) {
                                }
                                window.location.href = 'bitacora_de_residuos.jsp?idlab=' + idlab;
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
                var aux1 = $("#insertarFechaIngreso").val();
                var aux2 = $("#insertarnombreQuimico").val();
                var aux3 = $("#insertarTiporesiduo").val();
                var aux4 = $("#insertarEstadoFisico").val();
                var aux5 = $("#insertarfechaAlmacen").val();
                var aux6 = $("#insertarNombreResponsable").val();
                var aux7 = $("#insertarDestino").val();

                if (aux1 != "" && aux2 != "" && aux3 != "" && aux4 != "" && aux5 != "" && aux6 != "" && aux7 != "") {
                    $.ajax({
                        url: localStorage.getItem("urlproyecto") + 'LaaServicio/ruta/servicioinsertar/insertarbitacora_de_residuos',
                        data: {
                            fecha_de_ingreso: $("#insertarFechaIngreso").val(),
                            nombre_quimico: $("#insertarnombreQuimico").val(),
                            tipo_de_residuo: $("#insertarTiporesiduo").val(),
                            estado_fisico: $("#insertarEstadoFisico").val(),
                            fecha_de_ingreso_almacen: $("#insertarfechaAlmacen").val(),
                            nombre_de_autorizacion_almacenaje_residuo: $("#insertarNombreResponsable").val(),
                            destino_final: $("#insertarDestino").val(),
                            id_laboratorio: idlab
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
                                    if (result.dismiss === Swal.DismissReason.timer) {
                                    }
                                    window.location.href = 'bitacora_de_residuos.jsp?idlab=' + idlab;
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
                        document.getElementById("insertarFechaIngreso").style.borderColor = "red";
                    } else {
                        document.getElementById("insertarFechaIngreso").style.borderColor = "#e4e7ea";
                    }
                    if ($.trim(aux2) === "") {
                        document.getElementById("insertarnombreQuimico").style.borderColor = "red";
                    } else {
                        document.getElementById("insertarnombreQuimico").style.borderColor = "#e4e7ea";
                    }
                    if ($.trim(aux3) === "") {
                        document.getElementById("insertarTiporesiduo").style.borderColor = "red";
                    } else {
                        document.getElementById("insertarTiporesiduo").style.borderColor = "#e4e7ea";
                    }
                    if ($.trim(aux4) === "") {
                        document.getElementById("insertarEstadoFisico").style.borderColor = "red";
                    } else {
                        document.getElementById("insertarEstadoFisico").style.borderColor = "#e4e7ea";
                    }
                    if ($.trim(aux5) === "") {
                        document.getElementById("insertarfechaAlmacen").style.borderColor = "red";
                    } else {
                        document.getElementById("insertarfechaAlmacen").style.borderColor = "#e4e7ea";
                    }
                    if ($.trim(aux6) === "") {
                        document.getElementById("insertarNombreResponsable").style.borderColor = "red";
                    } else {
                        document.getElementById("insertarNombreResponsable").style.borderColor = "#e4e7ea";
                    }
                    if ($.trim(aux7) === "") {
                        document.getElementById("insertarDestino").style.borderColor = "red";
                    } else {
                        document.getElementById("insertarDestino").style.borderColor = "#e4e7ea";
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
            function eliminarBitacoraResiduos(iddato) {

                Swal.fire({
                    title: '¿Esta seguro de eliminar el dato?',
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
                    url: localStorage.getItem("urlproyecto") + 'LaaServicio/ruta/servicioeliminar/eliminarbitacora_de_residuos',
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
// Read more about handling dismissals
                                        result.dismiss === Swal.DismissReason.timer
                                        ) {
                                }
                                window.location.href = 'bitacora_de_residuos.jsp?idlab=' + idlab;
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

