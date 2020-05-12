package com.plantshop.cart;

public class CartDataBean {
	private int cartno;
	private String uid;
	private int pid;
	private String pname;
	private String sname;
	private int quantity;
	private int price;
	private String small;

	public int getCartno() {
		return cartno;
	}

	public void setCartno(int cartno) {
		this.cartno = cartno;
	}

	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	public int getPid() {
		return pid;
	}

	public void setPid(int pid) {
		this.pid = pid;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public String getSname() {
		return sname;
	}

	public void setSname(String sname) {
		this.sname = sname;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getSmall() {
		return small;
	}

	public void setSmall(String small) {
		this.small = small;
	}

	@Override
	public String toString() {
		return "CartDataBean [cartno=" + cartno + ", uid=" + uid + ", pid=" + pid + ", pname=" + pname + ", sname="
				+ sname + ", quantity=" + quantity + ", price=" + price + ", small=" + small + "]";
	}

}
