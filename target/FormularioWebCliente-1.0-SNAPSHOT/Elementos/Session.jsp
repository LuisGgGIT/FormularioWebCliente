
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<script>
    $(document).ready(function () {
        
        if (localStorage.getItem("id_usuario") === null || localStorage.getItem("id_usuario") === undefined) {
            cerrarSesion();
        }
        
        function cerrarSesion() {
            localStorage.clear(); //Sirve para cerrar sesion
            window.location.href = 'index.jsp';
            return false;
        }

        $("#btncerrasesion").click(function () {
            localStorage.clear();//Sirve para cerrar sesion
            window.location.href = 'index.jsp';
            return false;
        });
        $("#btncerrasesion1").click(function () {
            localStorage.clear();//Sirve para cerrar sesion
            window.location.href = 'index.jsp';
            return false;
        });
        $("#btncerrasesion2").click(function () {
            localStorage.clear();//Sirve para cerrar sesion
            window.location.href = 'index.jsp';
            return false;
        });
    });
</script>