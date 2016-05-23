package com.furnit;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;

import com.furnit.model.Item;
import com.furnit.model.ItemDAO;
import com.furnit.model.ItemService;
import com.furnit.model.datajs;

import antlr.collections.List;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;

import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;

@Controller
public class FurnitController {

	@Autowired
    ItemService is;
	
	@RequestMapping(value="/" , method = RequestMethod.GET)
	public ModelAndView home() throws IOException{
		
		ModelAndView mav = new ModelAndView("index");
		
		return mav ;
	}
	
	@RequestMapping(value="/index" , method = RequestMethod.GET)
	public ModelAndView index() throws IOException{
		
		ModelAndView mav = new ModelAndView("index");
		
		return mav ;
	}
	
	@RequestMapping(value="/aboutus" , method = RequestMethod.GET)
	public ModelAndView aboutus() throws IOException{
		
		ModelAndView mav = new ModelAndView("aboutus");
		
		return mav ;
	}
	
	@RequestMapping(value="/contactus" , method = RequestMethod.GET)
	public ModelAndView contactus() throws IOException{
		
		ModelAndView mav = new ModelAndView("contactus");
		
		return mav ;
	}
	
	@RequestMapping(value="/login" , method = RequestMethod.GET)
	public ModelAndView login() throws IOException{
		
		ModelAndView mav = new ModelAndView("login");
		
		return mav ;
	}
	
	@RequestMapping(value="/signup" , method = RequestMethod.GET)
	public ModelAndView signup() throws IOException{
		
		ModelAndView mav = new ModelAndView("signup");
		
		return mav ;
	}
	
	private String getAllItems()
	{
		ArrayList<Item> li = (ArrayList<Item>)is.getAllItems(); 
		datajs dj = new datajs();
		
		for( Object x : li )
		{
			dj.addItem((Item)x);
			//System.out.println(x);
		}
		
		System.out.println(dj);
		
		return dj.toString();
	}
	
	@RequestMapping(value="/product" , method = RequestMethod.GET)
	public ModelAndView product() throws IOException{
		
		ModelAndView mav = new ModelAndView("product");
		
		mav.addObject("addItem", new Item() );
		mav.addObject("editItem", new Item() );
		mav.addObject("deleteItem", new Item() );
		mav.addObject("dataValue", getAllItems());
		mav.addObject("viewItem", new Item() );
		
		return mav ;
	}
	
	@RequestMapping(value="/InsertItem" , method = RequestMethod.POST)
	public ModelAndView productInsert(
					@ModelAttribute("addItem")Item i, 
					BindingResult bind
			   ) throws IOException{
		
		ModelAndView mav = new ModelAndView("product");
		
		is.insertItem( i );
		
		mav.addObject("dataValue", getAllItems());
		mav.addObject("addItem", new Item() );
		mav.addObject("deleteItem", new Item() );
		mav.addObject("editItem", new Item() );
		mav.addObject("viewItem", new Item() );
		
		return mav ;
	}
	
	@RequestMapping(value="/EditItem" , method = RequestMethod.POST)
	public ModelAndView productEdit(
					@ModelAttribute("editItem")Item i, 
					BindingResult bind
			   ) throws IOException{
		
		ModelAndView mav = new ModelAndView("product");
		
		System.out.println(i.getProductId());
		
		is.updateItem(i);
		
		mav.addObject("dataValue", getAllItems());
		mav.addObject("addItem", new Item() );
		mav.addObject("deleteItem", new Item() );
		mav.addObject("editItem", new Item() );
		mav.addObject("viewItem", new Item() );
		
		return mav ;
	}
	
	@RequestMapping(value="/DeleteItem" , method = RequestMethod.POST)
	public ModelAndView productDelete(
					@ModelAttribute("deleteItem")Item i, 
					BindingResult bind
			   ) throws IOException{
		
		ModelAndView mav = new ModelAndView("product");
		
		System.out.println( i.getProductId() );
		
		is.deleteItem(i.getProductId());
		
		mav.addObject("dataValue", getAllItems());
		mav.addObject("addItem", new Item() );
		mav.addObject("deleteItem", new Item() );
		mav.addObject("editItem", new Item() );
		mav.addObject("viewItem", new Item() );
		
		return mav ;
	}
	
	@RequestMapping(value="/ViewDetails" , method = RequestMethod.POST)
	public ModelAndView productViewDetails(
					@ModelAttribute("viewItem")Item i, 
					BindingResult bind
			   ) throws IOException{
		
		ModelAndView mav = new ModelAndView("viewdetails");
		
		mav.addObject("productimage", i.getImage() );
		mav.addObject("productId", i.getProductId() );
		mav.addObject("name", i.getName() );
		mav.addObject("groupName", i.getGroupName() );
		mav.addObject("description", i.getDescription() );
		mav.addObject("price", i.getPrice() );
		mav.addObject("qty", i.getQty() );
		
		return mav ;
	}
	
}
