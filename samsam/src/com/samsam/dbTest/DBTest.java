package com.samsam.dbTest;

import com.samsam.db.DBC;
import com.samsam.db.MariaDBCon;
import com.samsam.dto.Member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DBTest {
    static Connection conn = null;
    static PreparedStatement pstmt = null;
    static ResultSet rs = null;

    public static void main(String[] args) {
        String sql = "select * from member";
        List<Member> memberList = new ArrayList<>();
        try {
            DBC con = new MariaDBCon();
            conn = con.connect();
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            while(rs.next()){
//                memberList.add(new Member(rs.getString("id"), rs.getString("pw"), rs.getString("name"), rs.getString("address"), rs.getString("tel"), rs.getString("email"), rs.getBoolean("state")));
            }
            for(Member m: memberList){
                System.out.println(m.toString());
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
