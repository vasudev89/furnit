package com.furnit;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;

import com.furnit.UserModel.User;
import com.furnit.UserModel.UserService;
import com.furnit.UserModel.udatajs;
import com.furnit.UserRoles.UserRole;
import com.furnit.UserRoles.UserRoleService;
import com.furnit.model.Item;
import com.furnit.model.ItemDAO;
import com.furnit.model.ItemService;
import com.furnit.model.datajs;

import antlr.collections.List;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.web.bind.annotation.ModelAttribute;

import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

class Schema
{
	User u;
	boolean delete = false;
}

class UserBaseHandler
{
	private String UsersStatus = "";

	
	
	private ArrayList al = new ArrayList();
	
	public String getUsersStatus() {
		return UsersStatus;
	}

	public void setUsersStatus(String usersStatus) {
		UsersStatus = usersStatus;
	}

	@Override
	public String toString() {
		return UsersStatus ;
	}
	
	public ArrayList<Schema> getAl() {
		return al;
	}

	public void generateUsers()
	{
		String value = UsersStatus;
		
		value = value.replace("\\", "");
		value = value.replace("\"", "");
		
		value = value.replace("ID:", "");
		value = value.replace("Email:", "");
		value = value.replace("Username:", "");
		value = value.replace("Phone:", "");
		value = value.replace("Address:", "");
		value = value.replace("Role:", "");
		value = value.replace("Active:", "");
		value = value.replace("Delete:", "");
		
		value = value.replace("[{", "");
		value = value.replace("}]", "");
		
		value = value.replace("},{", ";;");
		
		String values[] = value.split(";;");
		
		
		
		for( String x:values )
		{
			String temp[] = x.split(",");
			
			System.out.println(x);
			
			for( int i = 0 ; i < temp.length ; i++ )
			{
				temp[i] = temp[i].trim();
				temp[i] = temp[i].replace("\"", "");
				System.out.println(temp[i]);
			}
			
			User u = new User();
			
			u.setID(Long.parseLong(temp[0]));
			u.setEmail(temp[1]);
			u.setUsername(temp[2]);
			u.setPhone(temp[3]);
			u.setAddress(temp[4]);
			u.setRole(Integer.parseInt(temp[5]));
			
			System.out.println(Boolean.parseBoolean(temp[6]));
			u.setActive(Boolean.parseBoolean(temp[6]));
			
			Schema s = new Schema();
			
			s.u = u;
			
			s.delete = Boolean.parseBoolean(temp[7]);
			
			al.add(s);
			
		}
		
	}

	
}

@Controller
public class FurnitController {

	@Autowired
    ItemService is;
	
	@Autowired
    UserRoleService urs;
	
	@Autowired
    UserService ur;
	
	@Autowired
    ServletContext context;
	
	@RequestMapping(value="/" , method = RequestMethod.GET)
	public ModelAndView home(HttpServletRequest request) throws IOException{
		
		ModelAndView mav = new ModelAndView("index");
		
		urs.generateUserRoles();
		
		return mav;
	}
	
	@RequestMapping(value="/index" , method = RequestMethod.GET)
	public ModelAndView index(HttpServletRequest request) throws IOException{
		
		ModelAndView mav = new ModelAndView("index");
		
		if (request.isUserInRole("USER")) {
	        System.out.println("Hi");
	    }
		
		return mav ;
	}
	
	@RequestMapping(value="/head" , method = RequestMethod.GET)
	public ModelAndView headGet(HttpServletRequest request) throws IOException{
		
		ModelAndView mav = new ModelAndView("head");
		
		if (request.isUserInRole("ADMIN")) {
	        mav.addObject("ADMIN", "ADMIN");
	    }
		
		return mav ;
	}
	
