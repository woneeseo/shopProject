package kr.co.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.domain.ProductDTO;
import kr.co.repository.ProductDAO;

@Service
@Transactional
public class ProductServiceImpl implements ProductService{
	
	@Inject
	private ProductDAO productDAO;

	@Override
	public List<ProductDTO> list(int curPage) {
	
		return productDAO.list(curPage);
	}

	@Override
	public ProductDTO read(String productId) {
		
		ProductDTO dto = null;
		
		String filename = productDAO.getFilename(productId);
		dto = productDAO.read(productId);
		dto.setFilename(filename);

		return dto;
	}

	@Override
	public List<String> getAttaches(String productId) {
		
		return productDAO.getAttaches(productId);
	}

	@Override
	public ProductDTO updateUI(String productId) {
		
		return productDAO.read(productId);
	}

	@Override
	public void update(ProductDTO dto) {
		
		productDAO.update(dto);
		
		String[] arr = dto.getFiles();

		if (arr == null) {
			return;
		}
		
		productDAO.deleteFilesByBno(dto.getProductId());
		
		for(String filename : arr) {
			
			productDAO.addAttach(filename, dto.getProductId());
		}
	}

	@Override
	public void deleteFile(String filename) {
		productDAO.deleteFile(filename);
	}

	@Override
	public void delete(String productId) {
		productDAO.delete(productId);
	}

	@Override
	public void insert(ProductDTO dto) {

		productDAO.insert(dto);
		
		String[] arr = dto.getFiles();

		if (arr == null) {
			return;
		}
		
		for(String filename : arr) {
			
			productDAO.addAttach(filename, dto.getProductId());
		}
	}


	@Override
	public List<ProductDTO> getProductDistList(String productDist) {
		
		return productDAO.getProductDistList(productDist);
	}

	@Override
	public List<ProductDTO> newProductList() {
		
		return productDAO.newProductList();
	}

	@Override
	public List<ProductDTO> productList(int curPage) {
	
		return productDAO.productList(curPage);
	}

	@Override
	public int getAmount() {
		
		return productDAO.getAmount();
	}

}
