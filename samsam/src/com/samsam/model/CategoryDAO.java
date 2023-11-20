package com.samsam.model;

import com.samsam.db.DBC;
import com.samsam.db.MariaDBCon;
import com.samsam.dto.Category;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class CategoryDAO {
  static DBC db = new MariaDBCon();
  Connection conn = null;
  PreparedStatement pstmt = null;
  ResultSet rs = null;

  public CategoryDAO() {
  }

  public List<Category> getCategoryList(){
    conn = db.connect();
    List<Category> categoryList = new ArrayList<>();

    String sql = "select * from category";
    try {
      pstmt = conn.prepareStatement(sql);
      rs = pstmt.executeQuery();

      while(rs.next()){
        categoryList.add(new Category(rs.getInt("categoryNo"), rs.getString("categoryName")));
      }

    } catch (Exception e) {
      throw new RuntimeException(e);
    } finally{
      db.close(rs, pstmt, conn);
    }

    return categoryList;
  }

  public Category getCategory(int categoryNo){
    conn = db.connect();
    Category category = new Category();

    String sql = "select * from category where categoryNo=?";
    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, categoryNo);
      rs = pstmt.executeQuery();

      if(rs.next()){
        category = new Category(rs.getInt("categoryNo"), rs.getString("categoryName"));
      }

    } catch (Exception e) {
      throw new RuntimeException(e);
    } finally{
      db.close(rs, pstmt, conn);
    }

    return category;
  }

  public int addCategory(Category cate){
    conn = db.connect();
    int cnt = 0;

    String sql = "insert into category(categoryName) values(?)";
    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, cate.getCategoryName());
      cnt = pstmt.executeUpdate();
    } catch (Exception e) {
      throw new RuntimeException(e);
    } finally{
      db.close(rs, pstmt, conn);
    }
    return cnt;
  }

  public int updateCategory(Category category){
    conn = db.connect();
    int cnt = 0;

    String sql = "update category set categoryName=? where categoryNo=?";
    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, category.getCategoryName());
      pstmt.setInt(2, category.getCategoryNo());
      cnt = pstmt.executeUpdate();
    } catch (Exception e) {
      throw new RuntimeException(e);
    } finally{
      db.close(rs, pstmt, conn);
    }
    return cnt;
  }
  public int deleteCategory(int categoryNo){
    conn = db.connect();
    int cnt = 0;

    String sql = "delete from category where categoryNo=?";
    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, categoryNo);
      cnt = pstmt.executeUpdate();
    } catch (Exception e) {
      throw new RuntimeException(e);
    } finally{
      db.close(rs, pstmt, conn);
    }
    return cnt;
  }
}
