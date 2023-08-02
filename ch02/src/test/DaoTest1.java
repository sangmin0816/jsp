package test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
public class DaoTest1 {
    static Connection conn = null;
    static PreparedStatement pstmt = null;
    static ResultSet rs = null;
    public static void main(String[] args) throws SQLException, ClassNotFoundException {
        DBC maria = new MariaDBC();
        conn = maria.connect();
        try{
            String sql = "select * from member";
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            List<Member> memList = new ArrayList<>();
            while(rs.next()){
                Member mem = new Member();
                mem.setId(rs.getString("id"));
                mem.setName(rs.getString("name"));
                mem.setEmail(rs.getString("email"));
                mem.setPw(rs.getString("pw"));
                mem.setRegdate(rs.getString("regdate"));
                mem.setTel(rs.getString("tel"));
                mem.setPoint(rs.getInt("point"));
                memList.add(mem);
            }
            for(Member m: memList){
                System.out.println(m.getId()+" "+m.getPw()+" "+m.getName());
            }
        } catch(Exception e){
            e.printStackTrace();
        } finally{
            maria.close(rs, pstmt, conn);
        }
    }
}
