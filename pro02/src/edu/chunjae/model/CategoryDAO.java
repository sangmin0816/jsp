package edu.chunjae.model;

import edu.chunjae.dto.Category;
import edu.chunjae.dto.Member;
import edu.chunjae.util.AES256;
import org.checkerframework.checker.units.qual.C;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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
        categoryList.add(new Category(rs.getInt("id"), rs.getString("main"), rs.getString("sub")));
      }

    } catch (Exception e) {
      throw new RuntimeException(e);
    } finally{
      db.close(rs, pstmt, conn);
    }

    return categoryList;
  }

  public Category getCategory(int id){
    conn = db.connect();
    Category category = new Category();

    String sql = "select * from category where id=?";
    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, id);
      rs = pstmt.executeQuery();

      if(rs.next()){
        category = new Category(rs.getInt("id"), rs.getString("main"), rs.getString("sub"));
      }

    } catch (Exception e) {
      throw new RuntimeException(e);
    } finally{
      db.close(rs, pstmt, conn);
    }

    return category;
  }

  public int addCategory(String main, String sub){
    conn = db.connect();
    int cnt = 0;

    String sql = "insert into category(main, sub) values(?, ?)";
    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, main);
      pstmt.setString(2, sub);
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

    String sql = "update category set main=?, sub=? where id=?";
    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, category.getMain());
      pstmt.setString(2, category.getSub());
      pstmt.setInt(3, category.getId());
      cnt = pstmt.executeUpdate();
    } catch (Exception e) {
      throw new RuntimeException(e);
    } finally{
      db.close(rs, pstmt, conn);
    }
    return cnt;
  }
  public int deleteCategory(int id){
    conn = db.connect();
    int cnt = 0;

    String sql = "delete from category where id=?";
    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, id);
      cnt = pstmt.executeUpdate();
    } catch (Exception e) {
      throw new RuntimeException(e);
    } finally{
      db.close(rs, pstmt, conn);
    }
    return cnt;
  }
}
