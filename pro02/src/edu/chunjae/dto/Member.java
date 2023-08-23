package edu.chunjae.dto;

public class Member {
  private String id;
  private String pw;
  private String name;
  private String tel;
  private String email;
  private String birth;
  private String regdate;
  private String postcode;
  private String address1;
  private String address2;

  public String getPostcode() {
    return postcode;
  }

  public void setPostcode(String postcode) {
    this.postcode = postcode;
  }

  public String getAddress1() {
    return address1;
  }

  public void setAddress1(String address1) {
    this.address1 = address1;
  }

  public String getAddress2() {
    return address2;
  }

  public void setAddress2(String address2) {
    this.address2 = address2;
  }

  public Member() {
  }

  public Member(String id, String pw, String name, String tel, String email, String birth, String regdate, String postcode, String address1, String address2) {
    this.id = id; this.pw = pw; this.name = name; this.tel = tel; this.email = email; this.birth = birth; this.regdate = regdate; this.postcode=postcode; this.address1=address1; this.address2=address2;
  }

  public String getId() {
    return id;
  }

  public void setId(String id) {
    this.id = id;
  }

  public String getPw() {
    return pw;
  }

  public void setPw(String pw) {
    this.pw = pw;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public String getTel() {
    return tel;
  }

  public void setTel(String tel) {
    this.tel = tel;
  }

  public String getEmail() {
    return email;
  }

  public void setEmail(String email) {
    this.email = email;
  }

  public String getBirth() {
    return birth;
  }

  public void setBirth(String birth) {
    this.birth = birth;
  }

  public String getRegdate() {
    return regdate;
  }

  public void setRegdate(String regdate) {
    this.regdate = regdate;
  }
}