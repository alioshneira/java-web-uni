<%@page import="uni.dao.LineaDAO"%>
<%@page import="uni.entity.LineaTO"%>
<%@page import="java.util.List"%>
<%@include file="header.jsp" %>
    <body>
        <%
            LineaDAO dao = new LineaDAO();
            List<LineaTO> lineas = dao.readAll();
        %>
        <form id="form1">
            <table border="1">
                <thead>
                    <tr>
                        <th colspan="2">Nuevo Producto</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td><b>Código</b></td>
                        <td><input type="text" name="txtcodigo" value="" id="txtcodigo" /></td>
                    </tr>
                    <tr>
                        <td><b>Descripción</b></td>
                        <td><input type="text" name="txtnombre" value="" id="txtnombre" /></td>
                    </tr>
                    <tr>
                        <td><b>IdLinea</b></td>
                        <td><select name="cbolinea"  id="cbolinea">
                                <%for (LineaTO pro : lineas) {%>
                                <option value="<%=pro.getIdlinea()%>"><%=pro.getNombre()%></option>
                                <%}%>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>Precio</td>
                        <td><input type="text" name="txtprecio" value="" id="txtprecio" /></td>
                    </tr>
                    <tr>
                        <td>Cantidad</td>
                        <td><input type="text" name="txtstock" value=""  id="txtstock"/></td>
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
                var nombreVar = $("#txtnombre").val();
                var lineaVar = $("#cbolinea").val();
                var precioVar = $("#txtprecio").val();
                var stockVar = $("#txtstock").val();
                //ejecutar el servlet
                $.post('Adicionar',
                        {
                            idproducto: codVar,
                            nombre: nombreVar,
                            idlinea: lineaVar,
                            preciocompra: precioVar,
                            stock: stockVar
                        },
                        function (responseText) {
                            $("#divmensaje").html(responseText);
                        });
            });
        });
    </script>
    </html>