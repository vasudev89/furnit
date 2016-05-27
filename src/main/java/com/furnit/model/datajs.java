package com.furnit.model;

import java.util.ArrayList;

public class datajs
{
	private ArrayList al = new ArrayList();
	
	public void addItem(Item i)
	{
		al.add(i);
	}
	
	@Override
	public String toString() {
		
		String retval = "";
		
		for( Object x: al )
		{
			retval += x + ",";
		}
		
		if( retval.equals("") )
			retval = "[]";
		else
			retval = "[" + retval.substring(0, retval.length()-1) + "]";
		
		System.out.print(retval);
		
		return retval;
	}
}
