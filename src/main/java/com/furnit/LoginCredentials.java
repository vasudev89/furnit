package com.furnit;

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
