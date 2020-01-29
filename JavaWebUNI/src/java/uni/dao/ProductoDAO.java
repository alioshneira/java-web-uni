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
import uni.entity.ProductoTO;
import uni.service.ICrudDao;

public class ProductoDAO implements ICrudDao<ProductoTO> {

    //variables
    Connection cn = null;
    Statement stm = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    String sql = "";
    ProductoTO pro = null;

    @Override
    public void create(ProductoTO t) throws Exception {
        try {
            //obtener conexion a la base de datos
            cn = AccesoDB.getConnection();
            sql = "insert into Productos(idProducto,Descripcion,idLinea,PrecioCompra,PrecioVenta,Stock)"
                    + " values(?,?,?,?,?,?)";
            ps = cn.prepareStatement(sql);
            //preparar valores de los parametros
            ps.setString(1, t.getIdproducto());
            ps.setString(2, t.getDescripcion());
            ps.setInt(3, t.getIdlinea());
            ps.setDouble(4, t.getPreciocompra());
            ps.setDouble(5, t.getPrecioventa());
            ps.setInt(6, t.getStock());
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
    public void update(ProductoTO t) throws Exception {
        try {
            //obtener conexion a la base de datos
            cn = AccesoDB.getConnection();
            sql = "update Productos set Descripcion=?,idLinea=?,PrecioCompra=?,PrecioVenta=?,"
                    + "Stock=? where idProducto=?";
            ps = cn.prepareStatement(sql);
            //preparar valores de los parametros           
            ps.setString(1, t.getDescripcion());
            ps.setInt(2, t.getIdlinea());
            ps.setDouble(3, t.getPreciocompra());
            ps.setDouble(4, t.getPrecioventa());
            ps.setInt(5, t.getStock());
            ps.setString(6, t.getIdproducto());
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
    public void delete(ProductoTO t) throws Exception {
        try {
            //obtener conexion a la base de datos
            cn = AccesoDB.getConnection();
            sql = "delete from Productos where idProducto=?";
            ps = cn.prepareStatement(sql);
            //preparar valores de los parametros                    
            ps.setString(1, t.getIdproducto());
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
    public ProductoTO find(Object t) throws Exception {
        pro = null;
        try {
            //obtener conexion a la base de datos
            cn = AccesoDB.getConnection();
            sql = "select * from Productos where idProducto=?";
            ps = cn.prepareStatement(sql);
            ps.setString(1, (String) t);
            rs = ps.executeQuery();
            if (rs.next()) {
                pro = new ProductoTO();
                //asigna valores al objeto pro
                pro.setIdproducto(rs.getString(1));
                pro.setDescripcion(rs.getString(2));
                pro.setIdlinea(rs.getInt(3));
                pro.setPreciocompra(rs.getDouble(4));
                pro.setPrecioventa(rs.getDouble(5));
                pro.setStock(rs.getInt(6));
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
    
     public ProductoTO find(String t) throws Exception {
        pro = null;
        try {
            //obtener conexion a la base de datos
            cn = AccesoDB.getConnection();
            sql = "select * from Productos where Descripcion=?";
            ps = cn.prepareStatement(sql);
            ps.setString(1,t);
            rs = ps.executeQuery();
            if (rs.next()) {
                pro = new ProductoTO();
                //asigna valores al objeto pro
                pro.setIdproducto(rs.getString(1));
                pro.setDescripcion(rs.getString(2));
                pro.setIdlinea(rs.getInt(3));
                pro.setPreciocompra(rs.getDouble(4));
                pro.setPrecioventa(rs.getDouble(5));
                pro.setStock(rs.getInt(6));
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
    public List<ProductoTO> readAll() throws Exception {
        List<ProductoTO> lista = new ArrayList<>();
        try {
            //obtener conexion a la base de datos
            cn = AccesoDB.getConnection();
            sql = "select * from Productos order by idProducto";
            stm = cn.createStatement();
            rs = stm.executeQuery(sql);
            while (rs.next()) {
                pro = new ProductoTO();
                pro.setIdproducto(rs.getString(1));
                pro.setDescripcion(rs.getString(2));
                pro.setIdlinea(rs.getInt(3));
                pro.setPreciocompra(rs.getDouble(4));
                pro.setPrecioventa(rs.getDouble(5));
                pro.setStock(rs.getInt(6));
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

    public List<ProductoTO> readAll(String nombre) throws Exception {
        List<ProductoTO> lista = new ArrayList<>();
        try {
            //obtener conexion a la base de datos
            cn = AccesoDB.getConnection();
            sql = "select * from Productos where Descripcion like ?";
            ps = cn.prepareStatement(sql);
            //preparar el valor del parametro
            ps.setString(1, nombre + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                pro = new ProductoTO();
                pro.setIdproducto(rs.getString(1));
                pro.setDescripcion(rs.getString(2));
                pro.setIdlinea(rs.getInt(3));
                pro.setPreciocompra(rs.getDouble(4));
                pro.setPrecioventa(rs.getDouble(5));
                pro.setStock(rs.getInt(6));
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
        List<ProductoTO> lista = new ArrayList<>();
        try {
            //obtener conexion a la base de datos
            cn = AccesoDB.getConnection();
            sql = "select * from Productos order by idProducto";
            stm = cn.createStatement();
            rs = stm.executeQuery(sql);
            while (rs.next()) {
                pro = new ProductoTO();
                pro.setIdproducto(rs.getString(1));
                pro.setDescripcion(rs.getString(2));
                pro.setIdlinea(rs.getInt(3));
                pro.setPreciocompra(rs.getDouble(4));
                pro.setPrecioventa(rs.getDouble(5));
                pro.setStock(rs.getInt(6));
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
            sql = "select * from Productos where idProducto=?";
            ps = cn.prepareStatement(sql);
            ps.setString(1, (String) t);
            rs = ps.executeQuery();
            if (rs.next()) {
                pro = new ProductoTO();
                //asigna valores al objeto pro
                pro.setIdproducto(rs.getString(1));
                pro.setDescripcion(rs.getString(2));
                pro.setIdlinea(rs.getInt(3));
                pro.setPreciocompra(rs.getDouble(4));
                pro.setPrecioventa(rs.getDouble(5));
                pro.setStock(rs.getInt(6));
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
