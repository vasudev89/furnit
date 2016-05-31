package com.furnit;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;

public class LoginService
{
	
	LoginCredentials lg;
	
	public String test(String input)
	{
		if( input != null )
			return "true";
		else
			return "false";
	}
}
