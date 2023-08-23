package edu.chunjae.model;

import edu.chunjae.dto.Member;
import edu.chunjae.util.AES256;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class MemberDAO {
  static DBC db = new MariaDBCon();
  Connection conn = null;
  PreparedStatement pstmt = null;
  ResultSet rs = null;
  String key = "%02x";

  public MemberDAO() {
  }



  public boolean loginMember(String id, String pw){
    conn = db.connect();

    String sql = "select * from member where id = ?";

    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, id);
      rs = pstmt.executeQuery();

      if(rs.next()){
        String decrypt = AES256.decryptAES256(rs.getString("pw"), key);
        if(decrypt.equals(pw)){
          return true;
        }
      }
    } catch (Exception e) {
      throw new RuntimeException(e);
    } finally{
      db.close(rs, pstmt, conn);
    }
    return false;
  }

  public boolean checkId(String id){
    conn = db.connect();

    String sql = "select * from member where id = ?";

    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, id);
      rs = pstmt.executeQuery();
      return rs.next();
    } catch (SQLException e) {
      throw new RuntimeException(e);
    } finally{
      db.close(rs, pstmt, conn);
    }
  }

  public List<Member> getMemberList(){
    conn = db.connect();
    List<Member> memberList = new ArrayList<>();
    String sql = "select * from member";

    try {
      pstmt = conn.prepareStatement(sql);
      rs = pstmt.executeQuery();

      while(rs.next()){
        String decrypt = AES256.decryptAES256(rs.getString("pw"), key);
        memberList.add(new Member(rs.getString("id"), decrypt, rs.getString("name"), rs.getString("tel"), rs.getString("email"), rs.getString("birth"), rs.getString("regdate"), rs.getString("address1"), rs.getString("address2")));
      }

    } catch (Exception e) {
      throw new RuntimeException(e);
    } finally{
      db.close(rs, pstmt, conn);
    }

    return memberList;
  }

  public Member getMember(String id){
    conn = db.connect();
    Member member = new Member();

    String sql = "select * from member where id = ?";

    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, id);
      rs = pstmt.executeQuery();

      if(rs.next()){
        String decrypt = AES256.decryptAES256(rs.getString("pw"), key);
        member = new Member(rs.getString("id"), decrypt, rs.getString("name"),rs.getString("tel"), rs.getString("email"), rs.getString("birth"), rs.getString("regdate"), rs.getString("address1"), rs.getString("address2"));
      }

    } catch (Exception e) {
      throw new RuntimeException(e);
    } finally{
      db.close(rs, pstmt, conn);
    }

    return member;
  }

  public int addMember(Member member){
    int cnt = 0;

    conn = db.connect();

    String sql = "insert into member(id, pw, name, tel, email, birth, address1, address2) values(?, ?, ?, ?, ?, ?, ?, ?)";

    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, member.getId());
      String encrypt = AES256.encryptAES256(member.getPw(), key);
      pstmt.setString(2, encrypt);

      pstmt.setString(3, member.getName());
      pstmt.setString(4, member.getTel());
      pstmt.setString(5, member.getEmail());
      pstmt.setString(6, member.getBirth());
      pstmt.setString(7, member.getAddress1());
      pstmt.setString(8, member.getAddress2());

      cnt = pstmt.executeUpdate();

    } catch (Exception e) {
      throw new RuntimeException(e);
    }

    db.close(rs, pstmt, conn);

    return cnt;
  }

  public int memberUpdate(Member member){
    int cnt = 0;

    conn = db.connect();
    String sql = "update member set pw=?, name=?, tel=?, email=?, birth=?, address1=?, address2=? where id=?";

    try {
      pstmt = conn.prepareStatement(sql);
      String encrypt = AES256.encryptAES256(member.getPw(), key);
      pstmt.setString(1, encrypt);
      pstmt.setString(2, member.getName());
      pstmt.setString(3, member.getTel());
      pstmt.setString(4, member.getEmail());
      pstmt.setString(5, member.getBirth());
      pstmt.setString(6, member.getAddress1());
      pstmt.setString(7, member.getAddress2());
      pstmt.setString(8, member.getId());

      cnt = pstmt.executeUpdate();

    } catch (Exception e) {
      throw new RuntimeException(e);
    } finally{
      db.close(rs, pstmt, conn);
    }

    return cnt;
  }

  public int deleteMember(String id){
    int cnt = 0;

    conn = db.connect();

    String sql = "delete from member where id=?";

    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, id);

      cnt = pstmt.executeUpdate();

    } catch (SQLException e) {
      throw new RuntimeException(e);
    } finally{
      db.close(rs, pstmt, conn);
    }

    return cnt;
  }

}
