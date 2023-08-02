//package dao;
//
//import java.sql.*;
//import java.util.ArrayList;
//
//public class DBCC implements DBC{
//    final String DNS = "localhost"; // post server 주소
//    final String PORT = "3306";
//    final String USER = "root";
//    final String PW = "1234";
//    Connection conn = null;
//    PreparedStatement pstmt = null;
//    ResultSet rs = null;
//    private String NAME = null;
//
//    public String getNAME() {
//        return NAME;
//    }
//
//    public void setNAME(String NAME) {
//        this.NAME = NAME;
//    }
//
//    @Override
//    public Connection connect(String DRIVER, String URL, String USER, String PW) throws ClassNotFoundException, SQLException {
//        Class.forName(DRIVER);
//        this.conn = DriverManager.getConnection(URL,this.USER, this.PW);
//        return this.conn;
//    }
//
//    @Override
//    public void close(PreparedStatement pstmt, Connection conn) throws SQLException {
//        pstmt.close();
//        conn.close();
//    }
//
//    @Override
//    public void close(ResultSet rs, PreparedStatement pstmt, Connection conn) throws SQLException {
//        rs.close();
//        pstmt.close();
//        conn.close();
//    }
//
//
//
//
//    @Override
//    public void insert(String table, ArrayList<String> columns, ArrayList<String> values) {
//        String sql = "insert into "+"'"+table+"' ";
//        sql+= " values(";
//        for(int i=0; i<values.size()-1; i++){
//            sql+="?, ";
//        }
//        sql+="?)";
//
//        pstmt = conn.prepareStatement(sql);
//        for(int i=0; i<values.size(); i++){
//            try{
//                Integer value = Integer.parseInt(values.get(i));
//                pstmt.setInt(i+1, value);
//            } catch(Exception e){
//                pstmt.setString(i+1, values.get(i));
//            }
//        }
//        pstmt.executeUpdate();
//
//        // Primary Key 받기
//        rs = pstmt.getGeneratedKeys();
//        rs.next();
//
//        return rs.getInt(1);
//    }
//
//    @Override
//    public int insert(String table, ArrayList<String> values) throws SQLException {
//        // INSERT INTO 테이블 VALUES(컬럼값1, 컬럼값2, ...);
//        String sql = "insert into "+"'"+table+"' values(";
//        for(int i=0; i<values.size()-1; i++){
//            sql+="?, ";
//        }
//        sql+="?)";
//
//        pstmt = conn.prepareStatement(sql);
//        for(int i=0; i<values.size(); i++){
//            try{
//                Integer value = Integer.parseInt(values.get(i));
//                pstmt.setInt(i+1, value);
//            } catch(Exception e){
//                pstmt.setString(i+1, values.get(i));
//            }
//        }
//        pstmt.executeUpdate();
//
//        // Primary Key 받기
//        rs = pstmt.getGeneratedKeys();
//        rs.next();
//
//        return rs.getInt(1);
//    }
//
//    @Override
//    public ResultSet select(ArrayList columns, String table) {
//        return null;
//    }
//
//    @Override
//    public void update(String table, String column, String newData, String where) {
//
//    }
//
//    @Override
//    public void delete(String table, String where) {
//
//    }
//}
