package com.furnit.UserModel;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.furnit.model.ItemDAO;
import com.furnit.model.ItemService;

@Service
public class UserServiceImpl implements UserService 
{
	@Autowired
    UserDAO dao;
    
    @Transactional
    public void insertUser(User i) {
		dao.insertUser(i);
	}

    @Transactional
	public void deleteUser(long i) {
		dao.deleteUser(i);
	}

    @Transactional
	public void updateUser(User i) {
		dao.updateUser(i);
	}

	@Transactional
	public List<User> getAllUsers() {
		return dao.getAllUsers();
	}
	
	@Transactional
	public User getUser(String i) {
		return dao.getUser(i);
	}
}
