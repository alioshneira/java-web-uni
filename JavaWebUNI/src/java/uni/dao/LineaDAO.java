package uni.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import uni.database.AccesoDB;
import uni.entity.LineaTO;
import uni.service.ICrudDao;

public class LineaDAO implements ICrudDao<LineaTO> {

    //variables

    Connection cn = null;
    Statement stm = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    String sql = "";
    LineaTO li = null;

    @Override
    public void create(LineaTO t) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void update(LineaTO t) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void delete(LineaTO t) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public LineaTO find(Object t) throws Exception {
      
        return null; 
    }

    @Override
    public List<LineaTO> readAll() throws Exception {
        List<LineaTO> lista = new ArrayList<>();
        try {
            //obtener conexion a la base de datos
            cn = AccesoDB.getConnection();
            sql = "select * from lineas order by idlinea";
            stm = cn.createStatement();
            rs = stm.executeQuery(sql);
            while (rs.next()) {
                li = new LineaTO(rs.getInt(1), rs.getString(2));
                lista.add(li);
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

}
