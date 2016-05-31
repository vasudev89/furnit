package com.furnit.CartModel;

import java.io.Serializable;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.furnit.model.ItemDAO;

@Service("CartService")
public class CartServiceImpl implements CartService
{
	@Autowired
    CartDAO dao;
	
	@Transactional
	public Cart getCartById(int cartId) {
		return dao.getCartById(cartId);
	}

	@Transactional
	public void update(Cart cart) {
		dao.update(cart);
	}

	@Transactional
	public void add(Cart cart) {
		dao.add(cart);
	}

	@Transactional
	public void delete(int i) {
		dao.delete(i);
	}

	@Transactional
	public List<Cart> getAllItems() {
		return dao.getAllItems();
	}

	@Transactional
	public Cart getCartByUsername(String Username) {
		return dao.getCartByUsername(Username);
	}

	@Transactional
	public String checkUsername(String Username){
		return dao.checkUsername(Username);
	}

}
