package com.chunjae.test;

import com.chunjae.util.SHA256;

import java.security.NoSuchAlgorithmException;
import java.util.Scanner;

public class Sha256Test {
  public static void main(String[] args) {
    String pwd = "1234";
    Scanner sc = new Scanner(System.in);
    try {
      String crypt = SHA256.encrypt(pwd);
      System.out.println(pwd+" "+crypt+" "+crypt.length());
      System.out.print("비밀번호를 입력하세요: ");
      String pw = sc.nextLine(); // 글자 수 64
      if(SHA256.encrypt(pw).equals(crypt)){
        System.out.println("비밀번호가 일치합니다.");
      }

    } catch (NoSuchAlgorithmException e) {
      throw new RuntimeException(e);
    }
    sc.close();
  }
}
