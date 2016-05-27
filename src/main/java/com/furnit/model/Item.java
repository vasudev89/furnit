package com.furnit.model;

import java.io.Serializable;

import javax.persistence.Embeddable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.furnit.CartModel.Cart;

@Entity
@Embeddable
public class Item implements Serializable
{
	@Id @GeneratedValue(strategy=GenerationType.AUTO)
	private int ProductId;
	
	private String GroupName = "";
	private String Name = "";
	private String Price = "";
	private String Qty = "";
	private String Description = "";
	
	@Transient
	private String Image = "";
	
	@Transient
	private MultipartFile File;
	
	
	
	
	public MultipartFile getFile() {
		return File;
	}

	public void setFile(MultipartFile file) {
		File = file;
	}

	public int getProductId() {
		return ProductId;
	}

	public void setProductId(int productId) {
		ProductId = productId;
	}

	public String getGroupName() {
		return GroupName;
	}

	public void setGroupName(String groupName) {
		GroupName = groupName;
	}

	public String getName() {
		return Name;
	}

	public void setName(String name) {
		Name = name;
	}

	public String getPrice() {
		return Price;
	}

	public void setPrice(String price) {
		Price = price;
	}

	public String getQty() {
		return Qty;
	}

	public void setQty(String qty) {
		Qty = qty;
	}

	public String getDescription() {
		return Description;
	}

	public void setDescription(String description) {
		Description = description;
	}

	public String getImage() {
		return Image;
	}

	public void setImage(String image) {
		Image = image;
	}
	
	public Item()
	{
		
	}
	

	public Item( int productId, String groupName, String name, String price, String qty, String description,
			String image) {
		super();
		ProductId = productId;
		GroupName = groupName;
		Name = name;
		Price = price;
		Qty = qty;
		Description = description;
		Image = image;
	}

	@Override
	public String toString() {
		return "{Product_Id:\"" + ProductId + "\", Group_Name:\"" + GroupName + "\", Name:\"" + Name + "\", Price:\"" + Price
				+ "\", Qty:\"" + Qty + "\", Description:\"" + Description + "\", Image:\"resources/images/image_"+ProductId+".jpg\"}";
	}
	
	public static void main(String args[])
	{
		System.out.println(new Item(1,"Accessories","Metronome","644","11","Tune in with this","resources/images/accessories/acc1.jpg"));
	}
}