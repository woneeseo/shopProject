package kr.co.domain;

import java.io.Serializable;
import java.util.Arrays;
import java.util.Date;

public class ProductDTO implements Serializable{

	private static final long serialVersionUID = 1L;
	private String productId;
	private String productName;
	private int price;
	private int stock;
	private String productDist;
	private String productInfo;
	private Date regDate;
	private Date updateDate;
	private String[] files;
	private String fullname;
	
	
	public ProductDTO() {
		// TODO Auto-generated constructor stub
	}

	public ProductDTO(String productId, String productName, int price, int stock, String productDist,
			String productInfo) {
		super();
		this.productId = productId;
		this.productName = productName;
		this.price = price;
		this.stock = stock;
		this.productDist = productDist;
		this.productInfo = productInfo;
	}


	public ProductDTO(String productId, String productName, int price, int stock, String productDist,
			String productInfo, String[] files) {
		super();
		this.productId = productId;
		this.productName = productName;
		this.price = price;
		this.stock = stock;
		this.productDist = productDist;
		this.productInfo = productInfo;
		this.files = files;
	}

	public String[] getFiles() {
		return files;
	}

	public void setFiles(String[] files) {
		this.files = files;
	}

	public String getProductId() {
		return productId;
	}

	public void setProductId(String productId) {
		this.productId = productId;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getStock() {
		return stock;
	}

	public void setStock(int stock) {
		this.stock = stock;
	}

	public String getProductDist() {
		return productDist;
	}

	public void setProductDist(String productDist) {
		this.productDist = productDist;
	}

	public String getProductInfo() {
		return productInfo;
	}

	public void setProductInfo(String productInfo) {
		this.productInfo = productInfo;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public Date getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public String getFilename() {
		return fullname;
	}

	public void setFilename(String filename) {
		this.fullname = filename;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((productId == null) ? 0 : productId.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		ProductDTO other = (ProductDTO) obj;
		if (productId == null) {
			if (other.productId != null)
				return false;
		} else if (!productId.equals(other.productId))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "ProductDTO [productId=" + productId + ", productName=" + productName + ", price=" + price + ", stock="
				+ stock + ", productDist=" + productDist + ", productInfo=" + productInfo + ", regDate=" + regDate
				+ ", updateDate=" + updateDate + ", files=" + Arrays.toString(files) + "]";
	}
	
	
	
	
	

}
