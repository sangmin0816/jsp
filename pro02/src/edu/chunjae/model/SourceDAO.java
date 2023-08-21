package edu.chunjae.model;

import edu.chunjae.dto.Source;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class SourceDAO {
    static Connection conn = null;
    static PreparedStatement pstmt = null;
    static ResultSet rs = null;

    public int fileUploadTest(Source file){
        int cnt = 0;
        DBC con = new MariaDBCon();
        String sql = "insert into files values (?,?,?,?)";
        try {
            conn = con.connect();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, file.getUname());
            pstmt.setString(2, file.getSubject());
            pstmt.setString(3, file.getContent());
            pstmt.setString(4, file.getFilename());
            cnt = pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            con.close(rs, pstmt, conn);
        }
        return cnt;
    }

    public List<Source> getFileTestList(){
        List<Source> fileList = new ArrayList<>();
        DBC con = new MariaDBCon();
        String sql = "select * from files";
        try {
            conn = con.connect();
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            while(rs.next()){
                Source file = new Source();
                file.setUname(rs.getString("uname"));
                file.setSubject(rs.getString("subject"));
                file.setContent(rs.getString("content"));
                file.setFilename(rs.getString("filename"));
                fileList.add(file);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            con.close(rs, pstmt, conn);
        }
        return fileList;
    }
}
