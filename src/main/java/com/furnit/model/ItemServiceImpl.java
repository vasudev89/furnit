package com.furnit.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class ItemServiceImpl implements ItemService 
{
	@Autowired
    ItemDAO dao;
    
    @Transactional
    public void insertItem(Item i) {
		dao.insertItem(i);
	}

    @Transactional
	public void deleteItem(int i) {
		dao.deleteItem(i);
	}

    @Transactional
	public void updateItem(Item i) {
		dao.updateItem(i);
	}

	@Transactional
	public List<Item> getAllItems() {
		return dao.getAllItems();
	}
}
