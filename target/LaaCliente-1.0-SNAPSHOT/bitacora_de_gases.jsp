<%-- 
    Document   : bitacora_de_gases
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
                    <div class="row bg-title" id="referencias">
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="panel panel-default">
                                <center>   <div class="panel-heading">Bitacoras de gases</div></center>
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
                                        <table id="tablaGases" class="display nowrap" cellspacing="0" width="100%">
                                            <thead>
                                                <tr>
                                                    <th>
                                                        N°
                                                    </th>
                                                    <th>
                                                        FECHA
                                                    </th>
                                                    <th>
                                                        NOMBRE DEL GAS
                                                    </th>
                                                    <th>
                                                        CANTIDAD DE CILINDROS 
                                                    </th>
                                                    <th>
                                                        LLENO O VACIO
                                                    </th>
                                                    <th>
                                                        VOLUMEN DEL CILINDRO
                                                    </th>
                                                    <th>
                                                        PRESION INICIAL
                                                    </th>
                                                    <th>
                                                        PRESION FINAL
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
                                            <tbody id="listaGases">
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
                                <label for="recipient-name" class="control-label">Fecha</label>
                                <input type="text" id="insertarFecha" class="form-control">
                            </div>
                            <div class="form-group">
                                <label for="message-text" class="control-label">Nombre del gas</label>
                                <input type="text" class="form-control" id="insertarnombreGas" required>
                            </div>
                            <div class="form-group">
                                <label for="recipient-name" class="control-label">Cantidad de cilindros</label>
                                <input type="number" class="form-control" id="insertarcantidad_de_cilindros" required>
                            </div>
                            <div class="form-group">
                                <label for="recipient-name" class="control-label">Seleccionar vacio o lleno</label>
                                <div class="col-sm-12">
                                    <select class="custom-select col-12" id="insertarlleno_Vacio" required>
                                        <option ></option>
                                        <option >Lleno</option>
                                        <option >Vacio</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="recipient-name" class="control-label">Volumen del cilindro</label>
                                <input type="number" class="form-control" id="insertarvolumen_del_cilindro" required>
                            </div>
                            <div class="form-group">
                                <label for="recipient-name" class="control-label">Presión inicial</label>
                                <input type="text" class="form-control" id="insertarpresion_inicial" required>
                            </div>
                            <div class="form-group">
                                <label for="recipient-name" class="control-label">Presión final</label>
                                <input type="text" class="form-control" id="insertarpresion_final" required>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-12">Laboratorio de </label>
                                <div class="col-10">
                                    <input class="form-control" type="text"  id="insertarLabIngresado" readonly>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button id="cancelarRegistro" class="btn btn-inverse cancelar">Cancelar</button>
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
                                <label for="recipient-name" class="control-label">Fecha</label>
                                <input type="text" id="editandoFecha" class="form-control">
                            </div>
                            <div class="form-group">
                                <label for="message-text" class="control-label">Nombre del gas</label>
                                <input type="text" class="form-control" id="editandonombreGas">
                            </div>
                            <div class="form-group">
                                <label for="recipient-name" class="control-label">Cantidad de cilindros</label>
                                <input type="number" class="form-control" id="editandocantidad_de_cilindros">
                            </div>
                            <div class="form-group">
                                <label for="recipient-name" class="control-label">Lleno</label>
                                <input type="text" class="form-control" id="editandoLleno">
                            </div>
                            <div class="form-group">
                                <label for="recipient-name" class="control-label">Vacio</label>
                                <input type="text" class="form-control" id="editandoVacio">
                            </div>
                            <div class="form-group">
                                <label for="recipient-name" class="control-label">Volumen del cilindro</label>
                                <input type="number" class="form-control" id="editandovolumen_del_cilindro">
                            </div>
                            <div class="form-group">
                                <label for="recipient-name" class="control-label">Presión inicial</label>
                                <input type="text" class="form-control" id="editandopresion_inicial">
                            </div>
                            <div class="form-group">
                                <label for="recipient-name" class="control-label">Presión final</label>
                                <input type="text" class="form-control" id="editandopresion_final">
                            </div>
                            <div class="form-group">
                                <label class="col-sm-12">Laboratorio de </label>
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
                                        <option>Química ambiental</option>
                                        <option >Sistemas de información geográfica</option>
                                    </select>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button id="cancelarActualizacion" class="btn btn-inverse cancelar">Cancelar</button>
                        <button id="btnactualizar"  class="btn btn-success" >Actualizar datos</button>
                    </div>
                </div>
            </div>
        </div>

        <%@include file="Componentes/Js.jsp"%>
        <script >

            var idlab;
            $(document).ready(function () {
                $('#insertarFecha').datepicker({
                    format: "dd/mm/yyyy",
                    language: "es",
                    orientation: "bottom auto"
                });
                $('#editandoFecha').datepicker({
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

                RecuperarListaGases();
                function RecuperarListaGases() {
                    $.ajax({
                        url: localStorage.getItem("urlproyecto") + 'LaaServicio/ruta/servicioListas/lista_bitacora_de_gases',
                        data: {
                            idlaboratorio: idlab
                        },
                        type: 'GET',
                        dataType: 'json',
                        success: function (data) {
                            $("#listaGases").empty();
                            for (var ad in data) {

                                generartabla(data[ad].id_bitacora_de_gas, ad, data[ad].fecha, data[ad].nombreGas, data[ad].cantidad_de_cilindros, data[ad].lleno_vacio, data[ad].volumen_del_cilindro, data[ad].presion_inicial, data[ad].presion_final, data[ad].id_laboratorio);
                            }
                        },
                        error: function (jqXHR, status, error) {

                        },
                        complete: function (jqXHR, status) {

                            $("#tablaGases").DataTable({
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

                function generartabla(id_bitacora_de_gas, ad, fecha, nombreGas, cantidad_de_cilindros, lleno_vacio, volumen_del_cilindro, presion_inicial, presion_final, id_laboratorio) {
                    var nombrelaboratorio = document.getElementById('nombrelaboratorio').textContent;
                    var text = '<tr id="' + id_bitacora_de_gas + '">' +
                            '<td class="py-1">' + ++ad + ' </td>' +
                            '<td >' + fecha + '</td>' +
                            '<td>' + nombreGas + '</td>' +
                            '<td>' + cantidad_de_cilindros + '</td>' +
                            '<td>' + lleno_vacio + '</td>' +
                            '<td>' + volumen_del_cilindro + '</td>' +
                            '<td>' + presion_inicial + '</td>' +
                            '<td>' + presion_final + '</td>' +
                            '<td>' + nombrelaboratorio + '</td>' +
                            '<td style="text-align:center;" ><button  class="btn btn-success" onclick="editarBitacoraGases(' + id_bitacora_de_gas + ')"><i class="fa fa-edit"></i></button></td>' +
                            '<td style="text-align:center;" ><button class="btn btn-danger" onclick="eliminarBitacoraGases(' + id_bitacora_de_gas + ')" ><i class="icon-trash"></i></button></td>' +
                            '</tr>';
                    $("#listaGases").append(text);
                }
            });


            function editarBitacoraGases(id_bitacora_de_gas) {
                var nombrelaboratorio = document.getElementById('nombrelaboratorio').textContent;
                $.ajax({
                    url: localStorage.getItem("urlproyecto") + 'LaaServicio/ruta/servicioBuscar/buscarbitacoragas',
                    data: {
                        id: id_bitacora_de_gas
                    },
                    type: 'GET',
                    dataType: 'json',
                    success: function (data) {
                        $("#editandoID").val(id_bitacora_de_gas);
                        $("#editandoFecha").val(data.fecha);
                        $("#editandonombreGas").val(data.nombreGas);
                        $("#editandocantidad_de_cilindros").val(data.cantidad_de_cilindros);
                        $("#editandoLleno").val(data.lleno);
                        $("#editandoVacio").val(data.vacio);
                        $("#editandovolumen_del_cilindro").val(data.volumen_del_cilindro);
                        $("#editandopresion_inicial").val(data.presion_inicial);
                        $("#editandopresion_final").val(data.presion_final);
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
                    title: '¿Desea realizar los cambios?',
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
                    url: localStorage.getItem("urlproyecto") + 'LaaServicio/ruta/servicioeditar/editarbitacora_de_gases',
                    data: {
                        id_bitacora_de_gas: $("#editandoID").val(),
                        fecha: $("#editandoFecha").val(),
                        nombreGas: $("#editandonombreGas").val(),
                        cantidad_de_cilindros: $("#editandocantidad_de_cilindros").val(),
                        lleno: $("#editandoLleno").val(),
                        vacio: $("#editandoVacio").val(),
                        volumen_del_cilindro: $("#editandovolumen_del_cilindro").val(),
                        presion_inicial: $("#editandopresion_inicial").val(),
                        presion_final: $("#editandopresion_final").val(),
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
                                window.location.href = 'bitacora_de_gases.jsp?idlab=' + idlab;
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
                var aux1 = $("#insertarFecha").val();
                var aux2 = $("#insertarnombreGas").val();
                var aux3 = $("#insertarcantidad_de_cilindros").val();
                var aux4 = $("#insertarlleno_Vacio").val();
                var aux5 = $("#insertarvolumen_del_cilindro").val();
                var aux6 = $("#insertarpresion_inicial").val();
                var aux7 = $("#insertarpresion_final").val();
//validamos campos
                if (aux1 != "" && aux2 != "" && aux3 != "" && aux4 != "" && aux5 != "" && aux6 != "" && aux7 != "") {
                    $.ajax({
                        url: localStorage.getItem("urlproyecto") + 'LaaServicio/ruta/servicioinsertar/insertarbitacora_de_gases',
                        data: {
                            fecha: $("#insertarFecha").val(),
                            nombreGas: $("#insertarnombreGas").val(),
                            cantidad_de_cilindros: $("#insertarcantidad_de_cilindros").val(),
                            lleno: $("#insertarlleno_Vacio").val(),
                            volumen_del_cilindro: $("#insertarvolumen_del_cilindro").val(),
                            presion_inicial: $("#insertarpresion_inicial").val(),
                            presion_final: $("#insertarpresion_final").val(),
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
                                    if (
                                            // Read more about handling dismissals
                                            result.dismiss === Swal.DismissReason.timer
                                            ) {
                                    }
                                    window.location.href = 'bitacora_de_gases.jsp?idlab=' + idlab;
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
                        document.getElementById("insertarFecha").style.borderColor = "red";
                    } else {
                        document.getElementById("insertarFecha").style.borderColor = "#e4e7ea";
                    }
                    if ($.trim(aux2) === "") {
                        document.getElementById("insertarnombreGas").style.borderColor = "red";
                    } else {
                        document.getElementById("insertarnombreGas").style.borderColor = "#e4e7ea";
                    }
                    if ($.trim(aux3) === "") {
                        document.getElementById("insertarcantidad_de_cilindros").style.borderColor = "red";
                    } else {
                        document.getElementById("insertarcantidad_de_cilindros").style.borderColor = "#e4e7ea";
                    }
                    if ($.trim(aux4) === "") {
                        document.getElementById("insertarlleno_Vacio").style.borderColor = "red";
                    } else {
                        document.getElementById("insertarlleno_Vacio").style.borderColor = "#e4e7ea";
                    }
                    if ($.trim(aux5) === "") {
                        document.getElementById("insertarvolumen_del_cilindro").style.borderColor = "red";
                    } else {
                        document.getElementById("insertarvolumen_del_cilindro").style.borderColor = "#e4e7ea";
                    }
                    if ($.trim(aux6) === "") {
                        document.getElementById("insertarpresion_inicial").style.borderColor = "red";
                    } else {
                        document.getElementById("insertarpresion_inicial").style.borderColor = "#e4e7ea";
                    }
                    if ($.trim(aux7) === "") {
                        document.getElementById("insertarpresion_final").style.borderColor = "red";
                    } else {
                        document.getElementById("insertarpresion_final").style.borderColor = "#e4e7ea";
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
            function eliminarBitacoraGases(iddato) {

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
                    url: localStorage.getItem("urlproyecto") + 'LaaServicio/ruta/servicioeliminar/eliminarbitacora_de_gases',
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
                                window.location.href = 'bitacora_de_gases.jsp?idlab=' + idlab;
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
