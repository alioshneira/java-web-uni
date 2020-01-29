
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Lista Productos</title>
        <script src="jquery/jquery-3.4.1.min.js" type="text/javascript"></script>
    </head>
    <body >
        <h2>Lista de Productos</h2>
        <table id="tabla">
            <tbody>
                <tr>
                    <td><b>Código</b></td>
                    <td><b>Nombre Producto</b></td>
                    <td><b>Línea</b></td>
                    <td><b>Precio</b></td>
                    <td><b>Cantidad</b></td>
                </tr>                
            </tbody>
        </table>
    </body>
    
    <script type="text/javascript" >
        $(document).ready(function () {
            //alert("");
            Listar();
        });
        
        function Listar() {
            $.ajax({
                url: "Listar",
                type: "get",
                async: true,
                success: function (rpta) {
                    $.each(rpta, function (indice, prod) {
                        $("#tabla").append($("<tr>").append("<td>" + prod.idproducto + "</td>" +
                                "<td>" + prod.descripcion + "</td>" +
                                "<td>" + prod.idlinea + "</td>" +
                                "<td>" + prod.precioventa + "</td>" +
                                "<td>" + prod.stock + "</td>"
                                ));
                    });
                }
            });
        }
        //});
    </script>
</html>