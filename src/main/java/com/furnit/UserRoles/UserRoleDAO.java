package com.furnit.UserRoles;

import java.util.List;

public interface UserRoleDAO
{
	public void insertUserRole(UserRole i);
	public void deleteUserRole(int i);
	public void updateUserRole(UserRole i);
	public void generateUserRoles();
	public UserRole getUserRole(int i);
    public List<UserRole> getAllUserRoles();
}
