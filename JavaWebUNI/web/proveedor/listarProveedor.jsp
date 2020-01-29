<%@include file="../includes/header.jsp" %>

    <body >
        <table id="tabla" class="table">
            <tbody>
                <tr>
                    <td><b>Código</b></td>
                    <td><b>Razón Social</b></td>
                    <td><b>Dirección</b></td>
                    <td><b>RUC</b></td>
                    <td><b>Telefono</b></td>
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
                url: "ListarProv",
                type: "get",
                async: true,
                success: function (rpta) {
                    $.each(rpta, function (indice, prov) {
                        $("#tabla").append($("<tr>").append("<td>" + prov.idproveedor + "</td>" +
                                "<td>" + prov.razonsocial + "</td>" +
                                "<td>" + prov.direccion + "</td>" +
                                "<td>" + prov.ruc + "</td>" +
                                "<td>" + prov.telefono + "</td>"
                                ));
                    });
                }
            });
        }
        //});
    </script>
</html>