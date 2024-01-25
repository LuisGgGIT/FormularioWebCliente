<%-- 
    Document   : inventario_de_reactivos
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
                                <center>   <div class="panel-heading">Inventario de reactivos</div></center>
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
                                        <table id="tablaReactivos" class="display nowrap" cellspacing="0" width="100%">
                                            <thead>
                                                <tr>
                                                    <th>
                                                        N°
                                                    </th>
                                                    <th>
                                                        NOMBRE DE LA SUSTANCIA
                                                    </th>
                                                    <th>
                                                        FÓRMULA 
                                                    </th>
                                                    <th>
                                                        ORGANICO 
                                                    </th>
                                                    <th>
                                                        RIESGO A LA SALUD
                                                    </th>
                                                    <th>
                                                        INFLAMABILIDAD
                                                    </th>
                                                    <th>
                                                        REACTIVIDAD
                                                    </th>
                                                    <th>
                                                        PELIGRO AL CONTACTO
                                                    </th>
                                                    <th>
                                                        COLOR DE ALMACENAJE
                                                    </th>
                                                    <th>
                                                        CARACTERISTICAS
                                                    </th>
                                                    <th>
                                                        CÓDIGO/CAS
                                                    </th>
                                                    <th>
                                                        CANTIDAD
                                                    </th>
                                                    <th>
                                                        UNIDAD
                                                    </th>
                                                    <th>
                                                        ESTADO
                                                    </th>
                                                    <th>
                                                        CONCENTRACION
                                                    </th>
                                                    <th>
                                                        FECHA DE CADUCIDAD
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
                                            <tbody id="listaReactivos">
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
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="message-text" class="control-label">Nombre de la sustancia</label>
                                    <input type="text" class="form-control" id="insertarnombre">
                                </div>
                                <div class="form-group">
                                    <label for="recipient-name" class="control-label">Fórmula</label>
                                    <input type="text" class="form-control" id="insertarformula">
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-12">Orgánico o inorgánico</label>
                                    <div class="col-sm-12">
                                        <select class="custom-select col-12" id="insertarinorganicoorganico">
                                            <option></option>
                                            <option>Orgánico</option>
                                            <option>Inorgánico</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="recipient-name" class="control-label">Riesgo a la salud</label>
                                    <input type="number" class="form-control" id="insertarriesgo">
                                </div>                                
                                <div class="form-group">
                                    <label for="recipient-name" class="control-label">Inflamabilidad</label>
                                    <input type="number" class="form-control" id="insertarinflamabilidad">
                                </div>
                                <div class="form-group">
                                    <label for="recipient-name" class="control-label">Reactividad</label>
                                    <input type="number" class="form-control" id="insertarreactividad">
                                </div>
                                <div class="form-group">
                                    <label for="recipient-name" class="control-label">Peligro al contacto</label>
                                    <input type="number" class="form-control" id="insertarpeligro">
                                </div>
                                <div class="form-group">
                                    <label for="recipient-name" class="control-label">Color de almacenaje</label>
                                    <input type="text" class="form-control" id="insertarcolor">
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="message-text" class="control-label">Característica</label>
                                    <input type="text" class="form-control" id="insertarcaracteristica">
                                </div>
                                <div class="form-group">
                                    <label for="recipient-name" class="control-label">Código/CAS</label>
                                    <input type="text" class="form-control" id="insertarcodigo">
                                </div>
                                <div class="form-group">
                                    <label for="recipient-name" class="control-label">Cantidad</label>
                                    <input type="text" class="form-control" id="insertarcantidad">
                                </div>
                                <div class="form-group">
                                    <label for="recipient-name" class="control-label">Unidades</label>
                                    <input type="number" class="form-control" id="insertarunidades">
                                </div>
                                <div class="form-group">
                                    <label for="recipient-name" class="control-label">Estado</label>
                                    <div class="col-sm-12">
                                        <select class="custom-select col-12" id="insertarestado">
                                            <option></option>
                                            <option>Cerrado</option>
                                            <option>Abierto</option>
                                        </select>
                                    </div>
                                </div>  
                                <div class="form-group">
                                    <label for="recipient-name" class="control-label">Concentracion</label>
                                    <input type="text" class="form-control" id="insertarconcentracion">
                                </div>
                                <div class="form-group">
                                    <label for="recipient-name" class="control-label">Fecha</label>
                                    <input type="text" id="insertarfechacaducidad" class="form-control">
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
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="message-text" class="control-label">Nombre de la sustancia</label>
                                <input type="text" class="form-control" id="editandonumeronombre">
                            </div>
                            <div class="form-group">
                                <label for="recipient-name" class="control-label">Fórmula</label>
                                <input type="text" class="form-control" id="editandoformula">
                            </div>
                            <div class="form-group">
                                <label class="col-sm-12">Orgánico o inorgánico</label>
                                <div class="col-sm-12">
                                    <select class="custom-select col-12" id="editandoinorganicoorganico">
                                        <option></option>
                                        <option>Orgánico</option>
                                        <option>Inorgánico</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="recipient-name" class="control-label">Riesgo a la salud</label>
                                <input type="number" class="form-control" id="editandoriesgo">
                            </div>                                
                            <div class="form-group">
                                <label for="recipient-name" class="control-label">Inflamabilidad</label>
                                <input type="number" class="form-control" id="editandoinflamabilidad">
                            </div>
                            <div class="form-group">
                                <label for="recipient-name" class="control-label">Reactividad</label>
                                <input type="number" class="form-control" id="editandoreactividad">
                            </div>
                            <div class="form-group">
                                <label for="recipient-name" class="control-label">Peligro al contacto</label>
                                <input type="number" class="form-control" id="editandopeligro">
                            </div>
                            <div class="form-group">
                                <label for="recipient-name" class="control-label">Color de almacenaje</label>
                                <input type="text" class="form-control" id="editandocolor">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="message-text" class="control-label">Característica</label>
                                <input type="text" class="form-control" id="editandocaracteristica">
                            </div>
                            <div class="form-group">
                                <label for="recipient-name" class="control-label">Código/CAS</label>
                                <input type="text" class="form-control" id="editandocodigo">
                            </div>
                            <div class="form-group">
                                <label for="recipient-name" class="control-label">Cantidad</label>
                                <input type="text" class="form-control" id="editandocantidad">
                            </div>
                            <div class="form-group">
                                <label for="recipient-name" class="control-label">Unidades</label>
                                <input type="number" class="form-control" id="editandounidades">
                            </div>
                            <div class="form-group">
                                <label for="recipient-name" class="control-label">Estado</label>
                                <div class="col-sm-12">
                                    <select class="custom-select col-12" id="editandoestado">
                                        <option></option>
                                        <option>Cerrado</option>
                                        <option>Abierto</option>
                                    </select>
                                </div>
                            </div> 
                            <div class="form-group">
                                <label for="recipient-name" class="control-label">Concetracion</label>
                                <input type="text" class="form-control" id="editandoconcentracion">
                            </div>
                            <div class="form-group">
                                <label for="recipient-name" class="control-label">Fecha de caducidad</label>
                                <input type="text" id="editandofechacaducidad" class="form-control">
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
                $('#insertarfechacaducidad').datepicker({
                    format: "dd/mm/yyyy",
                    language: "es",
                    orientation: "bottom auto"
                });
                $('#editandofechacaducidad').datepicker({
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

            RecuperarEquipos();
            function RecuperarEquipos() {
                $.ajax({
                    url: localStorage.getItem("urlproyecto") + 'LaaServicio/ruta/servicioListas/lista_inventario_de_reactivos',
                    data: {
                        idlaboratorio: idlab
                    },
                    type: 'GET',
                    dataType: 'json',
                    success: function (data) {
                        $("#listaReactivos").empty();
                        for (var ad in data) {
                            generartabla(data[ad].id_inventario_de_reactivos, ad, data[ad].nombre_de_la_sustancia, data[ad].formula, data[ad].inorganico_organico, data[ad].riesgo_salud, data[ad].inflamabilidad, data[ad].reactividad, data[ad].peligro_al_contacto, data[ad].color_de_almacenaje, data[ad].caracteristicas, data[ad].codigo_cas, data[ad].cantidad, data[ad].unidades, data[ad].estado, data[ad].fecha_de_caducidad, data[ad].concentracion, data[ad].id_laboratorio);
                        }
                    },
                    error: function (jqXHR, status, error) {

                    },
                    complete: function (jqXHR, status) {

                        $("#tablaReactivos").DataTable({
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

            function generartabla(id_inventario_de_reactivos, ad, nombre_de_la_sustancia, formula, inorganico_organico, riesgo_salud, inflamabilidad, reactividad, peligro_al_contacto, color_de_almacenaje, caracteristicas, codigo_cas, cantidad, unidades, estado, fecha_de_caducidad, concentracion, id_laboratorio) {
                var nombrelaboratorio = document.getElementById('nombrelaboratorio').textContent;
                var text = '<tr id="' + id_inventario_de_reactivos + '">' +
                        '<td class="py-1">' + ++ad + ' </td>' +
                        '<td >' + nombre_de_la_sustancia + '</td>' +
                        '<td>' + formula + '</td>' +
                        '<td>' + inorganico_organico + '</td>' +
                        '<td>' + riesgo_salud + '</td>' +
                        '<td>' + inflamabilidad + '</td>' +
                        '<td>' + reactividad + '</td>' +
                        '<td>' + peligro_al_contacto + '</td>' +
                        '<td>' + caracteristicas + '</td>' +
                        '<td>' + color_de_almacenaje + '</td>' +
                        '<td>' + codigo_cas + '</td>' +
                        '<td>' + cantidad + '</td>' +
                        '<td>' + unidades + '</td>' +
                        '<td>' + estado + '</td>' +
                        '<td>' + concentracion + '</td>' +
                        '<td>' + fecha_de_caducidad + '</td>' +
                        '<td>' + nombrelaboratorio + '</td>' +
                        '<td style="text-align:center;" ><button  class="btn btn-success" onclick="editarInventarioReactivos(' + id_inventario_de_reactivos + ')"><i class="fa fa-edit"></i></button></td>' +
                        '<td style="text-align:center;" ><button class="btn btn-danger" onclick="eliminarInventarioReactivos(' + id_inventario_de_reactivos + ')" ><i class="icon-trash"></i></button></td>' +
                        '</tr>';
                $("#listaReactivos").append(text);
            }
        });

        function editarInventarioReactivos(id_inventario_de_reactivos) {
            var nombrelaboratorio = document.getElementById('nombrelaboratorio').textContent;
            $.ajax({
                url: localStorage.getItem("urlproyecto") + 'LaaServicio/ruta/servicioBuscar/buscarinventarioreactivos',
                data: {
                    id: id_inventario_de_reactivos
                },
                type: 'GET',
                dataType: 'json',
                success: function (data) {
                    $("#editandoID").val(id_inventario_de_reactivos);
                    $("#editandonumeronombre").val(data.nombre_de_la_sustancia);
                    $("#editandoformula").val(data.formula);
                    $("#editandoinorganicoorganico").val(data.inorganico_organico);
                    $("#editandoriesgo").val(data.riesgo_salud);
                    $("#editandoinflamabilidad").val(data.inflamabilidad);
                    $("#editandoreactividad").val(data.reactividad);
                    $("#editandopeligro").val(data.peligro_al_contacto);
                    $("#editandocolor").val(data.color_de_almacenaje);
                    $("#editandocaracteristica").val(data.caracteristicas);
                    $("#editandocodigo").val(data.codigo_cas);
                    $("#editandocantidad").val(data.cantidad);
                    $("#editandounidades").val(data.unidades);
                    $("#editandoestado").val(data.estado);
                    $("#editandofechacaducidad").val(data.fecha_de_caducidad);
                    $("#editandoconcentracion").val(data.concentracion);
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
                url: localStorage.getItem("urlproyecto") + 'LaaServicio/ruta/servicioeditar/editarinventario_de_reactivos',
                data: {
                    id_inventario_de_reactivos: $("#editandoID").val(),
                    nombre_de_la_sustancia: $("#editandonumeronombre").val(),
                    formula: $("#editandoformula").val(),
                    inorganico_organico: $("#editandoinorganicoorganico").val(),
                    riesgo_salud: $("#editandoriesgo").val(),
                    inflamabilidad: $("#editandoinflamabilidad").val(),
                    reactividad: $("#editandoreactividad").val(),
                    peligro_al_contacto: $("#editandopeligro").val(),
                    color_de_almacenaje: $("#editandocolor").val(),
                    caracteristicas: $("#editandocaracteristica").val(),
                    codigo_cas: $("#editandocodigo").val(),
                    cantidad: $("#editandocantidad").val(),
                    unidades: $("#editandounidades").val(),
                    estado: $("#editandoestado").val(),
                    fecha_de_caducidad: $("#editandofechacaducidad").val(),
                    concentracion: $("#editandoconcentracion").val(),
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
                            window.location.href = 'inventario_de_reactivos.jsp?idlab=' + idlab;
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
            var aux1 = $("#insertarnombre").val();

            if (aux1 != "") {

                $.ajax({
                    url: localStorage.getItem("urlproyecto") + 'LaaServicio/ruta/servicioinsertar/insertarinventario_de_reactivos',
                    data: {
                        nombre_de_la_sustancia: $("#insertarnombre").val(),
                        formula: $("#insertarformula").val(),
                        inorganico_organico: $("#insertarinorganicoorganico").val(),
                        riesgo_salud: $("#insertarriesgo").val(),
                        inflamabilidad: $("#insertarinflamabilidad").val(),
                        reactividad: $("#insertarreactividad").val(),
                        peligro_al_contacto: $("#insertarpeligro").val(),
                        color_de_almacenaje: $("#insertarcolor").val(),
                        caracteristicas: $("#insertarcaracteristica").val(),
                        codigo_cas: $("#insertarcodigo").val(),
                        cantidad: $("#insertarcantidad").val(),
                        unidades: $("#insertarunidades").val(),
                        estado: $("#insertarestado").val(),
                        fecha_de_caducidad: $("#insertarfechacaducidad").val(),
                        concentracion: $("#insertarconcentracion").val(),
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
                                window.location.href = 'inventario_de_reactivos.jsp?idlab=' + idlab;
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
        function eliminarInventarioReactivos(iddato) {
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
                url: localStorage.getItem("urlproyecto") + 'LaaServicio/ruta/servicioeliminar/eliminarinventario_de_reactivos',
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
                            window.location.href = 'inventario_de_reactivos.jsp?idlab=' + idlab;
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



