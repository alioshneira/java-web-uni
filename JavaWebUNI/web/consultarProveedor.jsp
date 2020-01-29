<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Buscar Proveedor</title>
        <script src="jquery/jquery-3.4.1.min.js" type="text/javascript"></script>
    </head>
    <body>
        <form id="form1">
            <p>Código <input type="text" name="txtid" value="" id="txtid" /> </p>
            <input type="button" value="Mostrar" id="btnmostrar"/>
        </form>
        <div>
            <table id="tabla">
                <thead>
                    <tr>
                        <th colspan="2">Datos Proveedor</th>
                    </tr>
                </thead>
                <tbody>
                    
                </tbody>
            </table>
        </div>
    </body>
     <script type="text/javascript" >

        $("#btnmostrar").click(function(){
            $.ajax({
                url: "BuscarProv",
                type: "get",
                data:{idproveedor:$("#txtid").val()},
                async: true,
                success: function (rpta) {
                    if(rpta===null){
                        $("#tabla").append($("<tr>").append("<td>Proveedor</td><td>no encontrado</td>"));
                    }
                    else{
                        $("#tabla").append($("<tr>").append("<td>Codigo</td><td>" + rpta.idproveedor + "</td>"));
                        $("#tabla").append($("<tr>").append("<td>Razón Social</td><td>" + rpta.razonsocial + "</td>"));
                        $("#tabla").append($("<tr>").append("<td>Dirección</td><td>" + rpta.direccion + "</td>"));
                        $("#tabla").append($("<tr>").append("<td>Teléfono</td><td>" + rpta.telefono + "</td>"));
                        $("#tabla").append($("<tr>").append("<td>RUC</td><td>" + rpta.ruc + "</td>"));
                    }
                }
            });
        });   
        
       
    </script>
</html>