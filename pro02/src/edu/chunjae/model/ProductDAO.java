package edu.chunjae.model;

import edu.chunjae.dto.Product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

public class ProductDAO {
    static DBC db = new MariaDBCon();
    static Connection conn = null;
    static PreparedStatement pstmt = null;
    static ResultSet rs = null;
    final static SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");


    public List<Product> getProductList(int category){
        String sql = "select * from product where category=?";
        List<Product> productList = new ArrayList<>();
        try {
            conn = db.connect();
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, category);
            rs = pstmt.executeQuery();
            while(rs.next()){
             productList.add(new Product(rs.getInt("id"), rs.getInt("category"), rs.getInt("price"), rs.getString("title"), rs.getString("content"), rs.getString("imgSrc"), sdf.format(rs.getDate("regdate"))));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            db.close(rs, pstmt, conn);
        }
        return productList;
    }

    public Product getProduct(int id){
        String sql = "select * from product where id=?";
        Product product = new Product();
        try {
            conn = db.connect();
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, id);
            rs = pstmt.executeQuery();

            if(rs.next()){
                product = new Product(rs.getInt("id"), rs.getInt("category"), rs.getInt("price"), rs.getString("title"), rs.getString("content"), rs.getString("imgSrc"), sdf.format(rs.getDate("regdate")));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            db.close(rs, pstmt, conn);
        }
        return product;
    }

    public int addProduct(Product product){
        int cnt = 0;

        conn = db.connect();
        String sql = "insert into product(category, price, title, content, imgSrc) values(?, ?, ?, ?, ?)";

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, product.getCategory());
            pstmt.setInt(2, product.getPrice());
            pstmt.setString(3, product.getTitle());
            pstmt.setString(4, product.getContent());
            pstmt.setString(5, product.getImgSrc());
            cnt = pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        db.close(rs, pstmt, conn);

        return cnt;
    }

    public int updateProduct(Product product){
        int cnt = 0;

        conn = db.connect();
        String sql = "update product set category=?, price=?, title=?, content=?, imgSrc=? where id=?";

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, product.getCategory());
            pstmt.setInt(2, product.getPrice());
            pstmt.setString(3, product.getTitle());
            pstmt.setString(4, product.getContent());
            pstmt.setString(5, product.getImgSrc());
            cnt = pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        db.close(rs, pstmt, conn);

        return cnt;
    }

    public int deleteProduct(int id){
        int cnt = 0;

        conn = db.connect();
        String sql = "delete from product where id=?";

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, id);
            cnt = pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        db.close(rs, pstmt, conn);

        return cnt;
    }
}
