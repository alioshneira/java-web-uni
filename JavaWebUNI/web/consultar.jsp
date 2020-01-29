<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Insert title here</title>
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
                        <th colspan="2">Datos Producto</th>
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
                url: "Buscar",
                type: "get",
                data:{idproducto:$("#txtid").val()},
                async: true,
                success: function (rpta) {
                    if(rpta===null){
                        $("#tabla").append($("<tr>").append("<td>Producto</td><td>no encontrado</td>"));
                    }
                    else{
                        $("#tabla").append($("<tr>").append("<td>Codigo</td><td>" + rpta.idproducto + "</td>"));
                        $("#tabla").append($("<tr>").append("<td>Descripción</td><td>" + rpta.descripcion + "</td>"));
                        $("#tabla").append($("<tr>").append("<td>Linea</td><td>" + rpta.idlinea + "</td>"));
                        $("#tabla").append($("<tr>").append("<td>Precio</td><td>" + rpta.precioventa + "</td>"));
                        $("#tabla").append($("<tr>").append("<td>Stock</td><td>" + rpta.stock + "</td>"));
                    }
                }
            });
        });   
        
       
    </script>
</html>