package uni.dao;

import com.google.gson.Gson;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import uni.database.AccesoDB;
import uni.entity.ProveedorTO;
import uni.service.ICrudDao;

public class ProveedoresDAO implements ICrudDao<ProveedorTO> {

    //variables
    Connection cn = null;
    Statement stm = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    String sql = "";
    ProveedorTO pro = null;

    @Override
    public void create(ProveedorTO t) throws Exception {
        try {
            //obtener conexion a la base de datos
            cn = AccesoDB.getConnection();
            sql = "insert into Proveedores(idProveedor,Direccion,Razonsocial,Ruc,Telefono)"
                    + " values(?,?,?,?,?)";
            ps = cn.prepareStatement(sql);
            //preparar valores de los parametros
            ps.setString(1, t.getIdproveedor());
            ps.setString(2, t.getDireccion());
            ps.setString(3, t.getRazonsocial());
            ps.setString(4, t.getRuc());
            ps.setString(5, t.getTelefono());
            //ejecutar comando
            ps.executeUpdate();
            ps.close();
        } catch (SQLException | ClassNotFoundException e) {
            throw e;
        } finally {
            cn.close();
        }
    }

    @Override
    public void update(ProveedorTO t) throws Exception {
        try {
            //obtener conexion a la base de datos
            cn = AccesoDB.getConnection();
            sql = "update Proveedores set Razonsocial=?,Direccion=?,Ruc=?,Telefono=?"
                    + " where idproveedor=?";
            ps = cn.prepareStatement(sql);
            //preparar valores de los parametros           
            ps.setString(1, t.getRazonsocial());
            ps.setString(2, t.getDireccion());
            ps.setString(3, t.getRuc());
            ps.setString(4, t.getTelefono());
            ps.setString(5, t.getIdproveedor());

            //ejecutar comando
            ps.executeUpdate();
            ps.close();
        } catch (SQLException | ClassNotFoundException e) {
            throw e;
        } finally {
            cn.close();
        }
    }

    @Override
    public void delete(ProveedorTO t) throws Exception {
        try {
            //obtener conexion a la base de datos
            cn = AccesoDB.getConnection();
            sql = "DELETE from Proveedores where idProveedor=?";
            ps = cn.prepareStatement(sql);
            //preparar valores de los parametros                    
            ps.setString(1, t.getIdproveedor());
            //ejecutar comando
            ps.executeUpdate();
            ps.close();
        } catch (SQLException | ClassNotFoundException e) {
            throw e;
        } finally {
            cn.close();
        }
    }

    @Override
    public ProveedorTO find(Object t) throws Exception {
        pro = null;
        try {
            //obtener conexion a la base de datos
            cn = AccesoDB.getConnection();
            sql = "select * from Proveedores where idProveedor=?";
            ps = cn.prepareStatement(sql);
            ps.setString(1, (String) t);
            rs = ps.executeQuery();
            if (rs.next()) {
                pro = new ProveedorTO();
                //asigna valores al objeto pro
                pro.setIdproveedor(rs.getString("idProveedor"));
                pro.setRazonsocial(rs.getString("RazonSocial"));
                pro.setDireccion(rs.getString("Direccion"));
                pro.setRuc(rs.getString("Ruc"));
                pro.setTelefono(rs.getString("Telefono"));

            }
            rs.close();
            ps.close();
        } catch (SQLException | ClassNotFoundException e) {
            throw e;
        } finally {
            cn.close();
        }
        return pro;
    }
    
     public ProveedorTO find(String t) throws Exception {
        pro = null;
        try {
            //obtener conexion a la base de datos
            cn = AccesoDB.getConnection();
            sql = "select * from Proveedores where Razonsocial=?";
            ps = cn.prepareStatement(sql);
            ps.setString(1,t);
            rs = ps.executeQuery();
            if (rs.next()) {
                pro = new ProveedorTO();
                //asigna valores al objeto pro
                pro.setIdproveedor(rs.getString("idProveedor"));
                pro.setRazonsocial(rs.getString("RazonSocial"));
                pro.setDireccion(rs.getString("Direccion"));
                pro.setRuc(rs.getString("Ruc"));
                pro.setTelefono(rs.getString("Telefono"));

            }
            rs.close();
            ps.close();
        } catch (SQLException | ClassNotFoundException e) {
            throw e;
        } finally {
            cn.close();
        }
        return pro;
    }

