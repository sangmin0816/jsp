package edu.chunjae.model;

import edu.chunjae.dto.Inventory;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

public class InventoryDAO {
  static DBC db = new MariaDBCon();
  Connection conn = null;
  PreparedStatement pstmt = null;
  ResultSet rs = null;
  final static SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

  public InventoryDAO() {
  }

  public List<Inventory> getInventoryList(){
    conn = db.connect();
    List<Inventory> inventoryList = new ArrayList<>();
    String sql = "select * from inventory";

    try {
      pstmt = conn.prepareStatement(sql);
      rs = pstmt.executeQuery();

      while(rs.next()){
        inventoryList.add(new Inventory(rs.getInt("id"), rs.getInt("product"), rs.getInt("quantity"), rs.getString("listType")));
      }
    } catch (SQLException e) {
      throw new RuntimeException(e);
    } finally{
      db.close(rs, pstmt, conn);
    }

    return inventoryList;
  }

  public List<Inventory> getInstock(){
    conn = db.connect();
    List<Inventory> instock = new ArrayList<>();
    String sql = "select * from instock";

    try {
      pstmt = conn.prepareStatement(sql);
      rs = pstmt.executeQuery();

      while(rs.next()){
        instock.add(new Inventory(rs.getInt("product"), rs.getInt("quantity"), rs.getString("listType")));
      }
    } catch (SQLException e) {
      throw new RuntimeException(e);
    } finally{
      db.close(rs, pstmt, conn);
    }

    return instock;
  }

  public List<Inventory> getOutstock(){
    conn = db.connect();
    List<Inventory> outstock = new ArrayList<>();
    String sql = "select * from outstock";

    try {
      pstmt = conn.prepareStatement(sql);
      rs = pstmt.executeQuery();

      while(rs.next()){
        outstock.add(new Inventory(rs.getInt("product"), rs.getInt("quantity"), rs.getString("listType")));
      }
    } catch (SQLException e) {
      throw new RuntimeException(e);
    } finally{
      db.close(rs, pstmt, conn);
    }

    return outstock;
  }

  public List<Inventory> getStockList(){
    conn = db.connect();
    List<Inventory> stockList = new ArrayList<>();
    String sql = "select * from stock";

    try {
      pstmt = conn.prepareStatement(sql);
      rs = pstmt.executeQuery();

      while(rs.next()){
        stockList.add(new Inventory(rs.getInt("product"), rs.getInt("quantity"), rs.getString("listType")));
      }
    } catch (SQLException e) {
      throw new RuntimeException(e);
    } finally{
      db.close(rs, pstmt, conn);
    }

    return stockList;
  }

  public Inventory getStock(int product){
    conn = db.connect();
    Inventory stock = new Inventory();
    String sql = "select * from stock where product = ?";

    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, product);
      rs = pstmt.executeQuery();

      while(rs.next()){
        stock = new Inventory(rs.getInt("product"), rs.getInt("quantity"), rs.getString("listType"));
      }
    } catch (SQLException e) {
      throw new RuntimeException(e);
    } finally{
      db.close(rs, pstmt, conn);
    }

    return stock;
  }

  public int addInstock(int product, int quantity){
    conn = db.connect();
    int cnt = 0;
    String sql = "insert into inventory(product, quantity, listType) values(?, ?, 'in')";

    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, product);
      pstmt.setInt(2, quantity);
      cnt = pstmt.executeUpdate();
      return cnt;
    } catch (SQLException e) {
      System.out.println("오류로 인해 입고가 처리되지 못했습니다.");
      throw new RuntimeException(e);
    } finally{
      db.close(rs, pstmt, conn);
    }
  }

  public int addOutstock(int product, int quantity){
    conn = db.connect();

    if(quantity>0){quantity =(-1)*quantity;}

    int cnt = 0;
    String sql = "insert into inventory(product, quantity, listType) values(?, ?, 'out')";

    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, product);
      pstmt.setInt(2, quantity);
      cnt = pstmt.executeUpdate();
      return cnt;
    } catch (SQLException e) {
      System.out.println("오류로 인해  출고가 처리되지 못했습니다.");
      throw new RuntimeException(e);
    } finally{
      db.close(rs, pstmt, conn);
    }
  }

  // 지정한 수량으로 재고 변경
  public int updateStock(int product, int quantity){
    conn = db.connect();
    int cnt = 0;
    quantity = this.getStock(product).getQuantity()-quantity;

    String sql = "insert into inventory(product, quantity, listType) values(?, ?, 'force')";

    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, product);
      pstmt.setInt(2, quantity);
      cnt = pstmt.executeUpdate();
      return cnt;
    } catch (SQLException e) {
      System.out.println("오류로 인해  재고 변경이 처리되지 못했습니다.");
      throw new RuntimeException(e);
    } finally{
      db.close(rs, pstmt, conn);
    }
  }
}
