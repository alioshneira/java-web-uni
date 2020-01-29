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