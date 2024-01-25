<%-- 
    Document   : Navs
    Author     : celi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="navbar-default sidebar" role="navigation">
    <div class="sidebar-nav navbar-collapse slimscrollsidebar">
        <ul class="nav" id="side-menu">
            <li class="sidebar-search hidden-sm hidden-md hidden-lg">
                <!-- input-group -->
                <div class="input-group custom-search-form">
                    <input type="text" class="form-control" placeholder="Search..."> <span class="input-group-btn">
                        <button class="btn btn-default" type="button"> <i class="fa fa-search"></i> </button>
                    </span> </div>
                <!-- /input-group -->
            </li>
            <li class="user-pro">
                <a href="#" class="waves-effect"><img src="plugins/images/perfil.png" alt="user-img" class="img-circle"> <span class="hide-menu" id="nombrecompleto" ><span class="fa arrow"></span></span>
                </a>
                <ul class="nav nav-second-level">
                    <li><a href="usuario-perfil.jsp"><i class="ti-user"></i> Mi perfil</a></li>
                    <li><a href="usuario-editarperfil.jsp"><i class="ti-settings"></i> Editar perfil</a></li>
                    <li><a href="#"  id="btncerrasesion1"><i class="fa fa-power-off"></i> Cerrar sesión</a></li>
                </ul>
            </li><!--collapse in-->
            <li class="nav-small-cap m-t-10">---MENU PRINCIPAL</li> 
            <li><a class="waves-effect" href="producto-cobrar.jsp" ><i data-icon="F" class="linea-icon linea-ecommerce fa-fw"></i> <span class="hide-menu">COBRAR</span> </a></li>
            <li><a class="waves-effect" href="producto-lista.jsp" ><i data-icon="F" class="linea-icon linea-software fa-fw"></i> <span class="hide-menu">PRODUCTOS</span> </a></li>
            <li><a class="waves-effect" href="producto-venta.jsp" ><i data-icon="F" class="linea-icon linea-software fa-fw"></i> <span class="hide-menu">VENTAS</span> </a></li>
            <li><a class="waves-effect" href="usuario-lista.jsp" ><i data-icon="" class="linea-icon linea-basic fa-fw"></i> <span class="hide-menu">LISTA DE USUARIOS</span> </a></li>
            <li><a class="waves-effect" href="#"  id="btncerrasesion"><i class="icon-logout fa-fw"></i> <span class="hide-menu">Cerrar sesion</span> </a></li>
            <!--  <li class="nav-small-cap">--- Soporte tecnico</li>
            <li><a href="documentation.html" class="waves-effect"><i class="fa fa-circle-o text-danger"></i> <span class="hide-menu">Documentation</span></a></li>
            <li><a href="gallery.html" class="waves-effect"><i class="fa fa-circle-o text-info"></i> <span class="hide-menu">Gallery</span></a></li>
            <li><a href="faq.html" class="waves-effect"><i class="fa fa-circle-o text-success"></i> <span class="hide-menu">Faqs</span></a></li>-->
        </ul>
    </div>
</div>