	@RequestMapping(value="/head" , method = RequestMethod.POST)
	public ModelAndView headPost() throws IOException{
		
		ModelAndView mav = new ModelAndView("head");
		
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
	
	@RequestMapping(value="/loginpage" , method = RequestMethod.GET)
	public ModelAndView login() throws IOException{
		
		ModelAndView mav = new ModelAndView("login");
		
		return mav ;
	}
	
	@RequestMapping(value="/logout", method = RequestMethod.GET)
	public String logoutPage (HttpServletRequest request, HttpServletResponse response) {
	    Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    if (auth != null){    
	        new SecurityContextLogoutHandler().logout(request, response, auth);
	    }
	    return "index";
	}
	
	
	@RequestMapping(value="/signup" , method = RequestMethod.GET)
	public ModelAndView signup() throws IOException{
		
		ModelAndView mav = new ModelAndView("signup");
		
		mav.addObject("addUser", new User());
		
		return mav ;
	}
	
	@RequestMapping(value="/InsertUser" , method = RequestMethod.POST)
	public ModelAndView userInsert(
					@Valid @ModelAttribute("addUser")User u, 
					BindingResult bind
			   ) throws IOException{
		
		ModelAndView mav = new ModelAndView("signup");
		
		System.out.println("In User Insert");
		
		if(bind.hasErrors())
		{
			mav.addObject("addUser", u);
		}	
		else
		{	
			if( !u.getPassword().equals(u.getCPassword()) )
			{
				mav.addObject("error", "Passwords do not match");
			}
			else
			{
				User validateuser = ur.getUser(u.getEmail());
				
				if( validateuser == null )
				{
					ur.insertUser(u);
					
					mav.addObject("success", "User Created Successfully");
					//mav.addObject("addUser", new User());
					
					mav = new ModelAndView("index");
				}
				else
				{
					mav.addObject("error", "User Already Exists");
				}
			}
			
			
		}
		
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
	
	private String getAllUsers()
	{
		ArrayList<User> li = (ArrayList<User>)ur.getAllUsers(); 
		udatajs dj = new udatajs();
		
		for( Object x : li )
		{
			dj.addUser((User)x);
			//System.out.println(x);
		}
		
		System.out.println(dj);
		
		return dj.toString();
	}
	
	@RequestMapping(value="/product" , method = RequestMethod.GET)
	public ModelAndView product(HttpServletRequest request) throws IOException{
		
		ModelAndView mav = new ModelAndView("product");
		
		if (request.isUserInRole("ADMIN")) {
	        mav.addObject("ADMIN", "ADMIN");
	    }
		
		mav.addObject("addItem", new Item() );
		mav.addObject("editItem", new Item() );
		mav.addObject("deleteItem", new Item() );
		mav.addObject("dataValue", getAllItems());
		mav.addObject("viewItem", new Item() );
		
		return mav ;
	}
	
	@RequestMapping(value="/InsertItem" , method = RequestMethod.POST)
	public ModelAndView productInsert(HttpServletRequest request,
					@ModelAttribute("addItem")Item i, 
					BindingResult bind
			   ) throws IOException{
		
		ModelAndView mav = new ModelAndView("product");
		
		if (request.isUserInRole("ADMIN")) {
	        mav.addObject("ADMIN", "ADMIN");
	    }
		
		is.insertItem( i );
		
		Item i1 = is.getItemWithMaxId();
		
		try
	    {
			String path = context.getRealPath("/");
	        
	        System.out.println(path);
	        
	        File directory = null;
	        
	        System.out.println(i.getFile());
	        
	        if (i.getFile().getContentType().contains("image"))
	        {
	            directory = new File(path + "\\resources\\images");
	            
	            System.out.println(directory);
	            
	            byte[] bytes = null;
	            File file = null;
	            bytes = i.getFile().getBytes();
	            
	            if (!directory.exists()) directory.mkdirs();
	            
	            file = new File(directory.getAbsolutePath() + System.getProperty("file.separator") + "image_" + i1.getProductId() + ".jpg");
	            
	            System.out.println(file.getAbsolutePath());
	            
	            BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(file));
	            stream.write(bytes);
	            stream.close();

	        }
	    }
	    catch (Exception e)
	    {
	    	e.printStackTrace();
	    }  
		
		mav.addObject("dataValue", getAllItems());
		mav.addObject("addItem", new Item() );
		mav.addObject("deleteItem", new Item() );
		mav.addObject("editItem", new Item() );
		mav.addObject("viewItem", new Item() );
		
		return mav ;
	}
	
	@RequestMapping(value="/EditItem" , method = RequestMethod.POST)
	public ModelAndView productEdit(HttpServletRequest request,
					@ModelAttribute("editItem")Item i, 
					BindingResult bind
			   ) throws IOException{
		
		ModelAndView mav = new ModelAndView("product");
		
		System.out.println(i.getProductId());
		
		if (request.isUserInRole("ADMIN")) {
	        mav.addObject("ADMIN", "ADMIN");
	    }
		
		is.updateItem(i);
		
		try
	    {
			String path = context.getRealPath("/");
	        
	        System.out.println(path);
	        
	        File directory = null;
	        
	        System.out.println(i.getFile());
	        
	        if (i.getFile().getContentType().contains("image"))
	        {
	            directory = new File(path + "\\resources\\images");
	            
	            System.out.println(directory);
	            
	            byte[] bytes = null;
	            File file = null;
	            bytes = i.getFile().getBytes();
	            
	            if (!directory.exists()) directory.mkdirs();
	            
	            file = new File(directory.getAbsolutePath() + System.getProperty("file.separator") + "image_" + i.getProductId() + ".jpg");
	            
	            System.out.println(file.getAbsolutePath());
	            
	            BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(file));
	            stream.write(bytes);
	            stream.close();

	        }
	    }
	    catch (Exception e)
	    {
	    	e.printStackTrace();
	    }  
		
		mav.addObject("dataValue", getAllItems());
		mav.addObject("addItem", new Item() );
		mav.addObject("deleteItem", new Item() );
		mav.addObject("editItem", new Item() );
		mav.addObject("viewItem", new Item() );
		
		return mav ;
	}
	
