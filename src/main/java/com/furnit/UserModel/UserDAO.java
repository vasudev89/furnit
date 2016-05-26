package com.furnit.UserModel;

import java.util.List;

public interface UserDAO
{
	public void insertUser(User i);
	public void deleteUser(long i);
	public void updateUser(User i);
	public User getUser(String i);
    public List<User> getAllUsers();
    
}
