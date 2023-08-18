package edu.chunjae.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class PostgreCon extends DBC {
  final String DRIVER = "org.postgresql.Driver";
  final String DNS = "localhost:";
  final String PORT = "5432/";
  private String DB = "shop";
  final String USER = "postgres";
  final String PASS = "1234";
  final String URL = "jdbc:postgresql://"+DNS+PORT+DB;

  public PostgreCon() {
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
  public void setTABLE(String DB) {
    this.DB = DB;
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
