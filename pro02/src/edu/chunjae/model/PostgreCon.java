package edu.chunjae.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class PostgreCon extends DBC {
  final String DRIVER = "org.postgresql.Driver";
  final String PORT = "5432/";
  final String URL = "jdbc:postgresql://"+super.getDNS()+PORT+super.getDB();

  public PostgreCon() {
    super();
    super.setDRIVER(this.DRIVER);
    super.setPORT(this.PORT);
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
