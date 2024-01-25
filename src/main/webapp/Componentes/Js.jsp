<%-- 
    Document   : Js
    Author     : celiflora Diaz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- sweetalert2-->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script src="plugins/bower_components/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap Core JavaScript -->
<script src="Elementos/bootstrap/dist/js/tether.min.js"></script>
<script src="Elementos/bootstrap/dist/js/bootstrap.min.js"></script>
<script src="plugins/bower_components/bootstrap-extension/js/bootstrap-extension.min.js"></script>
<!-- Menu Plugin JavaScript -->
<script src="plugins/bower_components/sidebar-nav/dist/sidebar-nav.min.js"></script>
<!--slimscroll JavaScript -->
<script src="Elementos/js/jquery.slimscroll.js"></script>
<!--Wave Effects -->
<script src="Elementos/js/waves.js"></script>
<!-- Custom Theme JavaScript -->
<script src="Elementos/js/custom.min.js"></script>
<!--Style Switcher -->
<script src="plugins/bower_components/styleswitcher/jQuery.style.switcher.js"></script>
<!--Morris JavaScript -->
<script src="plugins/bower_components/raphael/raphael-min.js"></script>
<script src="plugins/bower_components/morrisjs/morris.js"></script>
<!-- Sparkline chart JavaScript -->
<script src="plugins/bower_components/jquery-sparkline/jquery.sparkline.min.js"></script>

<!-- Custom Theme JavaScript -->
<script src="Elementos/js/dashboard1.js"></script>
<!-- Custom Theme JavaScript -->
<script src="Elementos/js/cbpFWTabs.js"></script>

<script src="plugins/bower_components/datatables/jquery.dataTables.min.js"></script>
<!-- start - This is for export functionality only -->
<script src="https://cdn.datatables.net/buttons/1.2.2/js/dataTables.buttons.min.js"></script>
<script src="https://cdn.datatables.net/buttons/1.2.2/js/buttons.flash.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/2.5.0/jszip.min.js"></script>
<script src="https://cdn.rawgit.com/bpampuch/pdfmake/0.1.18/build/pdfmake.min.js"></script>
<script src="https://cdn.rawgit.com/bpampuch/pdfmake/0.1.18/build/vfs_fonts.js"></script>
<script src="https://cdn.datatables.net/buttons/1.2.2/js/buttons.html5.min.js"></script>
<script src="https://cdn.datatables.net/buttons/1.2.2/js/buttons.print.min.js"></script>

<!-- Date Picker Plugin JavaScript -->
<script src="plugins/bower_components/bootstrap-datepicker/js/bootstrap-datepicker.min.js"></script>
<script src="plugins/bower_components/moment/moment.js"></script>
<!-- Clock Plugin JavaScript -->
<script src="plugins/bower_components/clockpicker/dist/jquery-clockpicker.min.js"></script>
<!-- Color Picker Plugin JavaScript -->
<script src="plugins/bower_components/jquery-asColorPicker-master/libs/jquery-asColor.js"></script>
<script src="plugins/bower_components/jquery-asColorPicker-master/libs/jquery-asGradient.js"></script>
<script src="plugins/bower_components/jquery-asColorPicker-master/dist/jquery-asColorPicker.min.js"></script>
<!-- Date Picker Plugin JavaScript -->
<script src="plugins/bower_components/bootstrap-datepicker/bootstrap-datepicker.min.js"></script>
<!-- Date range Plugin JavaScript -->
<script src="plugins/bower_components/timepicker/bootstrap-timepicker.min.js"></script>
<script src="plugins/bower_components/bootstrap-daterangepicker/daterangepicker.js"></script>

<script src="plugins/bower_components/custom-select/custom-select.min.js" type="text/javascript"></script>
<script src="plugins/bower_components/bootstrap-select/bootstrap-select.min.js" type="text/javascript"></script>
<script type="text/javascript" src="plugins/bower_components/multiselect/js/jquery.multi-select.js"></script>
    
<script>
    $(document).ready(function () {
        //manera local
        const url = "http://localhost:8081/";
        //manera remota
       // const url = "http://68.66.193.153:8080/"; /*Para servidor*/

        localStorage.setItem("urlproyecto", url);

        $('.mydatepicker').datepicker({
            format: "dd/mm/yyyy",
            language: "es",
            orientation: "bottom auto",
            autoclose: true
        });
        $.fn.datepicker.dates['es'] = {
            days: ['Domingo', 'Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado'],
            daysShort: ['Dom', 'Lun', 'Mar', 'Mié', 'Juv', 'Vie', 'Sáb'],
            daysMin: ['Do', 'Lu', 'Ma', 'Mi', 'Ju', 'Vi', 'Sá'],
            months: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'],
            monthsShort: ['Ene', 'Feb', 'Mar', 'Abr', 'May', 'Jun', 'Jul', 'Ago', 'Sep', 'Oct', 'Nov', 'Dic']
        };
        

        var tipo_usuario = localStorage.getItem("tipo_usuario");
        

        if (tipo_usuario == "AUXILIAR DEL ADMINISTRADOR") {
            $('#listaparausuarios').hide();
        }
    });
</script>