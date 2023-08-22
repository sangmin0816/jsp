package edu.chunjae.dto;

public class Delivery {
  private int id;
  private int payment;
  private String customer;
  private String address;
  private String customer_tel;
  private String company;
  private String tel;
  private int state = 0;
  private String tracking;

  public Delivery() {
  }

  public Delivery(int id, int payment, String customer, String address, String customer_tel, String company, String tel, int state, String tracking) {
    this.id = id; this.payment = payment; this.customer = customer; this.address = address; this.customer_tel = customer_tel; this.company = company; this.tel = tel; this.state = state; this.tracking = tracking;
  }

  public int getId() {
    return id;
  }

  public void setId(int id) {
    this.id = id;
  }

  public int getPayment() {
    return payment;
  }

  public void setPayment(int payment) {
    this.payment = payment;
  }

  public String getCustomer() {
    return customer;
  }

  public void setCustomer(String customer) {
    this.customer = customer;
  }

  public String getAddress() {
    return address;
  }

  public void setAddress(String address) {
    this.address = address;
  }

  public String getCustomer_tel() {
    return customer_tel;
  }

  public void setCustomer_tel(String customer_tel) {
    this.customer_tel = customer_tel;
  }

  public String getCompany() {
    return company;
  }

  public void setCompany(String company) {
    this.company = company;
  }

  public String getTel() {
    return tel;
  }

  public void setTel(String tel) {
    this.tel = tel;
  }

  public int getState() {
    return state;
  }

  public void setState(int state) {
    this.state = state;
  }

  public String getTracking() {
    return tracking;
  }

  public void setTracking(String tracking) {
    this.tracking = tracking;
  }
}
