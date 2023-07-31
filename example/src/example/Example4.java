package example;

import java.util.Arrays;
public class Example4 {
    public static void main(String[] args) {
        String code = "801225-1278001";
        char m = code.charAt(7);
//특정 인덱스에 있는 문자 반환
        String gender = (m=='1' || m=='3') ? "남" : "여";
    //특정 번째(begin index) 부터 특정 번째 전(end index)까지 추출
         String yy = code.substring(0,2);
         String mm = code.substring(2,4);
         String dd = code.substring(4,6);
         System.out.println("성별 코드 : "+m);
         System.out.println("성별 : "+gender);
         System.out.println("생년월일 : "+(yy+"-"+mm+"-"+dd));
    }
}