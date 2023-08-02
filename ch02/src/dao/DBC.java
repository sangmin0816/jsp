package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public interface DBC {
    public Connection connect(String DRIVER, String URL, String USER, String PW) throws ClassNotFoundException, SQLException;
    // close 메서드는 오버로딩
    public void close(PreparedStatement pstmt, Connection conn) throws SQLException;
    public void close(ResultSet rs, PreparedStatement pstmt, Connection conn) throws SQLException;

    public void insert(String table, ArrayList<String> columns, ArrayList<String> values);
    public int insert(String table, ArrayList<String> values) throws SQLException;
    public ResultSet select(ArrayList columns, String table);
    public void update(String table, String column, String newData, String where);
    public void delete(String table, String where);

}
