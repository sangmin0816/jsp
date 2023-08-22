package edu.chunjae.dto;

public class Category {
  private int id;
  private String main;
  private String sub;

  public Category() {
  }

  public Category(int id, String main, String sub) {
    this.id = id; this.main = main; this.sub = sub;
  }

  public int getId() {
    return id;
  }

  public void setId(int id) {
    this.id = id;
  }

  public String getMain() {
    return main;
  }

  public void setMain(String main) {
    this.main = main;
  }

  public String getSub() {
    return sub;
  }

  public void setSub(String sub) {
    this.sub = sub;
  }
}
