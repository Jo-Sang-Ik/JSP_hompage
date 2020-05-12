package com.plantshop.product;

public class ProductDataBean {
	private int id;
	private String category;
	private String wname;
	private String pname;
	private String sname;
	private int price;
	private int downprice;
	private String inputdate;
	private int stock;
	private String description;
	private String small_img;
	private String img1;
	private String img2;
	private String img3;
	private String img4;
	private int salecount;
	private String mditem;
	private String selling;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getWname() {
		return wname;
	}

	public void setWname(String wname) {
		this.wname = wname;
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

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getDownprice() {
		return downprice;
	}

	public void setDownprice(int downprice) {
		this.downprice = downprice;
	}

	public String getInputdate() {
		return inputdate;
	}

	public void setInputdate(String inputdate) {
		this.inputdate = inputdate;
	}

	public int getStock() {
		return stock;
	}

	public void setStock(int stock) {
		this.stock = stock;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getSmall_img() {
		return small_img;
	}

	public void setSmall_img(String small_img) {
		this.small_img = small_img;
	}

	public String getImg1() {
		return img1;
	}

	public void setImg1(String img1) {
		this.img1 = img1;
	}

	public String getImg2() {
		return img2;
	}

	public void setImg2(String img2) {
		this.img2 = img2;
	}

	public String getImg3() {
		return img3;
	}

	public void setImg3(String img3) {
		this.img3 = img3;
	}

	public String getImg4() {
		return img4;
	}

	public void setImg4(String img4) {
		this.img4 = img4;
	}

	public int getSalecount() {
		return salecount;
	}

	public void setSalecount(int salecount) {
		this.salecount = salecount;
	}

	public String getMditem() {
		return mditem;
	}

	public void setMditem(String mditem) {
		this.mditem = mditem;
	}

	public String getSelling() {
		return selling;
	}

	public void setSelling(String selling) {
		this.selling = selling;
	}

	@Override
	public String toString() {
		return "ProductDataBean [id=" + id + ", category=" + category + ", wname=" + wname + ", pname=" + pname
				+ ", sname=" + sname + ", price=" + price + ", downprice=" + downprice + ", inputdate=" + inputdate
				+ ", stock=" + stock + ", description=" + description + ", small_img=" + small_img + ", img1=" + img1
				+ ", img2=" + img2 + ", img3=" + img3 + ", img4=" + img4 + ", salecount=" + salecount + ", mditem="
				+ mditem + ", selling=" + selling + "]";
	}

}
