package kr.co.repository;

import java.util.List;

import kr.co.domain.OrderDTO;
import kr.co.domain.ProductDTO;

public interface ProductDAO {

	List<ProductDTO> list();

	ProductDTO read(String productId);

	List<String> getAttaches(String productId);

	void update(ProductDTO dto);

	void deleteFile(String filename);

	void deleteFilesByBno(String productId);

	void addAttach(String filename, String productId);

	void delete(String productId);

	void insert(ProductDTO dto);

	String getFilename(String productId);

	List<ProductDTO> getProductDistList(String productDist);

	void minusProductStock(OrderDTO orderDTO);

	void plusSoldRate(OrderDTO orderDTO);

}
