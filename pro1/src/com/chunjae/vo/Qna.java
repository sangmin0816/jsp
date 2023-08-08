package com.chunjae.vo;

public class Qna {
  private int qno;
  private String title;
  private String content;
  private String author;
  private String name; // 실제 테이블과 달리 추가됨.
  private String resdate;
  private int cnt=0;
  private int lev=0;
  private int par;

  public Qna() {
  }

  public Qna(int qno, String title, String content, String author, String name, String resdate, int cnt, int lev, int par) {
    this.qno = qno;
    this.title = title;
    this.content = content;
    this.author = author;
    this.name = name;
    this.resdate = resdate;
    this.cnt = cnt;
    this.lev = lev;
    this.par = par;
  }

  public int getQno() {
    return qno;
  }

  public void setQno(int qno) {
    this.qno = qno;
  }

  public String getTitle() {
    return title;
  }

  public void setTitle(String title) {
    this.title = title;
  }

  public String getContent() {
    return content;
  }

  public void setContent(String content) {
    this.content = content;
  }

  public String getAuthor() {
    return author;
  }

  public void setAuthor(String author) {
    this.author = author;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public String getResdate() {
    return resdate;
  }

  public void setResdate(String resdate) {
    this.resdate = resdate;
  }

  public int getCnt() {
    return cnt;
  }

  public void setCnt(int cnt) {
    this.cnt = cnt;
  }

  public int getLev() {
    return lev;
  }

  public void setLev(int lev) {
    this.lev = lev;
  }

  public int getPar() {
    return par;
  }

  public void setPar(int par) {
    this.par = par;
  }

  public void print(){
    System.out.print(this.qno+"\t");
    System.out.print(this.title+"\t");
    System.out.print(this.content+"\t");
    System.out.print(this.author+"\t");
    System.out.print(this.name+"\t");
    System.out.print(this.resdate+"\t");
    System.out.print(this.cnt+"\t");
    System.out.print(this.lev+"\t");
    System.out.println(this.par+"\t");
  }
}