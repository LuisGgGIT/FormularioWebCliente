<%-- 
    Document   : usuario-editarperfil
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
                    </div>

                    <div class="row">
                        <div class="col-md-12">
                            <div class="panel panel-default">
                                <center>   <div class="panel-heading">Editar datos </div></center>
                            </div>
                        </div>
                        <div class="col-md-4 col-xs-12">
                            <div class="white-box">
                                <center>  
                                    <img src="plugins/images/perfil.png" style="  border-radius: 50%;" alt="img" width="200" height="200" >   
                                </center>
                            </div>
                        </div>
                        <div class="col-md-8 col-xs-12">
                            <div class="white-box">
                                <ul class="nav customtab nav-tabs" role="tablist">

                                    <li role="presentation" class="nav-item"><a href="usuario-perfil.jsp"><span class="visible-xs"><i class="fa fa-cog"></i></span> <span class="hidden-xs">Perfil</span></a></li>
                                    <li role="presentation" class="nav-item"><a href="#settings" class="nav-link active" aria-controls="messages" role="tab" data-toggle="tab" aria-expanded="true"><span class="visible-xs"><i class="fa fa-home"></i></span><span class="hidden-xs">Editar datos </span></a></li>
                                    <li role="presentation" class="nav-item"><a href="usuario-editarperfilpassword.jsp"><span class="visible-xs"><i class="fa fa-envelope-o"></i></span> <span class="hidden-xs">Editar contraseña</span></a></li>
                                </ul>
                                <div class="tab-content">
                                    <div class="tab-pane active"  id="settings">
                                        <form class="form-horizontal form-material">
                                            <div class="form-group">
                                                <label class="col-md-12">Nombre</label>
                                                <div class="col-md-12">
                                                    <input id="editarnombrepersonal" type="text" placeholder="Nombre" class="form-control form-control-line">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-md-12">Apellido paterno</label>
                                                <div class="col-md-12">
                                                    <input id="editarapellidoPpersonal" type="text" placeholder="Apellido paterno" class="form-control form-control-line">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-md-12">Apellido materno</label>
                                                <div class="col-md-12">
                                                    <input id="editarapellidoMpersonal" type="text" placeholder="Apellido materno" class="form-control form-control-line">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="example-email" class="col-md-12">Email</label>
                                                <div class="col-md-12">
                                                    <input id="editarcorreopersonal" type="email" placeholder="johnathan@admin.com" class="form-control form-control-line" name="example-email" id="example-email">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="col-sm-12">
                                                    <button id="btnactualizar" class="btn btn-success">Actualizar datos personales</button>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                    <div class="tab-pane" id="editpassword">
                                        <form class="form-horizontal form-material">
                                            <div class="form-group">
                                                <label class="col-md-12">Nueva contraseña</label>
                                                <div class="col-md-12">
                                                    <input type="password" value="password" class="form-control form-control-line">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-md-12">Confirmar contraseña</label>
                                                <div class="col-md-12">
                                                    <input type="password" value="password" class="form-control form-control-line">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="col-sm-12">
                                                    <button  class="btn btn-success">Actualizar contraseña</button>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /.row -->

                </div>

            </div>
            <%@include file="Elementos/Footer.jsp"%>
        </div>
        <%@include file="Componentes/Js.jsp"%>
        <script>
            var correoviejo = "";
            var idlab;
            $(document).ready(function () {

                /*Obtener datos almacenados*/
                var id_usuario = localStorage.getItem("id_usuario");
                var email = localStorage.getItem("email");
                var nombreuser = localStorage.getItem("nombre");
                var apellidop = localStorage.getItem("apellidop");
                var apellidom = localStorage.getItem("apellidom");

                document.getElementById("nombrecompleto").innerHTML = nombreuser + " " + apellidop + " " + apellidom;
                document.getElementById("nombredelusario").innerHTML = nombreuser;
                $("#editarnombrepersonal").val(nombreuser);
                $("#editarapellidoPpersonal").val(apellidop);
                $("#editarapellidoMpersonal").val(apellidom);
                $("#editarcorreopersonal").val(email);


                //Actualizar datos del usuario
                $("#btnactualizar").click(function () {
                    Comprobarexistemail(id_usuario);
                    return false;
                });

            });

            function Comprobarexistemail(id_usuario) {

                $.ajax({
                    url: localStorage.getItem("urlproyecto") + 'LaaServicio/ruta/servicio/comprobarexistemail',
                    data: {
                        idusuario: id_usuario,
                        email: $("#editarcorreopersonal").val()
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
                                    Actualizar(id_usuario);
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


            function Actualizar(id_usuario) {
                $.ajax({
                    url: localStorage.getItem("urlproyecto") + 'LaaServicio/ruta/servicio/editarusuario',
                    data: {
                        email: $("#editarcorreopersonal").val(),
                        nombre: $("#editarnombrepersonal").val().toUpperCase(),
                        apellidopaterno: $("#editarapellidoPpersonal").val().toUpperCase(),
                        apellidomaterno: $("#editarapellidoMpersonal").val().toUpperCase(),
                        idusuario: id_usuario
                    },
                    type: 'GET',
                    dataType: 'json',
                    success: function (data) {
                        if (data.validador) {

                            let timerInterval;
                            Swal.fire({
                                title: 'En proceso!',
                                timer: 1500,
                                onBeforeOpen: () => {
                                    Swal.showLoading();
                                },
                                onClose: () => {
                                    clearInterval(timerInterval);
                                }
                            }).then((result) => {
                                if (
                                        // Read more about handling dismissals
                                        result.dismiss === Swal.DismissReason.timer
                                        ) {
                                }
                                window.location.href = 'usuario-perfil.jsp';
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
