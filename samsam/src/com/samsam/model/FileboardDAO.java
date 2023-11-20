package com.samsam.model;

import com.samsam.db.DBC;
import com.samsam.db.MariaDBCon;
import com.samsam.dto.Fileboard;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

public class FileboardDAO {
  static DBC db = new MariaDBCon();
  Connection conn = null;
  PreparedStatement pstmt = null;
  ResultSet rs = null;
  final static SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

  public List<Fileboard> getFileboardList(){
    List<Fileboard> fileboardList = new ArrayList<>();
    conn = db.connect();
    String sql = "select * from fileboard order by regdate desc";
    try {
      pstmt = conn.prepareStatement(sql);
      rs = pstmt.executeQuery();
      while(rs.next()){
        Fileboard fileboard = new Fileboard();
        String regdate = sdf.format(rs.getDate("regdate"));
        fileboard.setTitle(rs.getString("title"));
        fileboard.setContent(rs.getString("content"));
        fileboard.setRegdate(regdate);
        fileboard.setVisited(rs.getInt("visited"));
        fileboard.setFiles(rs.getString("files"));
        fileboardList.add(fileboard);
      }
    } catch (SQLException e) {
      throw new RuntimeException(e);
    } finally {
      db.close(rs, pstmt, conn);
    }
    return fileboardList;
  }


  public Fileboard getFileboard(int ano){
    conn = db.connect();
    Fileboard fileboard = new Fileboard();

    String sql = "select * from fileboard where ano=?";

    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, ano);
      rs = pstmt.executeQuery();

      if(rs.next()){
        String regdate = sdf.format(rs.getDate("regdate"));
        fileboard.setAno(rs.getInt("ano"));
        fileboard.setTitle(rs.getString("title"));
        fileboard.setContent(rs.getString("content"));
        fileboard.setFiles(rs.getString("files"));
        fileboard.setRegdate(regdate);
        fileboard.setVisited(rs.getInt("visited"));
      }
    } catch (SQLException e) {
      throw new RuntimeException(e);
    } finally{
      db.close(rs, pstmt, conn);
    }
    return fileboard;
  }



  public int addFileboard(Fileboard fileboard){
    int cnt = 0;
    conn = db.connect();
    String sql = "insert into fileboard(title, content, files) values (?,?,?)";
    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, fileboard.getTitle());
      pstmt.setString(2, fileboard.getContent());
      pstmt.setString(3, fileboard.getFiles());
      cnt = pstmt.executeUpdate();
    } catch (SQLException e) {
      throw new RuntimeException(e);
    } finally {
      db.close(rs, pstmt, conn);
    }
    return cnt;
  }

  public int deleteFileboard(int ano){
    int cnt = 0;

    conn = db.connect();
    String sql = "delete from fileboard where ano=?";

    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, ano);
      cnt = pstmt.executeUpdate();

    } catch (SQLException e) {
      throw new RuntimeException(e);
    }

    db.close(rs, pstmt, conn);

    return cnt;
  }



  public int countUp(int ano){
    int cnt = 0;
    conn = db.connect();
    Fileboard fileboard = new Fileboard();

    String sql = "update fileboard set visited = visited+1 where ano=?";

    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, ano);
      cnt = pstmt.executeUpdate();
    } catch (SQLException e) {
      throw new RuntimeException(e);
    } finally{
      db.close(rs, pstmt, conn);
    }
    return cnt;
  }
}
