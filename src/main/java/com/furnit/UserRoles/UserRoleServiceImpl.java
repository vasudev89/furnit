package com.furnit.UserRoles;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.furnit.model.ItemDAO;
import com.furnit.model.ItemService;

@Service
public class UserRoleServiceImpl implements UserRoleService 
{
	@Autowired
    UserRoleDAO dao;
    
    @Transactional
    public void insertUserRole(UserRole i) {
		dao.insertUserRole(i);
	}

    @Transactional
	public void deleteUserRole(int i) {
		dao.deleteUserRole(i);
	}

    @Transactional
	public void updateUserRole(UserRole i) {
		dao.updateUserRole(i);
	}

	@Transactional
	public List<UserRole> getAllUserRoles() {
		return dao.getAllUserRoles();
	}

	@Transactional
	public UserRole getUserRole(int i) {
		return dao.getUserRole(i);
	}

	@Transactional
	public void generateUserRoles() {
		dao.generateUserRoles();
	}
}
