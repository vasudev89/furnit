package com.furnit;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Component;


public class LoginCredentials
{
	String validate(String input)
	{
		if( !input.equals("none") )
			return "true";
		else
			return "false";
	}
}
