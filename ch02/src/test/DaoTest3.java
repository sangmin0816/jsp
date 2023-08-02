package test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Scanner;

public class DaoTest3 {
    static Connection conn = null;
    static PreparedStatement pstmt = null;
    static ResultSet rs = null;

    public static void main(String[] args) {
        DBC maria = new MariaDBC();
        conn = maria.connect();

        try {
            Scanner sc = new Scanner(System.in);
            System.out.print("id를 입력하세요: ");
            String id = sc.nextLine();
            while(true){
                String sql2 = "select * from member where id=?";
                pstmt = conn.prepareStatement(sql2);
                pstmt.setString(1, id);
                rs = pstmt.executeQuery();
                if(rs.next()){
                    System.out.println("이미 있는 이름입니다. 다시 입력해주세요.");
                    System.out.print("id를 입력하세요: ");
                    id = sc.nextLine();
                } else{
                    break;
                }
            }

            System.out.print("pw를 입력하세요: ");
            String pw = sc.nextLine();
            System.out.print("name를 입력하세요: ");
            String name = sc.nextLine();
            System.out.print("tel를 입력하세요: ");
            String tel = sc.nextLine();
            System.out.print("email를 입력하세요: ");
            String email = sc.nextLine();

            String sql = "insert into member(id, pw, name, tel, email) values(?, ?, ?, ?, ?)";
            pstmt = conn.prepareStatement(sql);

            pstmt.setString(1, id);
            pstmt.setString(2, pw);
            pstmt.setString(3, name);
            pstmt.setString(4, tel);
            pstmt.setString(5, email);

            int cnt = pstmt.executeUpdate();
            System.out.println(cnt);
            if(cnt>0){
                System.out.println("회원등록이 성공적으로 처리되었습니다.");
            } else {
                System.out.println("회원가입이 실패했습니다.");
            }
            maria.close(pstmt, conn);
        } catch (SQLException e) {
            System.out.println("SQL 구문이 처리되지 못했습니다.");
        }

    }
}
