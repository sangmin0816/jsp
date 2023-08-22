package edu.chunjae.dto;

public class Payment {
  private int id;
  private String method;
  private String customer;
  private int product;
  private int price = 0;

  public Payment() {
  }

  public Payment(int id, String method, String customer, int product, int price) {
    this.id = id; this.method = method; this.customer = customer; this.product = product; this.price = price;
  }

  public int getId() {
    return id;
  }

  public void setId(int id) {
    this.id = id;
  }

  public String getMethod() {
    return method;
  }

  public void setMethod(String method) {
    this.method = method;
  }

  public String getCustomer() {
    return customer;
  }

  public void setCustomer(String customer) {
    this.customer = customer;
  }

  public int getProduct() {
    return product;
  }

  public void setProduct(int product) {
    this.product = product;
  }

  public int getPrice() {
    return price;
  }

  public void setPrice(int price) {
    this.price = price;
  }
}
