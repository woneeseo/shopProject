package kr.co.domain;

import java.io.Serializable;
import java.util.Date;

public class OrderDTO implements Serializable {

	private static final long serialVersionUID = 1L;
	private String productId;
	private String productName;
	private int price;
	private String productDist;
	private String productInfo;
	private String fullname;
	private int stock;
	
	private String userid;
	private String username;
	private String email;
	private int tel;
	private String useraddress;
	private String postcode;
	private int getPoint;
	
	private String selected_Opt;
	private String order_Qty;
	private Date orderDate;
	private int orderId;
	private int order_seq_num;
	private Date billingDate;
	private String deliver_msg;
	private int deliver_situ;
	private int totalAmount;
	private String cal_info;

	public OrderDTO() {
		// TODO Auto-generated constructor stub
	}
	

	public OrderDTO(String productId, String productName, int price, String productDist, String productInfo,
			String fullname, int stock, String userid, String username, String email, int tel, String useraddress,
			String postcode, int getPoint, String selected_Opt, String order_Qty, Date orderDate, int orderId,
			int order_seq_num, Date billingDate, String deliver_msg, int deliver_situ, int totalAmount,
			String cal_info) {
		super();
		this.productId = productId;
		this.productName = productName;
		this.price = price;
		this.productDist = productDist;
		this.productInfo = productInfo;
		this.fullname = fullname;
		this.stock = stock;
		this.userid = userid;
		this.username = username;
		this.email = email;
		this.tel = tel;
		this.useraddress = useraddress;
		this.postcode = postcode;
		this.getPoint = getPoint;
		this.selected_Opt = selected_Opt;
		this.order_Qty = order_Qty;
		this.orderDate = orderDate;
		this.orderId = orderId;
		this.order_seq_num = order_seq_num;
		this.billingDate = billingDate;
		this.deliver_msg = deliver_msg;
		this.deliver_situ = deliver_situ;
		this.totalAmount = totalAmount;
		this.cal_info = cal_info;
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

	public String getFullname() {
		return fullname;
	}

	public void setFullname(String fullname) {
		this.fullname = fullname;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getTel() {
		return tel;
	}

	public void setTel(int tel) {
		this.tel = tel;
	}

	public String getUseraddress() {
		return useraddress;
	}

	public void setUseraddress(String useraddress) {
		this.useraddress = useraddress;
	}

	public String getPostcode() {
		return postcode;
	}

	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}

	public String getSelected_Opt() {
		return selected_Opt;
	}

	public void setSelected_Opt(String selected_Opt) {
		this.selected_Opt = selected_Opt;
	}

	public String getOrder_Qty() {
		return order_Qty;
	}

	public void setOrder_Qty(String order_Qty) {
		this.order_Qty = order_Qty;
	}

	public Date getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

	public int getOrderId() {
		return orderId;
	}

	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}

	public int getOrder_seq_num() {
		return order_seq_num;
	}

	public void setOrder_seq_num(int order_seq_num) {
		this.order_seq_num = order_seq_num;
	}

	public Date getBillingDate() {
		return billingDate;
	}

	public void setBillingDate(Date billingDate) {
		this.billingDate = billingDate;
	}

	public String getDeliver_msg() {
		return deliver_msg;
	}

	public void setDeliver_msg(String deliver_msg) {
		this.deliver_msg = deliver_msg;
	}

	public int getDeliver_situ() {
		return deliver_situ;
	}

	public void setDeliver_situ(int deliver_situ) {
		this.deliver_situ = deliver_situ;
	}

	public int getTotalAmount() {
		return totalAmount;
	}

	public void setTotalAmount(int totalAmount) {
		this.totalAmount = totalAmount;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	

	public String getCal_info() {
		return cal_info;
	}

	public void setCal_info(String cal_info) {
		this.cal_info = cal_info;
	}

	public int getStock() {
		return stock;
	}

	public void setStock(int stock) {
		this.stock = stock;
	}

	public int getGetPoint() {
		return getPoint;
	}


	public void setGetPoint(int getPoint) {
		this.getPoint = getPoint;
	}


	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + orderId;
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
		OrderDTO other = (OrderDTO) obj;
		if (orderId != other.orderId)
			return false;
		return true;
	}

	
	
	

}
