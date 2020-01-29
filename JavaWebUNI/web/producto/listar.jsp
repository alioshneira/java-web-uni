<%@include file="../includes/header.jsp" %> 
    <body >
        <table id="tabla" class="table">
            <tbody>
                <tr>
                    <td><b>Código</b></td>
                    <td><b>Nombre Producto</b></td>
                    <td><b>Línea</b></td>
                    <td><b>Precio</b></td>
                    <td><b>Cantidad</b></td>
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
                url: "Listar",
                type: "get",
                async: true,
                success: function (rpta) {
                    $.each(rpta, function (indice, prod) {
                        $("#tabla").append($("<tr>").append("<td>" + prod.idproducto + "</td>" +
                                "<td>" + prod.descripcion + "</td>" +
                                "<td>" + prod.idlinea + "</td>" +
                                "<td>" + prod.precioventa + "</td>" +
                                "<td>" + prod.stock + "</td>"
                                ));
                    });
                }
            });
        }
        //});
    </script>
</html>