<%-- 
    Document   : usuario_perfil
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
                                <center>   <div class="panel-heading">Perfil de usuario</div></center>
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
                                    <li role="presentation" class="nav-item"><a href="#profile" class="nav-link active" aria-controls="profile" role="tab" data-toggle="tab" aria-expanded="true"><span class="visible-xs"><i class="fa fa-home"></i></span><span class="hidden-xs"> Perfil</span></a></li>
                                    <li role="presentation" class="nav-item"><a href="usuario-editarperfil.jsp" ><span class="visible-xs"><i class="fa fa-cog"></i></span> <span class="hidden-xs">Editar datos</span></a></li>
                                    <li role="presentation" class="nav-item"><a href="usuario-editarperfilpassword.jsp"><span class="visible-xs"><i class="fa fa-envelope-o"></i></span> <span class="hidden-xs">Editar contraseña</span></a></li>
                                </ul>
                                <div class="tab-content">
                                    <div class="tab-pane active" id="profile">
                                        <div class="row">
                                            <div class="col-md-3 col-xs-6 "> <strong>Nombre Completo</strong>
                                                <br><br>
                                                <p class="text-muted" id="datospersonalesNombre"></p>
                                            </div>
                                            <div class="col-md-3 col-xs-6"> 
                                                <br><br>
                                                <p class="text-muted" id="datospersonalesApellidop"></p>
                                            </div>
                                            <div class="col-md-3 col-xs-6 " >
                                                <br><br>
                                                <p class="text-muted" id="datospersonalesApellidom"></p>
                                            </div>
                                        </div>
                                        <hr>
                                        <div class="row">
                                            <div class="col-md-3 col-xs-6 "> <strong>Correo electronico</strong>
                                                <br><br>
                                                <p class="text-muted" id="datospersonalesCorreo"></p>
                                            </div>
                                        </div>
                                        <hr>
                                        <div class="row">
                                            <div class="col-md-3 col-xs-6"> <strong>Tipo usuario</strong>
                                                <br><br>
                                                <p class="text-muted" id="datospersonalesTipousuario"></p>
                                            </div>
                                        </div>
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
        <script >
            $(document).ready(function () {

                /*Obtener datos almacenados*/
                var id_usuario = localStorage.getItem("id_usuario");

                recuperardatospersonales();
                function recuperardatospersonales() {
                    $.ajax({
                        url: localStorage.getItem("urlproyecto") + 'LaaServicio/ruta/servicio/buscarusuario',
                        data: {
                            idusuario: id_usuario
                        },
                        type: 'GET',
                        dataType: 'json',
                        success: function (data) {
                            if (data.email === "USUARIO NO ENCONTRADO") {
                                localStorage.setItem("id_usuario", "-");
                                localStorage.setItem("nombre", "-");
                                localStorage.setItem("apellidop", "-");
                                localStorage.setItem("apellidom", "-");
                                localStorage.setItem("email", "-");
                                localStorage.setItem("contrasenia", "-");
                                localStorage.setItem("nivel", "-");

                                Swal.fire({
                                    type: 'error',
                                    title: 'Oops...',
                                    text: 'Usuario no se ha encontrado'
                                });
                                window.location.href = 'index.jsp';
                            } else {
                                localStorage.setItem("id_usuario", data.id_usuario);
                                localStorage.setItem("nombre", data.nombre);
                                localStorage.setItem("apellidop", data.apellidop);
                                localStorage.setItem("apellidom", data.apellidom);
                                localStorage.setItem("email", data.email);
                                localStorage.setItem("contrasenia", data.contrasenia);
                                localStorage.setItem("tipo_usuario", data.tipo_usuario);

                                var email = localStorage.getItem("email");
                                var nombreuser = localStorage.getItem("nombre");
                                var apellidop = localStorage.getItem("apellidop");
                                var apellidom = localStorage.getItem("apellidom");
                                var tipousuario = localStorage.getItem("tipo_usuario");

                                document.getElementById("nombrecompleto").innerHTML = nombreuser + " " + apellidop + " " + apellidom;
                                document.getElementById("nombredelusario").innerHTML = nombreuser;
                                document.getElementById("datospersonalesNombre").innerHTML = nombreuser;
                                document.getElementById("datospersonalesApellidop").innerHTML = apellidop;
                                document.getElementById("datospersonalesApellidom").innerHTML = apellidom;
                                document.getElementById("datospersonalesCorreo").innerHTML = email;
                                document.getElementById("datospersonalesTipousuario").innerHTML = tipousuario;


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

        </script>
        <%@include file="Elementos/Session.jsp"%>
    </body>

</html>
