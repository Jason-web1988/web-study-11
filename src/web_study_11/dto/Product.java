package web_study_11.dto;

public class Product {
	private int code;
	private String name;
	private int price;
	private String description;
	private String pictureUrl;
	
	public Product() {}

	public Product(int code) {
		super();
		this.code = code;
	}

	public Product(int code, String name, int price, String description, String pictureUrl) {
		super();
		this.code = code;
		this.name = name;
		this.price = price;
		this.description = description;
		this.pictureUrl = pictureUrl;
	}

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getPictureUrl() {
		return pictureUrl;
	}

	public void setPictureUrl(String pictureUrl) {
		this.pictureUrl = pictureUrl;
	}

	@Override
	public String toString() {
		return String.format("Product [code=%s, name=%s, price=%s, description=%s, prictureUrl=%s]", code, name, price,
				description, pictureUrl);
	}
	

}
