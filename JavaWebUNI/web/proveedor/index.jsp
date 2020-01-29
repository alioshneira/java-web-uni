<%@include file="../includes/header.jsp" %> 
    <body>
        <div class="container">
            
        </div>
        <nav class="navbar navbar-default">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="#">MODAS S.A.C</a>
                </div>
                <ul class="nav navbar-nav">
                    <li><a href="index.jsp">PRODUCTOS</a></li>
                    <li class="active"><a href="proveedor.jsp">PROVEEDORES</a></li>
                </ul>
            </div>
        </nav>
        <div class="container">
            <ul class="nav nav-tabs">
                <li><a href="listarProveedor.jsp" target="WORK">Listar</a></li>
                <li><a href="adicionarProveedor.jsp" target="WORK">Registrar</a></li>
                <li><a href="modificarProveedor.jsp" target="WORK">Actualizar</a></li>
                <li><a href="eliminarProveedor.jsp" target="WORK">Eliminar</a></li>
                <li><a href="consultarProveedor.jsp" target="WORK">Buscar</a></li>
            </ul>
            <iframe width="100%" height="500" name="WORK"></iframe>
        </div>
    </body>
</html>

