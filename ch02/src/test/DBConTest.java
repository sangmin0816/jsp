package test;

import java.sql.*;

public class DBConTest {
    public static void main(String[] args) {
        final String DRIVER = "org.mariadb.jdbc.Driver"; // 마리아db lib의 패키지 안의 클래스
        final String DNS = "localhost"; // post server 주소
        final String PORT = "3306";
        final String NAME = "edu";
        final String USER = "root";
        final String PW = "1234";
        final String URL = "jdbc:mariadb://" +DNS+":"+PORT+"/"+NAME;
        // jdbc:mariadb://localhost:3306/edu
        // 프로토콜:디비종류://호스트주소:포트번호/데이터베이스

        Connection conn = null; // 연결자
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try{
            Class.forName(DRIVER); // 드라이버 로딩
            // 드라이버가 안 맞거나 없는 경우 에러 발생할 수 있다.
            conn = DriverManager.getConnection(URL,USER, PW); // 데이터베이스에 연결
            if(conn!=null) System.out.println("DB 연결 성공");
        } catch(ClassNotFoundException e){
            System.out.println("드라이버가 로딩되지 못했습니다.");
        } catch(SQLException e){
            System.out.println("DB 연결 실패");
            throw new RuntimeException(e);
        } catch (Exception e){
            e.printStackTrace();
        }

        try{
            //String sql = "select * from member where id='sam'";
            String select = "*";
            String id = "'admin'";
            String sql = "select "+select+" from member where id="+"'"+id+"'";
            System.out.println(sql);
            pstmt = conn.prepareStatement(sql); //  연결자 conn에 sql 구문 대입

            // pstmt.setString(1, id); // sql 구문 조건 대입
            rs = pstmt.executeQuery(); // sql 구문 실행하여 결과셋 저장

            // selct는 executeQuery() 사용함. 나머지는 excuteUpdate()가 되어야 함.
            while(rs.next()){
                System.out.println(rs.getString("id"));
                System.out.println(rs.getString("pw"));
                System.out.println(rs.getString("regdate")); // date는 getString, getDate 둘 다 사용 가능.
                System.out.println(rs.getInt("point"));
            }
        } catch(Exception e){
            System.out.println("SQL 구문에 오류가 있어 실행되지 못했습니다.");
            e.printStackTrace();
        } finally {
          if(rs!=null){
              try {
                  rs.close();
                  pstmt.close();
                  conn.close();
                  if(pstmt.isClosed()) System.out.println("pstmt closed");
              } catch (SQLException e) {
                  System.out.println("데이터베이스 작업을 종료하지 못했습니다.");
                  throw new RuntimeException(e);
              }
          }
        }
    }
}
