Class LoginPage
		
	Dim FieldUsername 
	Dim FieldPassword
	Dim ImageSignin 
	Dim LinkYourDestination 
	
	Private Sub Class_Initialize
	    Set context = Browser("Home").Page("Home")
	    
	    Set FieldUsername = (new Locator)("Username Field", "micClass:=WebEdit;name:=userName")
	    Set FieldPassword = (new Locator)("Password Field", "micClass:=WebEdit;name:=password")
	    Set ImageSignin = (new Locator)("Sign In Image Button", "micClass:=Image;alt:=Sign-In")		
	    Set LinkYourDestination = (new Locator)("Your Destination Link", "micClass:=Link;text:=your destination")		
	End Sub
	
	Public Sub CompleteLoginForm
		SelectUserName "test"
		SelectPassword "test"
	End Sub	
	
	Sub SelectUserName(userName)
		cmd.EnterText FieldUserName, userName
	End Sub
	
	Sub SelectPassword(password)
		cmd.EnterText FieldPassword, password	
	End Sub
	
	Sub SelectSignIn
		cmd.Click(ImageSignin)
	End Sub	
	
End Class