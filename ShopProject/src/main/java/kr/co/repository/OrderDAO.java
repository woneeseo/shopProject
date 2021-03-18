package kr.co.repository;

import java.util.List;

import kr.co.domain.OrderDTO;

public interface OrderDAO {

	void insert(OrderDTO orderDTO);

	List<OrderDTO> myOrderList(String userid);

	List<OrderDTO> list();

	List<OrderDTO> selectByOrderId(String orderId);

	boolean updateDelSitu(OrderDTO orderDTO);

}
