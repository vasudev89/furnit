package com.furnit.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

public interface ItemService
{
 
    public void insertItem(Item i);

	public void deleteItem(int i);

	public void updateItem(Item i);

	public List<Item> getAllItems();
}