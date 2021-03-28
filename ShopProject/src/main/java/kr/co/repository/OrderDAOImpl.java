package kr.co.repository;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.domain.CartDTO;
import kr.co.domain.OrderDTO;
import kr.co.domain.PageTO;
import kr.co.domain.ProductDTO;

@Repository
public class OrderDAOImpl implements OrderDAO{

	@Inject
	private SqlSession sqlSession;
	
	private final String NS = "kr.co.order";
	
	@Override
	public void insert(OrderDTO orderDTO) {
		
		int orderId = sqlSession.selectOne(NS+".countOrderId");
		orderDTO.setOrderId(orderId);
		
		sqlSession.insert(NS+".insert", orderDTO);
	}

	@Override
	public List<OrderDTO> myOrderList(String userid) {

		List<OrderDTO> myOrderList = sqlSession.selectList(NS+".myOrderList", userid);
		
		if (myOrderList.size() == 0) {	
			return null;
		} else {
			return myOrderList;
		}

	}

	@Override
	public List<OrderDTO> list(int curPage) {
		
		PageTO<ProductDTO> to = new PageTO<ProductDTO>(curPage);
		RowBounds rb = new RowBounds(to.getStartNum()-1, to.getPerPage());
		
		return sqlSession.selectList(NS+".list", null, rb);
	}

	@Override
	public List<OrderDTO> selectByOrderId(String orderId) {
		
		return sqlSession.selectList(NS+".selectByOrderId", orderId);
	}

	@Override
	public boolean updateDelSitu(OrderDTO orderDTO) {
		
		int result = sqlSession.update(NS+".updateDelSitu", orderDTO);
		if (result == 1) {
			
			return true;
		} else {
			return false;
		}
		
	}

	@Override
	public boolean delFromCart(CartDTO cartDTO) {
		
		int result = sqlSession.delete(NS+".delFromCart", cartDTO);
		if (result == 1) {
			return true;
		} else {
			return false;
		}		
	}

	@Override
	public int orderCancel(OrderDTO orderDTO) {
		
		return sqlSession.delete(NS+".orderCancel", orderDTO);
	}

	@Override
	public int getAmount() {
		
		return sqlSession.selectOne(NS+".getAmount");
	}


}
