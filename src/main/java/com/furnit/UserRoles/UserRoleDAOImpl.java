package com.furnit.UserRoles;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserRoleDAOImpl implements UserRoleDAO
{
	@Autowired
	private SessionFactory sessionFactory;
 
	public SessionFactory getSessionFactory() {
		return sessionFactory.getCurrentSession().getSessionFactory();
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	
	public void insertUserRole(UserRole i) {
		//Session session = getSessionFactory().getCurrentSession();
		sessionFactory.getCurrentSession().save(i);
		
		System.out.println("Inserted");
	}

	public void deleteUserRole(int i) {
		sessionFactory.getCurrentSession().createQuery("delete from UserRole as i where i.ID = :id").setInteger("id", i).executeUpdate();
		
	}

	public void updateUserRole(UserRole i) {
		sessionFactory.getCurrentSession().update(i);
	}

	public List<UserRole> getAllUserRoles() {
		return sessionFactory.getCurrentSession().createQuery("from UserRole").list();
	}

	public UserRole getUserRole(int i) {
		List l = sessionFactory.getCurrentSession().createQuery("from UserRole as i where i.Role = :id").setInteger("id", i).list();
		if (l.size()>0)
		{
			return (UserRole)l.get(0);
		}
		else
		{
			return null;
		}

	}

	public void generateUserRoles() {
		try
		{
			UserRole ur ;//= new UserRole("USER" , 1);
			
			ur = this.getUserRole(1);
			
			if( ur == null )
			{
				ur = new UserRole("USER" , 1);
				
				this.insertUserRole(ur);
			}
			
			ur = this.getUserRole(2);
			
			if( ur == null )
			{
				ur = new UserRole("ADMIN" , 2);
				
				this.insertUserRole(ur);
			}
		}
		catch( Exception e )
		{
			e.printStackTrace();
		}
	}
}
