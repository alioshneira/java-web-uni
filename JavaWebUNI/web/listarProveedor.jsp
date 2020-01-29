
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Lista de Proveedores</title>
        <script src="jquery/jquery-3.4.1.min.js" type="text/javascript"></script>
    </head>
    <body >
        <h2>Lista de Proveedores</h2>
        <table id="tabla">
            <tbody>
                <tr>
                    <td><b>Código</b></td>
                    <td><b>Razón Social</b></td>
                    <td><b>Dirección</b></td>
                    <td><b>RUC</b></td>
                    <td><b>Telefono</b></td>
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
                url: "ListarProv",
                type: "get",
                async: true,
                success: function (rpta) {
                    $.each(rpta, function (indice, prov) {
                        $("#tabla").append($("<tr>").append("<td>" + prov.idproveedor + "</td>" +
                                "<td>" + prov.razonsocial + "</td>" +
                                "<td>" + prov.direccion + "</td>" +
                                "<td>" + prov.ruc + "</td>" +
                                "<td>" + prov.telefono + "</td>"
                                ));
                    });
                }
            });
        }
        //});
    </script>
</html>