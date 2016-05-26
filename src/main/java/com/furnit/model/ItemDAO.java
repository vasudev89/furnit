package com.furnit.model;

import java.util.List;

public interface ItemDAO 
{
	public void insertItem(Item i);
	public void deleteItem(int i);
	public void updateItem(Item i);
    public List<Item> getAllItems();
    public Item getItemWithMaxId();
}