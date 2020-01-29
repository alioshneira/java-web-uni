<%-- 
    Document   : adicionar
    Created on : 13/11/2016, 12:35:49 PM
    Author     : Alumno
--%>

<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modificar Proveedor</title>
        <script src="jquery/jquery-3.4.1.min.js" type="text/javascript"></script>
        
    </head>
    <body>

        <form id="form1">
            <table border="1">
                <thead>
                    <tr>
                        <th colspan="2">Nuevo Proveedor</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Código</td>
                        <td><input type="text" name="txtcodigo" value="" id="txtcodigo" /></td>
                    </tr>
                    <tr>
                        <td>Razón Social</td>
                        <td><input type="text" name="txtrazonsocial" value="" id="txtrazonsocial" /></td>
                    </tr>
                    <tr>
                        <td>Dirección</td>
                        <td><input type="text" name="txtdireccion" value="" id="txtdireccion" /></td></td>
                    </tr>
                    <tr>
                        <td>RUC</td>
                        <td><input type="text" name="txtruc" value="" id="txtruc" /></td>
                    </tr>
                    <tr>
                        <td>Teléfono</td>
                        <td><input type="text" name="txttelefono" value=""  id="txttelefono"/></td>
                    </tr>
                    <tr>
                        <td colspan="2"><input type="button" value="Grabar" id="btngrabar" /></td>
                    </tr>
                </tbody>
            </table>

        </form>
        <div id="divmensaje">
            <p style="color: green;">${requestScope.mensaje}</p>
            <p style="color: red;">${requestScope.error}</p>
        </div>
    </body>
    
    <script type="text/javascript">
        $().ready(function(){

        $("#btngrabar").click(function(){
                var codVar = $("#txtcodigo").val();
                var razonsocialVar = $("#txtrazonsocial").val();
                var direccionVar = $("#txtdireccion").val();
                var rucVar = $("#txtruc").val();
                var telefonoVar = $("#txttelefono").val();
                $.post('ActualizarProv',
                {
                        idproveedor:codVar,
                        razonsocial:razonsocialVar,
                        direccion: direccionVar,
                        ruc: rucVar,
                        telefono: telefonoVar
                },
                        function(responseText){
                        $("#divmensaje").html(responseText);
                        });
        });
    });
    </script>
</html>
