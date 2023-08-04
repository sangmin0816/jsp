// Source code is decompiled from a .class file using FernFlower decompiler.
package com.chunjae.db;

import java.sql.*;

public class MariaDBCon implements DBC {
  final String DRIVER = "org.mariadb.jdbc.Driver";
  final String DNS = "localhost";
  final String PORT = "3306";
  final String NAME = "edu";
  final String USER = "root";
  final String PASS = "1234";
  final String URL = "jdbc:mariadb://localhost:3306/edu";
  Connection conn = null;

  public MariaDBCon() {
  }

  public Connection connect() {
    try {
      Class.forName(DRIVER);

      try {
        this.conn = DriverManager.getConnection(URL, USER, PASS);
      } catch (SQLException var2) {
        throw new RuntimeException(var2);
      }
    } catch (ClassNotFoundException var3) {
      throw new RuntimeException(var3);
    }

    return this.conn;
  }

  public void close(PreparedStatement pstmt, Connection conn) {
    if (pstmt != null) {
      try {
        pstmt.close();
      } catch (SQLException var5) {
        throw new RuntimeException(var5);
      }
    }

    if (conn != null) {
      try {
        conn.close();
      } catch (SQLException var4) {
        throw new RuntimeException(var4);
      }
    }

  }

  public void close(ResultSet rs, PreparedStatement pstmt, Connection conn) {
    if (rs != null) {
      try {
        rs.close();
      } catch (SQLException var7) {
        throw new RuntimeException(var7);
      }
    }

    if (pstmt != null) {
      try {
        pstmt.close();
      } catch (SQLException var6) {
        throw new RuntimeException(var6);
      }
    }

    if (conn != null) {
      try {
        conn.close();
      } catch (SQLException var5) {
        throw new RuntimeException(var5);
      }
    }

  }
}
