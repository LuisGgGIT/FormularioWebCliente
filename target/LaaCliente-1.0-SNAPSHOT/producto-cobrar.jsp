<%-- 
    Document   : producto-cobrar productos
    Author     : lgarcia
    vesion     : Beta 1.0
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
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="panel panel-default">
                                <center>
                                    <div class="panel-heading">Carrito de Compra</div>
                                </center>
                            </div>
                        </div>
                    </div>
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-sm-12">
                                <div class="white-box">
                                    <button style="float:right;" class="btn btn-info btn-outline" id="btncobrarproducto"><i class="icon-basket-loaded"></i>
                                        Agregar al Carrito
                                    </button>
                                    <button style="float:right;" class="btn btn-success btn-outline" id="btnfinalizarcompra"><i class="  icon-paypal"></i>
                                        Comprar Carrito
                                    </button>
                                    <button style="float:right;" class="btn btn-danger btn-outline" id="btncancelarcompra"><i class=" icon-trash"></i>
                                        Vaciar carrito
                                    </button>
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
                                                        PRECIO
                                                    </th>
                                                    <th>
                                                        UNIDADES
                                                    </th>
                                                    <th>
                                                        SUB TOTAL
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

        <%-- Modal para cobrar Producto --%>
        <div class="modal loadingModal" id="cobrarproductomodal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg " role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="exampleModalLabel1">COBRAR PRODUCTO</h4>
                    </div>
                    <div class="modal-body">
                        <form>
                            <div class="form-group">
                                <label for="inputnombre">Nombre</label>
                                <select class="form-control select2" id="listproducto" name="listproducto" required>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="inputprecio">Precio</label>
                                <input type="number" step="0.01" class="form-control" id="precioproducto" required>
                            </div>
                            <div class="form-group">
                                <label for="inputcantidad">Unidades</label>
                                <input type="number" class="form-control" id="unidadproducto" required>
                            </div>
                            <div class="form-group">
                                <label for="inputtotal">Total</label>
                                <input type="number" step="0.01" class="form-control" id="totalproducto" disabled="true">
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button id="cancelarcobrar" class="btn btn-inverse">Cancelar</button>
                        <button id="agregarproducto" class="btn btn-success">Agregar</button>
                    </div>
                </div>
            </div>
        </div>


        <%-- Modal para Finalizar Compra --%>
        <div class="modal loadingModal" id="finalizarcompramodal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"  aria-hidden="true">
            <div class="modal-dialog modal-lg " role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="exampleModalLabel1">FINALIZAR COMPRA</h4>
                    </div>
                    <div class="modal-body">
                        <form>
                            <div class="form-group">
                                <label for="inputtotal">Recibo</label>
                                <input type="number" step="0.01" class="form-control" id="reciboproducto" >
                            </div>
                            <div class="form-group">
                                <label for="inputtotal">Total a Cobrar</label>
                                <input type="number" step="0.01" class="form-control" id="cobrarproducto">
                            </div>
                            <div class="form-group">
                                <label for="inputtotal">Cambio a Devolver</label>
                                <input type="number" step="0.01" class="form-control" id="cambioproducto" disabled="true">
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button id="btn-nocobrar" class="btn btn-inverse">Cancelar Compra</button>
                        <button id="btn-cobrar"  class="btn btn-success" >Cobrar</button>
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

            /******* Inicio Funcion de carga Inicial *******/
            $(document).ready(function () {
                $(".select2").select2();
                /*Obtener datos almacenados*/
                var nombreuser = localStorage.getItem("nombre");
                var apellidop = localStorage.getItem("apellidop");
                var apellidom = localStorage.getItem("apellidom");
                let params = new URLSearchParams(location.search);
                idlab = params.get('idlab');

                document.getElementById("nombrecompleto").innerHTML = nombreuser + " " + apellidop + " " + apellidom;
                document.getElementById("nombredelusario").innerHTML = nombreuser;

                /******* Funcion para carga la lista de productos a cobrar *******/
                listaproducto();
                function listaproducto() {
                    $.ajax({
                        url: localStorage.getItem("urlproyecto") + 'LaaServicio/ruta/servicio/listacobrar',
                        type: 'GET',
                        dataType: 'json',
                        success: function (data) {
                            $("#listaproducto").empty();
                            var total = 0.0;
                            for (var ad in data) {
                                generartabla(data[ad].id_producto, ad, data[ad].nombre, data[ad].contenido, data[ad].precio, data[ad].unidad, data[ad].total);
                                total = parseFloat(total) + parseFloat(data[ad].total);
                            }

                            var text =
                                    '<tr>' +
                                    '<td>100</td>' +
                                    '<td></td>' +
                                    '<td></td>' +
                                    '<th> TOTAL COMPRA $ </th>' +
                                    '<th id="totalPagar">' + total + '</th>' +
                                    '<td></td>'
                            '</tr>' +
                                    $("#listaproducto").val();

                            $("#listaproducto").append(text);
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

                /******* Funcion para agregar datos a la tabla de productos a cobrar *******/
                function generartabla(id_cobrar, indice, nombre, contenido, precio, unidad, total) {
                    var text = '<tr id="' + id_cobrar + '">' +
                            '<td class="py-1">' + ++indice + ' </td>' +
                            '<td >' + nombre + '</td>' +
                            '<td>' + precio + '</td>' +
                            '<td>' + unidad + '</td>' +
                            '<td>' + total + '</td>' +
                            '<td style="text-align:center;" ><button class="btn btn-danger" onclick="eliminarCobro(' + id_cobrar + ')" ><i class="icon-trash"></i></button></td>' +
                            '</tr>';
                    $("#listaproducto").append(text);
                }

                /******* Funcion para buscar prodcutos dentro del modal COBRAR PRODUCTO *******/
                listabuscaproducto();
                function listabuscaproducto() {
                    $.ajax({
                        url: localStorage.getItem("urlproyecto") + 'LaaServicio/ruta/servicio/listaproducto',
                        type: 'GET',
                        dataType: 'json',
                        success: function (data) {
                            var select = $('#listproducto');
                            $("#precioproducto").val(0);
                            $("#unidadproducto").val(0);
                            $("#totalproducto").val(0);

                            // Recorre los datos y agrega opciones al select
                            for (var i = 0; i < data.length; i++) {
                                var producto = data[i];
                                var option = $("<option>").val(producto.id).text(producto.nombre);
                                // Almacena los datos adicionales del producto como atributos personalizados
                                option.data("descripcion", producto.descripcion);
                                option.data("precio", producto.precio);
                                if (i === 0) {
                                    select.append(new Option("Seleccione un producto", 0));
                                }
                                select.append(new Option(
                                        producto.nombre +
                                        (producto.descripcion !== null && producto.descripcion !== undefined && producto.descripcion !== "" ? (" - " + producto.descripcion + " - ") : ' - ') +
                                        producto.contenido,
                                        producto.precio
                                        ));


                                select.trigger('change.select2');
                            }

                            // Agrega un manejador de eventos para el cambio en el select
                            select.change(function () {
                                var precio = $('#listproducto').val();
                                $("#precioproducto").val(precio);
                                $("#unidadproducto").val(0);
                                $("#totalproducto").val(0);
                                if ($("#precioproducto").val() > 0 && $("#unidadproducto").val() > 0) {
                                    $('#totalproducto').val($('#precioproducto').val() * $('#unidadproducto').val());
                                }
                            });
                        },
                        error: function (jqXHR, status, error) {
                        },
                        complete: function (jqXHR, status) {
                            // Configura la tabla DataTable aquí si es necesario.
                        }
                    });
                }

            }); /******* Fin Funcion de carga Inicial *******/

            /******* Validacion si el precio del producto cambia de valor *******/
            $("#precioproducto").change(function () {
                if ($('#precioproducto').val() > 0.0 && $('#unidadproducto').val() > 0.0) {
                    $('#totalproducto').val($('#precioproducto').val() * $('#unidadproducto').val());
                }
            });

            /******* Validacion si la unidad del producto cambia de valor *******/
            $("#unidadproducto").change(function () {
                if ($('#precioproducto').val() > 0.0 && $('#unidadproducto').val() > 0.0) {
                    $('#totalproducto').val($('#precioproducto').val() * $('#unidadproducto').val());
                }
            });

            /******* Validacion para cobrar el producto abrir el modal *******/
            $("#btncobrarproducto").click(function () {
                $('#cobrarproductomodal').modal('show');
            });

            /******* Validacion para cancelar cobrar el producto cerrar el modal *******/
            $("#cancelarcobrar").click(function () {
                $('#cobrarproductomodal').modal('hide');
                $("#cobrarproductomodal").find("input,textarea,select").val("");
            });

            /******* Funcion para agregar productos a la compra *******/
            $("#agregarproducto").click(function () {
                $.ajax({
                    url: localStorage.getItem("urlproyecto") + 'LaaServicio/ruta/servicio/cobrarproducto',
                    data: {
                        nombre: $('#listproducto option:selected').text().toUpperCase(),
                        precio: $("#precioproducto").val(),
                        unidad: $("#unidadproducto").val(),
                        total: $("#totalproducto").val()
                    },
                    type: 'GET',
                    dataType: 'json',
                    success: function (data) {
                        if (data.validador) {
                            Swal.fire({
                                position: 'center',
                                icon: 'success',
                                title: 'Producto Agregado Correctamente',
                                showConfirmButton: false,
                                timer: 1500
                            }).then((result) => {
                                if (
                                        // Read more about handling dismissals
                                        result.dismiss === Swal.DismissReason.timer
                                        ) {
                                }
                                window.location.href = 'producto-cobrar.jsp';
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

            /******* Validacion si la unidad del producto cambia un solo digito *******/
            $("#unidadproducto").on("input", function () {
                var valor = $(this).val();
                if (valor.length >= 0) {
                    if ($("#precioproducto").val() >= 0 && $("#unidadproducto").val() >= 0) {
                        $('#totalproducto').val($('#precioproducto').val() * $('#unidadproducto').val());
                    }
                }
            });

            /******* Funcion para finalizar la compra Abrir Modal *******/
            $("#btnfinalizarcompra").click(function () {
                $('#finalizarcompramodal').modal('show');
                var totalPagar = $('#totalPagar').text();
                $('#cobrarproducto').val(totalPagar);
            });

            /******* Funcion para validar si el monto recibo cambia de valor *******/
            $("#reciboproducto").on("input", function () {
                var valor = $(this).val();
                if (valor.length >= 0) {
                    if ($("#reciboproducto").val() >= 0 && $('#cobrarproducto').val() >= 0) {
                        $('#cambioproducto').val($("#reciboproducto").val() - $('#cobrarproducto').val());
                    }
                }
            });

            /******* Funcion para validar si el monto Total a pagar cambia de valor *******/
            $("#cobrarproducto").on("input", function () {
                var valor = $(this).val();
                if (valor.length >= 0) {
                    if ($("#reciboproducto").val() >= 0 && $('#cobrarproducto').val() >= 0) {
                        $('#cambioproducto').val($("#reciboproducto").val() - $('#cobrarproducto').val());
                    }
                }
            });

            /******* Funcion de no cobrar la compra *******/
            $("#btn-nocobrar").click(function () {
                $('#finalizarcompramodal').modal('hide');
                $("#finalizarcompramodal").find("input,textarea,select").val("");
            });

            /******* Funcion eliminar el producto agregado a la compra *******/
            function eliminarCobro(iddato) {
                Swal.fire({
                    title: '¿Esta seguro de eliminar Producto?',
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

            /******* Funcion elimina producto agregado a la compra *******/
            function eliminando(iddato) {
                $.ajax({
                    url: localStorage.getItem("urlproyecto") + 'LaaServicio/ruta/servicio/eliminarcobro',
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
                                title: 'Se ha eliminado correctamente de la lista',
                                showConfirmButton: true
                            }).then((result) => {
                                if (result.dismiss === Swal.DismissReason.timer) {
                                }
                                window.location.href = 'producto-cobrar.jsp';
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

            /******* Funcion para cobrar la compra de los productos agregado *******/
            $("#btn-cobrar").click(function () {

                var listaProductos = [];
                // Obtener la tabla por su ID
                var tabla = document.getElementById("tablaProducto");
                // Obtener las filas de la tabla
                var filas = tabla.getElementsByTagName("tr");
                // Iterar a través de las filas, comenzando desde la segunda fila (índice 1)
                for (var i = 1; i < filas.length - 1; i++) {
                    var fila = filas[i];
                    var celdas = fila.getElementsByTagName("td");
                    // Crear un objeto JSON para cada fila
                    var producto = {
                        nombre: celdas[1] ? celdas[1].textContent : "",
                        precio: celdas[2] ? celdas[2].textContent : "",
                        unidad: celdas[3] ? celdas[3].textContent : "",
                        total: celdas[4] ? celdas[4].textContent : ""
                    };

                    // Agregar el objeto JSON a la lista de productos
                    listaProductos.push(producto);
                }
                $.ajax({
                    url: localStorage.getItem("urlproyecto") + 'LaaServicio/ruta/servicio/cobrarproductos', // URL de la solicitud
                    data: JSON.stringify(listaProductos), // Envía los datos como un parámetro de consulta
                    dataType: 'json',
                    type: 'POST', // Utiliza el método GET
                    contentType: 'application/json', // Especifica el tipo de contenido como JSON
                    success: function (data) {
                        if (data.validador) {
                            Swal.fire({
                                position: 'center',
                                icon: 'success',
                                title: 'Productos Cobrados Correctamente',
                                showConfirmButton: true
                            }).then((result) => {
                                window.location.href = 'producto-cobrar.jsp';
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
                        // Puedes agregar lógica adicional aquí si es necesario
                    }
                });
            });

            /******* Funcion para cancelar todos los productos agregados *******/
            $("#btncancelarcompra").click(function () {
                Swal.fire({
                    title: '¿Esta seguro de canelar la compra?',
                    text: "¡No podrás revertir esto!",
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Si, eliminar!'
                }).then((result) => {
                    if (result.isConfirmed) {
                        $.ajax({
                            url: localStorage.getItem("urlproyecto") + 'LaaServicio/ruta/servicio/eliminarcompra',
                            data: {
                            },
                            type: 'GET',
                            dataType: 'json',
                            success: function (data) {
                                if (data.validador) {
                                    Swal.fire({
                                        position: 'center',
                                        icon: 'success',
                                        title: 'Se ha eliminado correctamente la compra',
                                        showConfirmButton: true

                                    }).then((result) => {
                                        if (result.dismiss === Swal.DismissReason.timer) {
                                        }
                                        window.location.href = 'producto-cobrar.jsp';
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
                });
            });
        </script>
        <%@include file="Elementos/Session.jsp"%>
    </body>

</html>
