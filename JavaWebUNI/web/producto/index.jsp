<%@include file="../includes/header.jsp" %>
    <body>
        <nav class="navbar navbar-default">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="#">MODAS S.A.C</a>
                </div>
                <ul class="nav navbar-nav">
                    <li class="active"><a href="index.jsp">PRODUCTOS</a></li>
                    <li><a href="../proveedor/index.jsp">PROVEEDORES</a></li>
                </ul>
            </div>
         </nav>
        <div class="container">
            <ul class="nav nav-tabs">
                <li id="plistar"><a href="./listar.jsp" target="WORK">Listar</a></li>
                <li id="pregistrar"><a href="./adicionar.jsp" target="WORK">Registrar</a></li>
                <li id="pactualizar"><a href="./modificar.jsp" target="WORK">Actualizar</a></li>
                <li id="peliminar"><a href="./eliminar.jsp" target="WORK">Eliminar</a></li>
                <li id="pbuscar"><a href="./consultar.jsp" target="WORK">Buscar</a></li>
            </ul>
            <iframe style="border: 0px white solid" width="100%" height="500" name="WORK"></iframe>
        </div>
        <script type="text/javascript">
            
            $().ready(function () {

                $("#plistar").click(function () {
                    $("#plistar").addClass("active");
                    $("#pregistrar").removeClass("active");
                    $("#pactualizar").removeClass("active");
                    $("#peliminar").removeClass("active");
                    $("#pbuscar").removeClass("active");
                    
                });
                $("#pregistrar").click(function () {
                    $("#plistar").removeClass("active");
                    $("#pregistrar").addClass("active");
                    $("#pactualizar").removeClass("active");
                    $("#peliminar").removeClass("active");
                    $("#pbuscar").removeClass("active");
                    
                });   
                
                $("#pactualizar").click(function () {
                    $("#plistar").removeClass("active");
                    $("#pregistrar").removeClass("active");
                    $("#pactualizar").addClass("active");
                    $("#peliminar").removeClass("active");
                    $("#pbuscar").removeClass("active");
                    
                }); 
                
                                
                $("#peliminar").click(function () {
                    $("#plistar").removeClass("active");
                    $("#pregistrar").removeClass("active");
                    $("#pactualizar").removeClass("active");
                    $("#peliminar").addClass("active");
                    $("#pbuscar").removeClass("active");
                    
                });
                
                $("#pbuscar").click(function () {
                    $("#plistar").removeClass("active");
                    $("#pregistrar").removeClass("active");
                    $("#pactualizar").removeClass("active");
                    $("#peliminar").removeClass("active");
                    $("#pbuscar").addClass("active");
                    
                });
            });
        </script>
            
<%@include file="../includes/footer.jsp" %>

