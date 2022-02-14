package DTO;

public class ProductDto {

	int product_id; // 제품번호 pk
	String product_name; // 제품명 
	int product_price; // 제품가격 
	String product_manufacturer; // 제조사 
	String product_category; // 카테고리 
	int product_stock; // 재고 
	int product_conditions; // 신상여부 
	String product_file; // 사진1 
	int product_activation; // 활성화
	int product_salesrate; // 판매수 
	
	public ProductDto( String product_name, int product_price, String product_manufacturer,
			String product_category, int product_stock, int product_conditions, String product_file,
			int product_activation, int product_salesrate) {
		
		this.product_name = product_name;
		this.product_price = product_price;
		this.product_manufacturer = product_manufacturer;
		this.product_category = product_category;
		this.product_stock = product_stock;
		this.product_conditions = product_conditions;
		this.product_file = product_file;
		this.product_activation = product_activation;
		this.product_salesrate = product_salesrate;
	}
	
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public int getProduct_price() {
		return product_price;
	}
	public void setProduct_price(int product_price) {
		this.product_price = product_price;
	}
	public String getProduct_manufacturer() {
		return product_manufacturer;
	}
	public void setProduct_manufacturer(String product_manufacturer) {
		this.product_manufacturer = product_manufacturer;
	}
	public String getProduct_category() {
		return product_category;
	}
	public void setProduct_category(String product_category) {
		this.product_category = product_category;
	}
	public int getProduct_stock() {
		return product_stock;
	}
	public void setProduct_stock(int product_stock) {
		this.product_stock = product_stock;
	}
	public int getProduct_conditions() {
		return product_conditions;
	}
	public void setProduct_conditions(int product_conditions) {
		this.product_conditions = product_conditions;
	}
	public String getProduct_file() {
		return product_file;
	}
	public void setProduct_file(String product_file) {
		this.product_file = product_file;
	}
	public int getProduct_activation() {
		return product_activation;
	}
	public void setProduct_activation(int product_activation) {
		this.product_activation = product_activation;
	}
	public int getProduct_salesrate() {
		return product_salesrate;
	}
	public void setProduct_salesrate(int product_salesrate) {
		this.product_salesrate = product_salesrate;
	}
	
}
