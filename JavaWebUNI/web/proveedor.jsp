<%-- 
    Document   : index
    Created on : 23/01/2014, 07:57:34 PM
    Author     : Alumno
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CRUD CON JSP Y SERVLET</title>
        <style>
            .celda{
                margin: 10 10 10 10;
                padding: 10 10 10 10;
                border-color: slategrey;
                border-style: solid;
                border-width: 1px;
                background: antiquewhite;  
                float: left;
                width: 120px;
                text-align: center;
            }
        </style>        
    </head>
    <body bgcolor="aqua">
   
        <h2><a href="index.jsp">PRODUCTOS</a> | PROVEEDORES</h2>
        <div style="width:100%; height: 100%" >
            <div class="celda"><a href="listarProveedor.jsp" target="WORK">Listar</a></div>
            <div class="celda"><a href="adicionarProveedor.jsp" target="WORK">Registrar</a></div>
            <div class="celda"><a href="modificarProveedor.jsp" target="WORK">Actualizar</a></div>
            <div class="celda"><a href="eliminarProveedor.jsp" target="WORK">Eliminar</a></div>
            <div class="celda"><a href="consultarProveedor.jsp" target="WORK">Buscar</a></div>
        </div>
        <iframe width="900" height="500" name="WORK"></iframe>
   
    </body>
</html>

