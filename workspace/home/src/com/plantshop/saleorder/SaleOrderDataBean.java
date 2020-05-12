package com.plantshop.saleorder;

public class SaleOrderDataBean {
	private int id;
	private String uid;
	private String name;
	private String orderdate;
	private String address;
	private String tel;
	private String pay;
	private String cardno;
	private int productcount;
	private int total;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getOrderdate() {
		return orderdate;
	}

	public void setOrderdate(String orderdate) {
		this.orderdate = orderdate;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getPay() {
		return pay;
	}

	public void setPay(String pay) {
		this.pay = pay;
	}

	public String getCardno() {
		return cardno;
	}

	public void setCardno(String cardno) {
		this.cardno = cardno;
	}

	public int getProductcount() {
		return productcount;
	}

	public void setProductcount(int productcount) {
		this.productcount = productcount;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	@Override
	public String toString() {
		return "SaleOrderDataBean [id=" + id + ", uid=" + uid + ", name=" + name + ", orderdate=" + orderdate
				+ ", address=" + address + ", tel=" + tel + ", pay=" + pay + ", cardno=" + cardno + ", productcount="
				+ productcount + ", total=" + total + "]";
	}

}