<%@include file="../includes/header.jsp" %>
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