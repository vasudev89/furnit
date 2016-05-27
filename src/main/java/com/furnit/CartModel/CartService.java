package com.furnit.CartModel;

import java.util.List;

public interface CartService {
	Cart getCartById(int cartId);

    void update(Cart cart);
    
    void add(Cart cart);
    
    void delete(int i);
    
    public List<Cart> getAllItems();
}
