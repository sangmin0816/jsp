package com.samsam.model;

import com.samsam.db.DBC;
import com.samsam.db.MariaDBCon;
import com.samsam.dto.Member;
import com.samsam.dto.Product;
import com.samsam.dto.Profit;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

public class ProductDAO {
  static DBC db = new MariaDBCon();
  Connection conn = null;
  PreparedStatement pstmt = null;
  ResultSet rs = null;
  final static SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

  public ProductDAO() {
  }

  public List<Product> getNewProductLis(){
    conn = db.connect();
    List<Product> productList = new ArrayList<>();

    String sql = "select * from product limit 0, 8";
    try {
      pstmt = conn.prepareStatement(sql);
      rs = pstmt.executeQuery();

      while(rs.next()){
        String regdate = sdf.format(rs.getDate("regdate"));
        Product product = new Product();
        product.setProNo(rs.getInt("proNo"));
        product.setCategoryNo(rs.getInt("categoryNo"));
        product.setPrice(rs.getInt("price"));
        product.setTitle(rs.getString("title"));
        product.setThumbnail(rs.getString("thumbnail"));
        product.setInfo(rs.getString("info"));
        product.setContent(rs.getString("content"));
        product.setRegdate(regdate);
        product.setImg(rs.getString("img"));
        product.setVideo(rs.getString("video"));
        productList.add(product);
      }

    } catch (Exception e) {
      throw new RuntimeException(e);
    } finally{
      db.close(rs, pstmt, conn);
    }

    return productList;
  }


  public List<Product> getProductList(){
    conn = db.connect();
    List<Product> productList = new ArrayList<>();

    String sql = "select * from product";
    try {
      pstmt = conn.prepareStatement(sql);
      rs = pstmt.executeQuery();

      while(rs.next()){
        String regdate = sdf.format(rs.getDate("regdate"));
        Product product = new Product();
        product.setProNo(rs.getInt("proNo"));
        product.setCategoryNo(rs.getInt("categoryNo"));
        product.setPrice(rs.getInt("price"));
        product.setTitle(rs.getString("title"));
        product.setThumbnail(rs.getString("thumbnail"));
        product.setInfo(rs.getString("info"));
        product.setContent(rs.getString("content"));
        product.setRegdate(regdate);
        product.setImg(rs.getString("img"));
        product.setVideo(rs.getString("video"));
        productList.add(product);
      }

    } catch (Exception e) {
      throw new RuntimeException(e);
    } finally{
      db.close(rs, pstmt, conn);
    }

    return productList;
  }

  public Product getProduct(int proNo){
    conn = db.connect();
    Product product = new Product();

    String sql = "select * from product where proNo=?";
    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, proNo);
      rs = pstmt.executeQuery();

