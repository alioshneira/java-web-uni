<%-- 
    Document   : adicionar
    Created on : 13/11/2016, 12:35:49 PM
    Author     : Alumno
--%>

<%@page import="uni.entity.LineaTO"%>
<%@page import="java.util.List"%>
<%@page import="uni.dao.LineaDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modificar Producto</title>
        <script src="jquery/jquery-3.4.1.min.js" type="text/javascript"></script>
        <%
            LineaDAO dao=new LineaDAO();
            List<LineaTO> lineas=dao.readAll();
        %>
    </head>
    <body>

        <form id="form1">
            <table border="1">
                <thead>
                    <tr>
                        <th colspan="2">Nuevo Producto</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Código</td>
                        <td><input type="text" name="txtcodigo" value="" id="txtcodigo" /></td>
                    </tr>
                    <tr>
                        <td>Descripción</td>
                        <td><input type="text" name="txtnombre" value="" id="txtnombre" /></td>
                    </tr>
                    <tr>
                        <td>IdLinea</td>
                        <td><select name="cbolinea"  id="cbolinea">
                                <%for (LineaTO pro : lineas) {%>
                                <option value="<%=pro.getIdlinea()%>"><%=pro.getNombre()%></option>
                                <%}%>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>Precio</td>
                        <td><input type="text" name="txtprecio" value="" id="txtprecio" /></td>
                    </tr>
                    <tr>
                        <td>Cantidad</td>
                        <td><input type="text" name="txtstock" value=""  id="txtstock"/></td>
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
                var nombreVar = $("#txtnombre").val();
                var lineaVar = $("#cbolinea").val();
                var precioVar = $("#txtprecio").val();
                var stockVar = $("#txtstock").val();
                $.post('Actualizar',
                {
                        idproducto:codVar,
                        nombre:nombreVar,
                        idlinea:lineaVar,
                        preciocompra:precioVar,
                        stock:stockVar
                },
                        function(responseText){
                        $("#divmensaje").html(responseText);
                        });
        });
    });
    </script>
</html>
