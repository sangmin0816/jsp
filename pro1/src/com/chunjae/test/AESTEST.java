package com.chunjae.test;

import com.chunjae.db.DBC;
import com.chunjae.db.MariaDBCon;
import com.chunjae.dto.Member;
import com.chunjae.util.AES256;

import javax.crypto.BadPaddingException;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import java.io.UnsupportedEncodingException;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;
import java.security.spec.InvalidParameterSpecException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class AESTEST {
  public static void main(String[] args) throws NoSuchPaddingException, UnsupportedEncodingException, IllegalBlockSizeException, NoSuchAlgorithmException, InvalidKeySpecException, InvalidParameterSpecException, BadPaddingException, InvalidKeyException, InvalidAlgorithmParameterException {
    String key = "%02x";
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    DBC con = new MariaDBCon();
    conn = con.connect();

    String sql = "";
    sql = "select * from member";

    List<Member> memberList = new ArrayList<>();

    try {
      pstmt = conn.prepareStatement(sql);
      rs = pstmt.executeQuery();

      while(rs.next()){
        Member temp = new Member();
        temp.setId(rs.getString("id"));
        String pw = rs.getString("pw");
        String crypt = AES256.decryptAES256(pw, key);
        temp.setPw(crypt);
        memberList.add(temp);
      }

      for(Member m: memberList){
        sql = "update member set pw=? where id=?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, m.getPw());
        pstmt.setString(2, m.getId());
        int cnt = pstmt.executeUpdate();
        if(cnt>0){
          System.out.println(m.getId()+"가 암호화 되었습니다");
        }
      }
    } catch (SQLException e) {
      throw new RuntimeException(e);
    }
  }
}
