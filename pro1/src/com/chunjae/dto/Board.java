package com.chunjae.dto;

public class Board {
  private int bno;
  private String title;
  private String contents;
  private String author;
  private String regdate;
  private int cnt;

  public Board() {
  }

  public Board(int bno, String title, String contents, String author, String regdate, int cnt) {
    this.bno = bno;
    this.title = title;
    this.contents = contents;
    this.author = author;
    this.regdate = regdate;
    this.cnt = cnt;
  }

  public int getBno() {
    return bno;
  }

  public void setBno(int bno) {
    this.bno = bno;
  }

  public String getTitle() {
    return title;
  }

  public void setTitle(String title) {
    this.title = title;
  }

  public String getContents() {
    return contents;
  }

  public void setContents(String contents) {
    this.contents = contents;
  }

  public String getAuthor() {
    return author;
  }

  public void setAuthor(String author) {
    this.author = author;
  }

  public String getRegdate() {
    return regdate;
  }

  public void setRegdate(String regdate) {
    this.regdate = regdate;
  }

  public int getCnt() {
    return cnt;
  }

  public void setCnt(int cnt) {
    this.cnt = cnt;
  }

  public void print(){
    System.out.print("bno: "+this.bno+"\t");
    System.out.print("title: "+this.title+"\t");
    System.out.print("contents: "+this.contents+"\t");
    System.out.print("author: "+this.author+"\t");
    System.out.print("regdate: "+this.regdate+"\t");
    System.out.println("cnt: "+this.cnt+"\t");
  }
}
