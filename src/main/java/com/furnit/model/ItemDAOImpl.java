package com.furnit.model;

import java.util.List;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;

@Repository
public class ItemDAOImpl implements ItemDAO 
{

	@Autowired
	private SessionFactory sessionFactory;
 
	public SessionFactory getSessionFactory() {
		return sessionFactory.getCurrentSession().getSessionFactory();
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	
	public void insertItem(Item i) {
		//Session session = getSessionFactory().getCurrentSession();
		sessionFactory.getCurrentSession().save(i);
		
		System.out.println("Inserted");
	}

	public void deleteItem(int i) {
		sessionFactory.getCurrentSession().createQuery("delete from Item as i where i.ProductId = :id").setInteger("id", i).executeUpdate();
		
	}

	public void updateItem(Item i) {
		sessionFactory.getCurrentSession().update(i);
	}

	public List<Item> getAllItems() {
		return sessionFactory.getCurrentSession().createQuery("from Item").list();
	}

}
