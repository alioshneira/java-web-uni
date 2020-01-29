/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uni.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import uni.dao.ProductoDAO;
import uni.entity.ProductoTO;

/**
 *
 * @author Alumno
 */
@WebServlet(name = "ProductoServlet", 
        urlPatterns = {"/producto/Adicionar", "/producto/Actualizar", "/producto/Eliminar", "/producto/Buscar", "/producto/Listar"})
public class ProductoServlet extends HttpServlet {

    //variables
    ProductoDAO dao;
    ProductoTO pro;

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String path = request.getServletPath();
        try {
            switch (path) {
                case "/producto/Adicionar":
                    registrar(request, response);
                    break;
                case "/producto/Actualizar":
                    modificar(request, response);
                    break;
                case "/producto/Eliminar":
                    eliminar(request, response);
                    break;
                case "/producto/Buscar":
                    buscar(request, response);
                    break;
                case "/producto/Listar":
                    listar(request, response);
                    break;
            }
        } catch (IOException | ServletException e) {
        }
    }

    private void registrar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //
        String msg = "";
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        try {
            pro = new ProductoTO();
            //asignar valores al objeto pro
            pro.setIdproducto(request.getParameter("idproducto"));
            pro.setDescripcion(request.getParameter("nombre"));
            pro.setIdlinea(Integer.parseInt(request.getParameter("idlinea")));
            pro.setPreciocompra(Double.parseDouble(request.getParameter("preciocompra")));
            pro.setPrecioventa(pro.getPreciocompra() * 1.30);
            pro.setStock(Integer.parseInt(request.getParameter("stock")));

            dao = new ProductoDAO();

            dao.create(pro);
            msg = "Producto registrado con exito";
        } catch (Exception e) {
            msg = "error : " + e.getMessage();           
        }
        out.println(msg);       
    }

    private void modificar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String msg = "";
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        try {
            pro = new ProductoTO();
            pro.setIdproducto(request.getParameter("idproducto"));
            pro.setDescripcion(request.getParameter("nombre"));
            pro.setIdlinea(Integer.parseInt(request.getParameter("idlinea")));
            pro.setPreciocompra(Double.parseDouble(request.getParameter("preciocompra")));
            pro.setPrecioventa(pro.getPreciocompra() * 1.30);
            pro.setStock(Integer.parseInt(request.getParameter("stock")));

            dao = new ProductoDAO();

            dao.update(pro);
            msg = "Producto actualizado con exito";   

        } catch (Exception e) {
            msg = "error : " + e.getMessage();         
        }
        out.println(msg);     
    }

    private void buscar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("application/json;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            Object id = request.getParameter("idproducto");
            dao = new ProductoDAO();
            // mostrar datos de empleado en la pagina
            out.println(dao.Buscar(id));
        } catch (Exception e) {
            out.println("ERROR: " + e.getMessage());
        } finally {
            out.flush();
            out.close();
        }

    }

    private void listar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("application/json;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            dao = new ProductoDAO();
            // mostrar datos de empleado en la pagina
            out.println(dao.Listar());
        } catch (Exception e) {
            out.println("ERROR: " + e.getMessage());
        } finally {
            out.flush();
            out.close();
        }
    }

    private void eliminar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String msg = "";
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        try {
            pro = new ProductoTO();
            pro.setIdproducto(request.getParameter("idproducto"));

            dao = new ProductoDAO();

            dao.delete(pro);
            msg = "Producto eliminado con exito";
            //request.setAttribute("mensaje", "Producto eliminado con exito");

        } catch (Exception e) {
            msg = "error : " + e.getMessage();
            //request.setAttribute("error", e.getMessage());
        }
        out.println(msg);
        //RequestDispatcher rd=request.getRequestDispatcher("adicionar.jsp");
        //    rd.forward(request, response);
    }

}
