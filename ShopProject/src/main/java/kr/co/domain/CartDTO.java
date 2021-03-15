package kr.co.domain;

import java.io.Serializable;
import java.util.Date;

public class CartDTO implements Serializable{

	private static final long serialVersionUID = 1L;
	private String userid;
	private String productId;
	private int cartId;
	private int cart_qty;
	private Date regDate;
	
	public CartDTO() {
		// TODO Auto-generated constructor stub
	}

	public CartDTO(String userid, String productId, int cartId, int cart_qty, Date regDate) {
		super();
		this.userid = userid;
		this.productId = productId;
		this.cartId = cartId;
		this.cart_qty = cart_qty;
		this.regDate = regDate;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getProductId() {
		return productId;
	}

	public void setProductId(String productId) {
		this.productId = productId;
	}

	public int getCartId() {
		return cartId;
	}

	public void setCartId(int cartId) {
		this.cartId = cartId;
	}

	public int getCart_qty() {
		return cart_qty;
	}

	public void setCart_qty(int cart_qty) {
		this.cart_qty = cart_qty;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + cartId;
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
		CartDTO other = (CartDTO) obj;
		if (cartId != other.cartId)
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "CartDTO [userid=" + userid + ", productId=" + productId + ", cartId=" + cartId + ", cart_qty="
				+ cart_qty + ", regDate=" + regDate + "]";
	}
	
	

}
