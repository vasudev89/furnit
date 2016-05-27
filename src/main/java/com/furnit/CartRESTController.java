package com.furnit;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.util.UriComponentsBuilder;

import com.fasterxml.jackson.databind.util.JSONPObject;
import com.furnit.CartModel.Cart;
import com.furnit.CartModel.CartService;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

@CrossOrigin(origins = "http://localhost:9001", maxAge = 3600)
@RestController
public class CartRESTController {
	
	@Autowired
	CartService cs;
	
	//-------------------Create a User--------------------------------------------------------
	
	@CrossOrigin
    @RequestMapping(value = "/flows/createItem/", method = RequestMethod.POST)
    public ResponseEntity<String> createUser(HttpServletResponse response,@RequestBody JSONObject cart,    UriComponentsBuilder ucBuilder) {
        
		System.out.println(cart.get("ProductID"));
        
		Cart mycart = new Cart();
		
		mycart.setName(cart.get("Name").toString());
		String price = cart.get("Price").toString();
		mycart.setPrice(price.substring(0, price.length()-1));
		mycart.setAddress(cart.get("Address").toString());
		mycart.setProductID(cart.get("ProductID").toString());
		mycart.setQty(cart.get("Qty").toString());
		mycart.setUserID(cart.get("UserName").toString());
		mycart.setAddress(cart.get("Address").toString());
		mycart.setBillingAddress(cart.get("BillingAddress").toString());
		
		System.out.println(cart.get("UserName").toString());
		
		cs.add(mycart);
		
		JSONArray ja = new JSONArray();
		
        JSONObject json = new JSONObject();
        
        json.put("Key1", "Value1");
        ja.add(json);
        
        System.out.println(ja.toString());
        
        System.out.println(json.toString());
        
        return new ResponseEntity<String>(json.toString(), HttpStatus.CREATED);
    }
	
	//-------------------Create a User--------------------------------------------------------
	
		@CrossOrigin
	    @RequestMapping(value = "/flows/fetchitems/", method = RequestMethod.POST)
	    public ResponseEntity<String> fetchAllItems(HttpServletResponse response,    UriComponentsBuilder ucBuilder) {
	        
			List<Cart> l = cs.getAllItems();
			
			JSONArray ja = new JSONArray();
			
			System.out.println(ja);
			
			for( Cart cart: l )
			{
				JSONObject json = new JSONObject();
		        
				json.put("CartID", cart.getCartID());
				json.put("ProductID", cart.getProductID());
		        json.put("Name", cart.getName());
		        json.put("Address", cart.getAddress());
		        json.put("BillingAddress", cart.getBillingAddress());
		        json.put("UserName", cart.getUserID());
		        json.put("Qty", cart.getQty());
		        json.put("Price", cart.getPrice());
		        
		        ja.add(json);
		        
		        System.out.println(json.toString());
			}
			
			System.out.println(ja.toJSONString());
	        
	        return new ResponseEntity<String>(ja.toJSONString(), HttpStatus.CREATED);
	    }
		
		@CrossOrigin
	    @RequestMapping(value = "/flows/deleteItem/{id}", method = RequestMethod.POST)
	    public ResponseEntity<String> deleteItem(HttpServletResponse response, @PathVariable("id") int i,   UriComponentsBuilder ucBuilder) {
	        
			System.out.println(i);
			
			cs.delete(i);
			
			List<Cart> l = cs.getAllItems();
			
			JSONArray ja = new JSONArray();
			
			System.out.println(ja);
			
			for( Cart cart: l )
			{
				JSONObject json = new JSONObject();
		        
				json.put("CartID", cart.getCartID());
				json.put("ProductID", cart.getProductID());
		        json.put("Name", cart.getName());
		        json.put("Address", cart.getAddress());
		        json.put("UserName", cart.getUserID());
		        json.put("Qty", cart.getQty());
		        json.put("Price", cart.getPrice());
		        
		        ja.add(json);
		        
		        System.out.println(json.toString());
			}
			
			System.out.println(ja.toJSONString());
	        
	        return new ResponseEntity<String>(ja.toJSONString(), HttpStatus.CREATED);
	    }
		
		//-------------------Update Addresses--------------------------------------------------------
		
		@CrossOrigin
	    @RequestMapping(value = "/flows/updateAddresses/", method = RequestMethod.POST)
	    public ResponseEntity<String> updateAddresses(HttpServletResponse response,@RequestBody JSONObject address,    UriComponentsBuilder ucBuilder) {
	        
			List<Cart> l = cs.getAllItems();	        
			
			for( Cart cart: l )
			{
				cart.setAddress(address.get("shippingAddress").toString());
				cart.setBillingAddress(address.get("billingAddress").toString());
				
				cs.update(cart);
			}
			
			JSONObject json = new JSONObject();
	        	        
	        json.put("status", "Updated");
	        
	        System.out.println(json.toString());
	        
	        return new ResponseEntity<String>(json.toString(), HttpStatus.CREATED);
	    }
	
}
