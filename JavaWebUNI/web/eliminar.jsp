<%-- 
    Document   : adicionar
    Created on : 13/11/2016, 12:35:49 PM
    Author     : Alumno
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Eliminar Producto</title>
        <script src="jquery/jquery-3.4.1.min.js" type="text/javascript"></script>
    </head>
    <body>
        
        <form id="form1">
            <table border="1">
                <thead>
                    <tr>
                        <th colspan="2">Eliminar Producto</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Código</td>
                        <td><input type="text" name="txtcodigo" value="" id="txtcodigo" /></td>
                    </tr>
                    <tr>
                        <td>Descripción</td>
                        <td><input type="text" name="txtnombre" value="" /></td>
                    </tr>
                    <tr>
                        <td>IdLinea</td>
                        <td><input type="text" name="txtid" value="" /></td>
                    </tr>
                    <tr>
                        <td>Precio</td>
                        <td><input type="text" name="txtprecio" value="" /></td>
                    </tr>
                    <tr>
                        <td>Cantidad</td>
                        <td><input type="text" name="txtstock" value="" /></td>
                    </tr>
                    <tr>
                        <td colspan="2"><input type="button" value="Eliminar" id="btneliminar" /></td>
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

        $("#btneliminar").click(function(){
                var codVar = $("#txtcodigo").val();
                $.post('Eliminar',
                {
                        idproducto:codVar
                },
                        function(responseText){
                        $("#divmensaje").html(responseText);
                        });
        });
    });
    </script>
</html>
