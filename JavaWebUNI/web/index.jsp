<%-- 
    Document   : index
    Created on : 23/01/2014, 07:57:34 PM
    Author     : Alumno
--%>

<%@page import="uni.database.AccesoDB"%>
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
   
        <% AccesoDB db = new AccesoDB(); 
            db.getConnection();      
        %>        
        <h2>PRODUCTOS | <a href="proveedor.jsp">PROVEEDORES</a></h2>
        <div style="width:100%; height: 100%" >
            <div class="celda"><a href="listar.jsp" target="WORK">Listar</a></div>
            <div class="celda"><a href="adicionar.jsp" target="WORK">Registrar</a></div>
            <div class="celda"><a href="modificar.jsp" target="WORK">Actualizar</a></div>
            <div class="celda"><a href="eliminar.jsp" target="WORK">Eliminar</a></div>
            <div class="celda"><a href="consultar.jsp" target="WORK">Buscar</a></div>
        </div>
        <iframe width="900" height="500" name="WORK"></iframe>
   
    </body>
</html>

