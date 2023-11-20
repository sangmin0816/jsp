package com.samsam.vo;

import com.samsam.dto.Cart;
import com.samsam.dto.Product;


public class CartVO {
  private Cart cart;
  private Product product;

  public CartVO() {
  }

  public Cart getCart() {
    return cart;
  }

  public void setCart(Cart cart) {
    this.cart = cart;
  }

  public Product getProduct() {
    return product;
  }

  public void setProduct(Product product) {
    this.product = product;
  }
}