	@RequestMapping(value="/DeleteItem" , method = RequestMethod.POST)
	public ModelAndView productDelete(HttpServletRequest request,
					@ModelAttribute("deleteItem")Item i, 
					BindingResult bind
			   ) throws IOException{
		
		ModelAndView mav = new ModelAndView("product");
		
		if (request.isUserInRole("ADMIN")) {
	        mav.addObject("ADMIN", "ADMIN");
	    }
		
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
					BindingResult bind, HttpServletRequest request
			   ) throws IOException{
		
		ModelAndView mav = new ModelAndView("viewdetails");
		
		if (request.isUserInRole("ADMIN")) {
	        mav.addObject("ADMIN", "ADMIN");
	    }
		
		mav.addObject("productimage", i.getImage() );
		mav.addObject("productId", i.getProductId() );
		mav.addObject("name", i.getName() );
		mav.addObject("groupName", i.getGroupName() );
		mav.addObject("description", i.getDescription() );
		mav.addObject("price", i.getPrice() );
		mav.addObject("qty", i.getQty() );
		
		return mav ;
	}
	
	@RequestMapping(value="/userbase" , method = RequestMethod.GET)
	public ModelAndView userbase() throws IOException{
		
		ModelAndView mav = new ModelAndView("userbase");
		
		mav.addObject("viewUser", new User() );
		mav.addObject("dataValue", getAllUsers());
		mav.addObject("updateUsers", new UserBaseHandler() );
		
		return mav ;
	}
	
	@RequestMapping(value="/ViewUser" , method = RequestMethod.POST)
	public ModelAndView userViewDetails(
					@ModelAttribute("viewUser")User u, 
					BindingResult bind , HttpServletRequest request
			   ) throws IOException{
		
		ModelAndView mav = new ModelAndView("viewuser");
		
		if (request.isUserInRole("ADMIN")) {
	        mav.addObject("ADMIN", "ADMIN");
	    }
		
		User i = ur.getUser(u.getEmail());
		
		System.out.println(u.getEmail());
		
		if(i!=null)
		{
			mav.addObject("email", i.getEmail() );
			mav.addObject("phone", i.getPhone() );
			mav.addObject("username", i.getUsername() );
			mav.addObject("role", i.getRole() );
			mav.addObject("address", i.getAddress() );
			
		}
		
		return mav ;
	}
	
	@RequestMapping(value="/UpdateUsers" , method = RequestMethod.POST)
	public ModelAndView updateUsers(
					@ModelAttribute("updateUsers")UserBaseHandler u, 
					BindingResult bind
			   ) throws IOException{
		
		ModelAndView mav = new ModelAndView("userbase");
		
		System.out.println(u);
		
		u.generateUsers();
		
		ArrayList<Schema> al = u.getAl();
		
		if( al != null )
		{
			for( Schema s : al )
			{
				User temp = ur.getUser( s.u.getEmail() );
				
				s.u.setPassword(temp.getPassword());
				
				if( s.delete )
					ur.deleteUser(s.u.getID());
				else
					ur.updateUser(s.u);
			}
		}
		
		mav.addObject("viewUser", new User() );
		mav.addObject("dataValue", getAllUsers());
		mav.addObject("updateUsers", new UserBaseHandler() );
		
		return mav ;
	}
	
}
