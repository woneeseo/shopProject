package kr.co.service;

import java.util.List;

import kr.co.domain.ProductDTO;

public interface ProductService {

	List<ProductDTO> list();

	ProductDTO read(String productId);

	List<String> getAttaches(String productId);

	ProductDTO updateUI(String productId);

	void update(ProductDTO dto);

	void deleteFile(String filename);

	void delete(String productId);

	void insert(ProductDTO dto);

	List<ProductDTO> getProductDistList(String productDist);

}
