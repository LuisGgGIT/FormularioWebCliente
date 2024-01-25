<%-- 
    Document   : Header
    Created on : 21/12/2020, 10:52:31 AM
    Author     : celi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Navigation -->
<nav class="navbar navbar-default navbar-static-top m-b-0">
    <div class="navbar-header"> <a class="navbar-toggle hidden-sm hidden-md hidden-lg " href="javascript:void(0)" data-toggle="collapse" data-target=".navbar-collapse"><i class="ti-menu"></i></a>
        <div class="top-left-part"><a class="logo" href="home.jsp"><span class="hidden-xs"></span></a></div>
        <ul class="nav navbar-top-links navbar-left hidden-xs">
            <li><a href="javascript:void(0)" class="open-close hidden-xs waves-effect waves-light"><i class="icon-arrow-left-circle ti-menu"></i></a></li>
            <li><br>
                <b class="hidden-xs" style="color:white;">BIENVENIDOS A TIENDA NUBE</b> 
            </li>
        </ul>
        <ul class="nav navbar-top-links navbar-right pull-right">

            <!-- /.dropdown -->
            <li class="dropdown">
                <a class="dropdown-toggle profile-pic" data-toggle="dropdown" href="#"> <img src="plugins/images/perfil.png" alt="user-img" width="36" class="img-circle"><b class="hidden-xs" id="nombredelusario"></b> <i class="ti-settings"></i></a>
                <ul class="dropdown-menu dropdown-user animated flipInY">
                    <li><a href="usuario-perfil.jsp"><i class="ti-user"></i>  Mi perfil</a></li>
                    <li><a href="usuario-editarperfil.jsp"><i class="ti-settings"></i>  Editar perfil</a></li>
                    <li><a href="#"  id="btncerrasesion2"><i class="fa fa-power-off"></i> Cerrar sesión</a></li>
                </ul>
                <!-- /.dropdown-user -->
            </li>
            <!-- /.dropdown -->
        </ul>
    </div>

</nav>
<!-- Left navbar-header -->