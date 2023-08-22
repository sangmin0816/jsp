package edu.chunjae.dto;

public class Cart {
  private int id;
  private String customer;
  private int product;
  private int quantity;

  public Cart() {
  }

  public Cart(int id, String customer, int product, int quantity) {
    this.id = id; this.customer = customer; this.product = product; this.quantity = quantity;
  }

  public int getId() {
    return id;
  }

  public void setId(int id) {
    this.id = id;
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

  public int getQuantity() {
    return quantity;
  }

  public void setQuantity(int quantity) {
    this.quantity = quantity;
  }
}
