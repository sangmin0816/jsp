package edu.chunjae.dto;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class Product {
  private int id;
  private int category;
  private int price = 0;
  private String title;
  private String content;
  public List<String> srcList = new ArrayList<>();
  private String imgSrc;
  private String regdate;

  public Product() {
  }

  public Product(int id, int category, int price, String title, String content, String imgSrc, String regdate) {
    this.id = id; this.category = category; this.price = price; this.title = title; this.content = content; this.imgSrc = imgSrc; this.regdate = regdate;
    this.setSrcList();
  }

  public void setSrcList() {
    this.srcList = new ArrayList<>(Arrays.asList(imgSrc.split(",")));
  }

  public int getId() {
    return id;
  }

  public void setId(int id) {
    this.id = id;
  }

  public int getCategory() {
    return category;
  }

  public void setCategory(int category) {
    this.category = category;
  }

  public int getPrice() {
    return price;
  }

  public void setPrice(int price) {
    this.price = price;
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

  public String getImgSrc() {
    return imgSrc;
  }

  public void setImgSrc(String imgSrc) {
    this.imgSrc = this.srcList.toString();
  }

  public String getRegdate() {
    return regdate;
  }

  public void setRegdate(String regdate) {
    this.regdate = regdate;
  }
}
