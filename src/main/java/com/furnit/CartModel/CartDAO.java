package com.furnit.CartModel;

import java.io.IOException;
import java.util.List;

import com.furnit.model.Item;

public interface CartDAO
{
	Cart getCartById(int cartId);

    void update(Cart cart);
    
    void add(Cart cart);
    
    void delete(int i);
    
    void deleteByProductId(int pid);
    
    public List<Cart> getAllItems();
}