    @Override
    public List<ProveedorTO> readAll() throws Exception {
        List<ProveedorTO> lista = new ArrayList<>();
        try {
            //obtener conexion a la base de datos
            cn = AccesoDB.getConnection();
            sql = "select * from Proveedores order by idProveedor";
            stm = cn.createStatement();
            rs = stm.executeQuery(sql);
            while (rs.next()) {
                pro = new ProveedorTO();
                pro.setIdproveedor(rs.getString("idProveedor"));
                pro.setRazonsocial(rs.getString("RazonSocial"));
                pro.setDireccion(rs.getString("Direccion"));
                pro.setRuc(rs.getString("Ruc"));
                pro.setTelefono(rs.getString("Telefono"));
                lista.add(pro);
            }
            rs.close();
            stm.close();
        } catch (SQLException | ClassNotFoundException e) {
            throw e;
        } finally {
            cn.close();
        }
        return lista;
    }

    public List<ProveedorTO> readAll(String razonsocial) throws Exception {
        List<ProveedorTO> lista = new ArrayList<>();
        try {
            //obtener conexion a la base de datos
            cn = AccesoDB.getConnection();
            sql = "select * from Proveedores where RazonSocial like ?";
            ps = cn.prepareStatement(sql);
            //preparar el valor del parametro
            ps.setString(1, razonsocial + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                pro = new ProveedorTO();
                pro.setIdproveedor(rs.getString("idProveedor"));
                pro.setRazonsocial(rs.getString("RazonSocial"));
                pro.setDireccion(rs.getString("Direccion"));
                pro.setRuc(rs.getString("Ruc"));
                pro.setTelefono(rs.getString("Telefono"));
                lista.add(pro);
            }
            rs.close();
            ps.close();
        } catch (SQLException | ClassNotFoundException e) {
            throw e;
        } finally {
            cn.close();
        }
        return lista;
    }
    
    
    public String Listar() throws Exception {
        List<ProveedorTO> lista = new ArrayList<>();
        try {
            //obtener conexion a la base de datos
            cn = AccesoDB.getConnection();
            sql = "select * from Proveedores order by idProveedor";
            stm = cn.createStatement();
            rs = stm.executeQuery(sql);
            while (rs.next()) {
                pro = new ProveedorTO();
                pro.setIdproveedor(rs.getString("idProveedor"));
                pro.setRazonsocial(rs.getString("RazonSocial"));
                pro.setDireccion(rs.getString("Direccion"));
                pro.setRuc(rs.getString("Ruc"));
                pro.setTelefono(rs.getString("Telefono"));
                lista.add(pro);
            }
            rs.close();
            stm.close();
        } catch (SQLException | ClassNotFoundException e) {
            throw e;
        } finally {
            cn.close();
        }
        return new Gson().toJson(lista);
    }
    public String Buscar(Object t) throws Exception {
        pro = null;
        try {
            //obtener conexion a la base de datos
            cn = AccesoDB.getConnection();
            sql = "select * from Proveedores where idProveedor=?";
            ps = cn.prepareStatement(sql);
            ps.setString(1, (String) t);
            rs = ps.executeQuery();
            if (rs.next()) {
                pro = new ProveedorTO();
                //asigna valores al objeto pro
                pro.setIdproveedor(rs.getString("idProveedor"));
                pro.setRazonsocial(rs.getString("Razonsocial"));
                pro.setDireccion(rs.getString("Direccion"));
                pro.setRuc(rs.getString("Ruc"));
                pro.setTelefono(rs.getString("Telefono"));
            }
            rs.close();
            ps.close();
        } catch (SQLException | ClassNotFoundException e) {
            throw e;
        } finally {
            cn.close();
        }
        return new Gson().toJson(pro);
    }
}
