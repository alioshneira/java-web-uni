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
import uni.dao.ProveedoresDAO;
import uni.entity.ProveedorTO;

/**
 *
 * @author Alumno
 */
@WebServlet(name = "ProveedorServlet", 
        urlPatterns = {"/AdicionarProv", "/ActualizarProv", "/EliminarProv", "/BuscarProv", "/ListarProv"})
public class ProveedorServlet extends HttpServlet {

    //variables
    ProveedoresDAO dao;
    ProveedorTO pro;

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String path = request.getServletPath();
        try {
            switch (path) {
                case "/AdicionarProv":
                    registrar(request, response);
                    break;
                case "/ActualizarProv":
                    modificar(request, response);
                    break;
                case "/EliminarProv":
                    eliminar(request, response);
                    break;
                case "/BuscarProv":
                    buscar(request, response);
                    break;
                case "/ListarProv":
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
            pro = new ProveedorTO();
            //asignar valores al objeto pro
            pro.setIdproveedor(request.getParameter("idproveedor"));
            pro.setRazonsocial(request.getParameter("razonsocial"));
            pro.setDireccion(request.getParameter("direccion"));
            pro.setTelefono(request.getParameter("telefono"));
            pro.setRuc(request.getParameter("ruc"));

            dao = new ProveedoresDAO();

            dao.create(pro);
            msg = "Proveedor registrado con exito";
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
            pro = new ProveedorTO();
            pro.setIdproveedor(request.getParameter("idproveedor"));
            pro.setRazonsocial(request.getParameter("razonsocial"));
            pro.setDireccion(request.getParameter("direccion"));
            pro.setRuc(request.getParameter("ruc"));
            pro.setTelefono(request.getParameter("telefono"));

            dao = new ProveedoresDAO();

            dao.update(pro);
            msg = "Proveedores actualizado con exito";   

        } catch (Exception e) {
            msg = "error : " + e.getMessage() + pro.toString();         
        }
        out.println(msg);     
    }

    private void buscar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("application/json;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            Object id = request.getParameter("idproveedor");
            dao = new ProveedoresDAO();
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
            dao = new ProveedoresDAO();
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
            pro = new ProveedorTO();
            pro.setIdproveedor(request.getParameter("idproveedor"));

            dao = new ProveedoresDAO();

            dao.delete(pro);
            msg = "Proveedor eliminado con exito";
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
