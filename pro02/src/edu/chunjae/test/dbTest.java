package edu.chunjae.test;

import edu.chunjae.db.DBC;
import edu.chunjae.db.PostgreCon;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class dbTest {
  static Connection conn = null;
  static PreparedStatement pstmt = null;
  static ResultSet rs = null;
  public static void main(String[] args) {
    DBC con = new PostgreCon();
    conn = con.connect();

    try {
      pstmt = conn.prepareStatement(PostgreCon.NOTICE_SELECT_ALL);
    } catch (SQLException e) {
      throw new RuntimeException(e);
    }

  }
}
