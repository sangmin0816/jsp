package edu.chunjae.dto;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class Video {
  private int id;
  private int product;
  private String title;
  public List<String> srcList = new ArrayList<>();
  private String vidSrc;

  public Video() {
  }

  public Video(int id, int product, String title, String vidSrc) {
    this.id = id; this.product = product; this.title = title; this.vidSrc = vidSrc;
    this.setSrcList();
  }

  public void setSrcList() {
    this.srcList = new ArrayList<>(Arrays.asList(vidSrc.split(",")));
  }

  public int getId() {
    return id;
  }

  public void setId(int id) {
    this.id = id;
  }

  public int getProduct() {
    return product;
  }

  public void setProduct(int product) {
    this.product = product;
  }

  public String getTitle() {
    return title;
  }

  public void setTitle(String title) {
    this.title = title;
  }

  public String getVidSrc() {
    return vidSrc;
  }

  public void setVidSrc(String vidSrc) {
    this.vidSrc = this.srcList.toString();
  }
}
