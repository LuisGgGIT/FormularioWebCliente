<%-- 
    Document   : home
    Author     : celi Diaz
    vesion     : 1.0
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">
        <%@include file="Componentes/Css.jsp"%>
    </head>

    <body>
        <!-- Preloader -->
        <div class="preloader">
            <div class="cssload-speeding-wheel"></div>
        </div>
    <section id="wrapper" class="login-register">
        <div class="login-box login-sidebar">
            <div class="white-box">
                <form class="form-horizontal form-material" >
                    <h1 class="text-center db">
                        <br>BIENVENIDO
                        <br>TIENDA NUBE
                    </h1>
                    <div class="form-group m-t-40">
                        <div class="col-xs-12">
                            <h5>Usuario</h5>
                            <input id="email" class="form-control" type="text" required="" placeholder="Usuario">
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-xs-12">
                            <h5>Contraseña</h5>
                            <input id="password" class="form-control" type="password" required="" placeholder="Contraseña">
                        </div>
                    </div>    
                    <br><br>
                    <div class="form-group text-center m-t-20">
                        <div class="col-xs-12">
                            <button id="btniniciarsesion" class="btn btn-success btn-lg btn-block text-uppercase waves-effect waves-light" type="submit">Iniciar sesión</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </section>
    <script src="Js/md5.js" type="text/javascript"></script>
    <%@include file="Componentes/Js.jsp"%>
    <script>
        $(document).ready(function () {

            $("#btniniciarsesion").click(function () {
                login();
                return false;
            });
            function login() {
                $.ajax({
                    url: localStorage.getItem("urlproyecto") + 'LaaServicio/ruta/servicio/recuperarusuarioemail',
                    data: {
                        email: $("#email").val().toUpperCase(),
                        password: md5($("#password").val())
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
                            localStorage.setItem("tipo_usuario", "-");

                            Swal.fire({
                                type: 'error',
                                title: 'Oops...',
                                text: 'Usuario y contraseña incorrectos!'
                            });
                        } else {
                            localStorage.setItem("id_usuario", data.id_usuario);
                            localStorage.setItem("nombre", data.nombre);
                            localStorage.setItem("apellidop", data.apellidop);
                            localStorage.setItem("apellidom", data.apellidom);
                            localStorage.setItem("email", data.email);
                            localStorage.setItem("contrasenia", data.contrasenia);
                            localStorage.setItem("tipo_usuario", data.tipo_usuario);

                            $("#btniniciarsesion").load("Loginuser", {
                                actividad: 'Inicio de sesion',
                                id_usuario: data.id_usuario,
                                email: data.email,
                                nombre: data.nombre,
                                apellidop: data.apellidop,
                                apellidom: data.apellidom,
                                tipo_usuario: data.tipo_usuario,
                                seccion: 'actividadLogin'
                            });

                            window.location.href = 'home.jsp';
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
</body>

</html>
