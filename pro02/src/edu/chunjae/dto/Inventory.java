package edu.chunjae.dto;

public class Inventory {
  private int id;
  private int product;
  private int quantity;
  private String listType;


  public Inventory() {
  }

  public Inventory(int product, int quantity, String listType) {
    this.product = product; this.quantity = quantity; this.listType = listType;
  }

  public Inventory(int id, int product, int quantity, String listType) {
    this.id = id; this.product = product; this.quantity = quantity; this.listType = listType;
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

  public int getQuantity() {
    return quantity;
  }

  public void setQuantity(int quantity) {
    this.quantity = quantity;
  }

  public String getListType() {
    return listType;
  }

  public void setListType(String listType) {
    this.listType = listType;
  }
}
