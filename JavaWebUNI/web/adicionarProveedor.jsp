<%@page import="uni.dao.ProveedoresDAO"%>
<%@page import="uni.entity.ProveedorTO"%>
<%@page import="java.util.List"%>
<%@include file="header.jsp" %> 
    <body>

        <form id="form1">
            <table border="1">
                <thead>
                    <tr>
                        <th colspan="2">Nuevo Proveedor</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td><b>C�digo</b></td>
                        <td><input type="text" name="txtcodigo" value="" id="txtcodigo" /></td>
                    </tr>
                    <tr>
                        <td><b>Razon Social</b></td>
                        <td><input type="text" name="txtrazonsocial" value="" id="txtrazonsocial" /></td>
                    </tr>
                    <tr>
                        <td><b>Direcci�n</b></td>
                        <td><input type="text" name="txtdireccion" value="" id="txtdireccion" /></td>
                    </tr>
                    <tr>
                        <td>RUC</td>
                        <td><input type="text" name="txtruc" value="" id="txtruc" /></td>
                    </tr>
                    <tr>
                        <td>Telefono</td>
                        <td><input type="text" name="txttelefono" value=""  id="txttelefono"/></td>
                    </tr>
                    <tr>
                        <td colspan="2"><input type="button" value="Grabar" id="btngrabar" /></td>
                    </tr>
                </tbody>
            </table>

        </form>
        <div id="divmensaje">
            <p style="color: green;">${requestScope.mensaje}</p>
            <p style="color: red;">${requestScope.error}</p>
        </div>
    </body>

    <script type="text/javascript">
        
        $().ready(function () {

            $("#btngrabar").click(function () {
                //variables
                var codVar = $("#txtcodigo").val();
                var razonsocialVar = $("#txtrazonsocial").val();
                var direccionVar = $("#txtdireccion").val();
                var rucVar = $("#txtruc").val();
                var telefonoVar = $("#txttelefono").val();
                //ejecutar el servlet
                $.post('AdicionarProv',
                        {
                            idproveedor: codVar,
                            razonsocial: razonsocialVar,
                            direccion: direccionVar,
                            ruc: rucVar,
                            telefono: telefonoVar
                        },
                        function (responseText) {
                            $("#divmensaje").html(responseText);
                        });
            });
        });
    </script>
</html>
