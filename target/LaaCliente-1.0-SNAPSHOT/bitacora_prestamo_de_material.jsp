<%-- 
    Document   : bitacora_prestamo_de_material
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
                                <center>   <div class="panel-heading">Bitacora prestamo de material</div></center>
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
                                        <table id="tablaPrestamoMaterial" class="display nowrap" cellspacing="0" width="100%">
                                            <thead>
                                                <tr>
                                                    <th>
                                                        N° 	
                                                    </th>
                                                    <th>
                                                        FECHA
                                                    </th>
                                                    <th>
                                                        NOMBRE COMPLETO
                                                    </th>
                                                    <th>
                                                        MATERIAL
                                                    </th>
                                                    <th>
                                                        TUTOR
                                                    </th>
                                                    <th>
                                                        OBSERVACIONES 
                                                    </th>
                                                    <th>
                                                        LABORATORIO SOLICITADO
                                                    </th>
                                                    <th>
                                                        EDITAR
                                                    </th>
                                                    <th>
                                                        ELIMINAR
                                                    </th>
                                                </tr>
                                            </thead>
                                            <tbody id="listaPrestamoMaterial">
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
                                    <input type="text" class="form-control" id="insertarfecha">
                                </div>
                                <div class="form-group">
                                    <label for="message-text" class="control-label">Nombre del usuario</label>
                                    <input type="text" class="form-control" id="insertarnombre">
                                </div>
                                <div class="form-group">
                                    <label for="recipient-name" class="control-label">Nombre del material</label>
                                    <input type="text" class="form-control" id="insertarmaterial">
                                </div>
                                <div class="form-group">
                                    <label for="recipient-name" class="control-label">Tutor o profesor</label>
                                    <input type="text" class="form-control" id="insertartutor">
                                </div>
                                <div class="form-group">
                                    <label for="recipient-name" class="control-label">Observaciones</label>
                                    <input type="text" class="form-control" id="insertarobservaciones">
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
                                    <input type="text" class="form-control" id="editandofecha">

                                </div>
                                <div class="form-group">
                                    <label for="message-text" class="control-label">Nombre del usuario</label>
                                    <input type="text" class="form-control" id="editandonombre">
                                </div>
                                <div class="form-group">
                                    <label for="recipient-name" class="control-label">Nombre del material</label>
                                    <input type="text" class="form-control" id="editandomaterial">
                                </div>
                                <div class="form-group">
                                    <label for="recipient-name" class="control-label">Tutor o profesor</label>
                                    <input type="text" class="form-control" id="editandotutor">
                                </div>
                                <div class="form-group">
                                    <label for="recipient-name" class="control-label">Observaciones</label>
                                    <input type="text" class="form-control" id="editandoobservaciones">
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
                    $('#editandofecha').datepicker({
                        format: "dd/mm/yyyy",
                        language: "es",
                        orientation: "bottom auto"
                    });
                    $('#insertarfecha').datepicker({
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

                    RecuperarPrestamoMaterial();
                    function RecuperarPrestamoMaterial() {
                        $.ajax({
                            url: localStorage.getItem("urlproyecto") + 'LaaServicio/ruta/servicioListas/lista_bitacora_prestamo_de_material',
                            data: {
                                idlaboratorio: idlab
                            },
                            type: 'GET',
                            dataType: 'json',
                            success: function (data) {
                                $("#listaPrestamoMaterial").empty();
                                for (var ad in data) {
                                    generartabla(data[ad].id_bitacora_de_prestamo, ad, data[ad].fecha, data[ad].nombre, data[ad].material, data[ad].tutor, data[ad].observaciones, data[ad].id_laboratorio);
                                }
                            },
                            error: function (jqXHR, status, error) {

                            },
                            complete: function (jqXHR, status) {

                                $("#tablaPrestamoMaterial").DataTable({
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

                    function generartabla(id_bitacora_de_prestamo, ad, fecha, nombre, material, tutor, observaciones, id_laboratorio) {
                        var nombrelaboratorio = document.getElementById('nombrelaboratorio').textContent;
                        var text = '<tr id="' + id_bitacora_de_prestamo + '">' +
                                '<td class="py-1">' + ++ad + ' </td>' +
                                '<td >' + fecha + '</td>' +
                                '<td>' + nombre + '</td>' +
                                '<td>' + material + '</td>' +
                                '<td>' + tutor + '</td>' +
                                '<td>' + observaciones + '</td>' +
                                '<td>' + nombrelaboratorio + '</td>' +
                                '<td style="text-align:center;" ><button  class="btn btn-success" onclick="editarBitacoraPrestamoMaterial(' + id_bitacora_de_prestamo + ')"><i class="fa fa-edit"></i></button></td>' +
                                '<td style="text-align:center;" ><button class="btn btn-danger" onclick="eliminarBitacoraPrestamoMaterial(' + id_bitacora_de_prestamo + ')" ><i class="icon-trash"></i></button></td>' +
                                '</tr>';
                        $("#listaPrestamoMaterial").append(text);
                    }
                });
                function editarBitacoraPrestamoMaterial(id_bitacora_de_prestamo) {
                    var nombrelaboratorio = document.getElementById('nombrelaboratorio').textContent;
                    $.ajax({
                        url: localStorage.getItem("urlproyecto") + 'LaaServicio/ruta/servicioBuscar/buscarbitacoraprestamomaterial',
                        data: {
                            id: id_bitacora_de_prestamo
                        },
                        type: 'GET',
                        dataType: 'json',
                        success: function (data) {
                            $("#editandoID").val(id_bitacora_de_prestamo);
                            $("#editandofecha").val(data.fecha);
                            $("#editandonombre").val(data.nombre);
                            $("#editandomaterial").val(data.material);
                            $("#editandotutor").val(data.tutor);
                            $("#editandoobservaciones").val(data.observaciones);
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
                        url: localStorage.getItem("urlproyecto") + 'LaaServicio/ruta/servicioeditar/editarbitacora_prestamo_de_material',
                        data: {
                            id_bitacora_de_prestamo: $("#editandoID").val(),
                            fecha: $("#editandofecha").val(),
                            nombre: $("#editandonombre").val(),
                            material: $("#editandomaterial").val(),
                            tutor: $("#editandotutor").val(),
                            observaciones: $("#editandoobservaciones").val(),
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
                                    window.location.href = 'bitacora_prestamo_de_material.jsp?idlab=' + idlab;
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
                    var aux1 = $("#insertarfecha").val();
                    var aux2 = $("#insertarnombre").val();
                    var aux3 = $("#insertarmaterial").val();
                    var aux4 = $("#insertartutor").val();

                    if (aux1 != "" && aux2 != "" && aux3 != "" && aux4 != "") {
                        $.ajax({
                            url: localStorage.getItem("urlproyecto") + 'LaaServicio/ruta/servicioinsertar/insertarbitacora_prestamo_de_material',
                            data: {
                                fecha: $("#insertarfecha").val(),
                                nombre: $("#insertarnombre").val(),
                                material: $("#insertarmaterial").val(),
                                tutor: $("#insertartutor").val(),
                                observaciones: $("#insertarobservaciones").val(),
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
                                        window.location.href = 'bitacora_prestamo_de_material.jsp?idlab=' + idlab;
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
                            document.getElementById("insertarfecha").style.borderColor = "red";
                        } else {
                            document.getElementById("insertarfecha").style.borderColor = "#e4e7ea";
                        }
                        if ($.trim(aux2) === "") {
                            document.getElementById("insertarnombre").style.borderColor = "red";
                        } else {
                            document.getElementById("insertarnombre").style.borderColor = "#e4e7ea";
                        }
                        if ($.trim(aux3) === "") {
                            document.getElementById("insertarmaterial").style.borderColor = "red";
                        } else {
                            document.getElementById("insertarmaterial").style.borderColor = "#e4e7ea";
                        }
                        if ($.trim(aux4) === "") {
                            document.getElementById("insertartutor").style.borderColor = "red";
                        } else {
                            document.getElementById("insertartutor").style.borderColor = "#e4e7ea";
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
                function eliminarBitacoraPrestamoMaterial(iddato) {

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
                        url: localStorage.getItem("urlproyecto") + 'LaaServicio/ruta/servicioeliminar/eliminarbitacora_prestamo_de_material',
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
                                    window.location.href = 'bitacora_prestamo_de_material.jsp?idlab=' + idlab;
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

