package test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Scanner;

public class DaoTest2 {
    static Connection conn = null;
    static PreparedStatement pstmt = null;
    static ResultSet rs = null;
    public static void main(String[] args) throws SQLException, ClassNotFoundException {
        Scanner sc = new Scanner(System.in);


        DBC maria = new MariaDBC();
        conn = maria.connect();
        try{
            System.out.print("id를 입력하세요: ");
            String id = sc.nextLine();
            String sql = "select * from member where id=?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();
            while(rs.next()){
                String name = rs.getString("name");
                System.out.println(name);
            }

//            System.out.println(rs.getString("id")+" "+rs.getString("pw")+" "+rs.getString("name"));

        } catch(Exception e){
            e.printStackTrace();
        } finally{
            maria.close(rs, pstmt, conn);
        }
    }
}
