// Source code is decompiled from a .class file using FernFlower decompiler.
package com.chunjae.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public interface DBC {
  Connection connect();

  void close(PreparedStatement var1, Connection var2);

  void close(ResultSet var1, PreparedStatement var2, Connection var3);
}