      while(rs.next()){
        String regdate = sdf.format(rs.getDate("regdate"));
        product.setProNo(rs.getInt("proNo"));
        product.setCategoryNo(rs.getInt("categoryNo"));
        product.setPrice(rs.getInt("price"));
        product.setTitle(rs.getString("title"));
        product.setThumbnail(rs.getString("thumbnail"));
        product.setInfo(rs.getString("info"));
        product.setContent(rs.getString("content"));
        product.setRegdate(regdate);
        product.setImg(rs.getString("img"));
        product.setVideo(rs.getString("video"));
      }

    } catch (Exception e) {
      throw new RuntimeException(e);
    } finally{
      db.close(rs, pstmt, conn);
    }

    return product;
  }

  public int addProduct(Product product){
    conn = db.connect();
    int cnt = 0;



    String sql = "";
    try {
      conn.setAutoCommit(false);

      // 상품 추가
      sql = "insert into product(categoryNo, price, title, thumbnail, info, content, img, video) values(?, ?, ?, ?, ?, ?, ?, ?)";
      pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, product.getCategoryNo());
      pstmt.setInt(2, product.getPrice());
      pstmt.setString(3, product.getTitle());
      pstmt.setString(4, product.getThumbnail());
      pstmt.setString(5, product.getInfo());
      pstmt.setString(6, product.getContent());
      pstmt.setString(7, product.getImg());
      pstmt.setString(8, product.getVideo());

      cnt = pstmt.executeUpdate();

      // 상품 입고, 출고
      sql = "insert into instock(proNo, amount, inPrice) values(?, ?, ?)";
      pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, product.getProNo());
      pstmt.setInt(2, 0);
      pstmt.setInt(3, 0);
      cnt += pstmt.executeUpdate();

      sql = "insert into outstock(proNo, amount, outPrice) values(?, ?, ?)";
      pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, product.getProNo());
      pstmt.setInt(2, 0);
      pstmt.setInt(3, 0);
      cnt += pstmt.executeUpdate();

      pstmt.close();
    } catch (Exception e) {
      throw new RuntimeException(e);
    }
    return cnt;
  }

  public int updateProduct(Product product){
    conn = db.connect();
    int cnt = 0;

    String sql = "update product set categoryNo=?, price=?, title=?, info=?, content=? where proNo=?";
    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, product.getCategoryNo());
      pstmt.setInt(2, product.getPrice());
      pstmt.setString(3, product.getTitle());
      pstmt.setString(4, product.getInfo());
      pstmt.setString(5, product.getContent());
      pstmt.setInt(6, product.getProNo());

      cnt = pstmt.executeUpdate();
    } catch (Exception e) {
      throw new RuntimeException(e);
    } finally{
      db.close(rs, pstmt, conn);
    }
    return cnt;
  }

  public int deleteProduct(int proNo){
    conn = db.connect();
    int cnt = 0;

    String sql = "delete from product where proNo=?";
    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, proNo);

      cnt = pstmt.executeUpdate();
    } catch (Exception e) {
      throw new RuntimeException(e);
    } finally{
      db.close(rs, pstmt, conn);
    }
    return cnt;
  }


  public List<Product> getCategoryProduct(int categoryNo){
      conn = db.connect();
      List<Product> productList = new ArrayList<>();

      String sql = "select * from product where categoryNo=?";
      try {
        pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, categoryNo);
        rs = pstmt.executeQuery();

        while(rs.next()){
          String regdate = sdf.format(rs.getDate("regdate"));
          Product product = new Product();
          product.setProNo(rs.getInt("proNo"));
          product.setCategoryNo(rs.getInt("categoryNo"));
          product.setPrice(rs.getInt("price"));
          product.setTitle(rs.getString("title"));
          product.setThumbnail(rs.getString("thumbnail"));
          product.setInfo(rs.getString("info"));
          product.setContent(rs.getString("content"));
          product.setRegdate(regdate);
          product.setImg(rs.getString("img"));
          product.setVideo(rs.getString("video"));
          productList.add(product);
        }

      } catch (Exception e) {
        throw new RuntimeException(e);
      } finally{
        db.close(rs, pstmt, conn);
      }

      return productList;
    }

    // 해당 상품의 재고 수량을 가져옴
  public int getAmount(int proNo){
    int amount = 0;
    conn = db.connect();

    String sql = "select * from inventory where proNo = ?";
    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, proNo);
      rs = pstmt.executeQuery();
      if(rs.next()){
        amount = rs.getInt("amount");
      }
    } catch (Exception e) {
      throw new RuntimeException(e);
    } finally {
      db.close(rs, pstmt, conn);
    }

    return amount;
  }

  public List<Profit> getProfitList(){
    List<Profit> profitList = new ArrayList<>();
    conn = db.connect();

    String sql = "select * from profit";
    try {
      pstmt = conn.prepareStatement(sql);
      rs = pstmt.executeQuery();
      while(rs.next()){
        Profit profit = new Profit();
        profit.setProNo(rs.getInt("proNo"));
        profit.setTot(rs.getInt("tot"));
        profitList.add(profit);
      }



    } catch (Exception e) {
      throw new RuntimeException(e);
    } finally {
      db.close(rs, pstmt, conn);
    }

    return profitList;
  }
}
