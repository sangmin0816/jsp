package io.github.sangmin0816.model;

import io.github.sangmin0816.dto.Member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

public class MemberDAO {
  static DBC db = new MariaDBCon();
  Connection conn = null;
  PreparedStatement pstmt = null;
  ResultSet rs = null;

  public MemberDAO() {
  }

  public List<Member> getMemberList(){
    conn = db.connect();
    List<Member> memberList = new ArrayList<>();
    String sql = "select * from member";

    try {
      pstmt = conn.prepareStatement(sql);
      rs = pstmt.executeQuery();

      while(rs.next()){
        memberList.add(new Member(rs.getString("id"), rs.getString("pw"), rs.getString("name"),rs.getString("tel"), rs.getString("email"), rs.getString("birth"), rs.getString("regdate")));
      }

    } catch (SQLException e) {
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
        member = new Member(rs.getString("id"), rs.getString("pw"), rs.getString("name"),rs.getString("tel"), rs.getString("email"), rs.getString("birth"), rs.getString("regdate"));
      }

    } catch (SQLException e) {
      throw new RuntimeException(e);
    } finally{
      db.close(rs, pstmt, conn);
    }

    return member;
  }

  public int addMember(Member member){
    int cnt = 0;

    conn = db.connect();
    String sql = "insert into member(id, pw, name, tel, email, birth, regdate) values(?, ?, ?, ?, ?, ?, ?)";

    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, member.getId());
      pstmt.setString(2, member.getPw());
      pstmt.setString(3, member.getName());
      pstmt.setString(4, member.getTel());
      pstmt.setString(5, member.getEmail());
      pstmt.setString(6, member.getBirth());
      pstmt.setString(7, member.getRegdate());

      cnt = pstmt.executeUpdate();

    } catch (SQLException e) {
      throw new RuntimeException(e);
    }

    db.close(rs, pstmt, conn);

    return cnt;
  }

  public int memberUpdate(Member member){
    int cnt = 0;

    conn = db.connect();
    String sql = "update member set pw=?, name=?, tel=?, email=?, birth=? where id=?";

    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, member.getPw());
      pstmt.setString(2, member.getName());
      pstmt.setString(3, member.getTel());
      pstmt.setString(4, member.getEmail());
      pstmt.setString(5, member.getBirth());
      pstmt.setString(6, member.getId());

      cnt = pstmt.executeUpdate();

    } catch (SQLException e) {
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
