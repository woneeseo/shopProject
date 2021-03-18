package kr.co.service;

import java.util.List;

import kr.co.domain.OrderDTO;

public interface OrderService {

	void insert(OrderDTO orderDTO);

	List<OrderDTO> myOrderList(String userid);

	List<OrderDTO> list();

	List<OrderDTO> selectByOrderId(String orderId);

	boolean updateDelSitu(OrderDTO orderDTO);

}
