package edu.chunjae.model;

import java.sql.*;

public class MariaDBCon extends DBC {
  final String DRIVER = "org.mariadb.jdbc.Driver";
  final String DNS = "localhost:";
  final String PORT = "3306/";
  private String DB = "shop";
  final String USER = "root";
  final String PASS = "1234";
  final String URL = "jdbc:mariadb://"+DNS+PORT+DB;

  @Override
  public void setTABLE(String DB) {
    this.DB = DB;
  }

  public MariaDBCon() {
    super();
    super.setDRIVER(this.DRIVER);
    super.setDNS(this.DNS);
    super.setPORT(this.PORT);
    super.setTABLE(this.DB);
    super.setUSER(this.USER);
    super.setPASS(this.PASS);
    super.setURL(this.URL);
  }

  @Override
  public Connection connect() {
    return super.connect();
  }

  @Override
  public void close(ResultSet rs, PreparedStatement pstmt, Connection conn) {
    super.close(rs, pstmt, conn);
  }
}
