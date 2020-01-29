<%@include file="header.jsp" %>
    <body>
        <nav class="navbar navbar-default">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="#">MODAS S.A.C</a>
                </div>
                <ul class="nav navbar-nav">
                    <li class="active"><a href="index.jsp">PRODUCTOS</a></li>
                    <li><a href="proveedor.jsp">PROVEEDORES</a></li>
                </ul>
            </div>
         </nav>
        <div class="container">
            <ul class="nav nav-tabs">
                <li class="active"><a href="listar.jsp" target="WORK">Listar</a></li>
                <li><a href="adicionar.jsp" target="WORK">Registrar</a></li>
                <li><a href="modificar.jsp" target="WORK">Actualizar</a></li>
                <li><a href="eliminar.jsp" target="WORK">Eliminar</a></li>
                <li><a href="consultar.jsp" target="WORK">Buscar</a></li>
            </ul>
            <iframe width="900" height="500" name="WORK"></iframe>
        </div>

<%@include file="footer.jsp" %>

