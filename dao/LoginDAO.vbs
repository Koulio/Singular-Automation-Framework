﻿'! The LoginDAO represents the data object associated with the login Page. When the object is
'! instantiated, it will pick the first row based on a key value in the data sheet, and upon instantiation 
'! again the second row of data will be picked for the same key. 
'! This class is a mock up of Singleton classes in real programming languages.
'!
'! @see Import global method for the implementation. 
Class LoginDAO
	
	Private p_Key
	Private p_LoginId
	Private p_Password
	Private p_Database
	
	'! Constructor. 	
	Private Sub Class_Initialize 
		if IsEmpty(Environment.Value("LoginDAO")) then
			Environment.Value("LoginDAO") = Import("PP_Login", empty)
		else
			Import "PP_Login", Environment.Value("LoginDAO")
		end if
		If Value("Key") <> "" Then p_Key = Value("Key") 
		If Value("LoginId") <> "" Then p_LoginId = Value("LoginId") 
		If Value("Password") <> "" Then p_Password = Value("Password")
		If Value("Database") <> "" Then p_Database = Value("Database") 			
	End Sub
	
	Public Property Get Key()
		Key = p_Key
	End Property
	
	Public Property Get LoginId()
		LoginId = p_LoginId
	End Property
	
	Public Property Get Password()
		Password = p_Password
	End Property
	
	Public Property Get Database()
		Database = p_Database
	End Property
	
End Class

Environment.Value("LoginDAO") = Empty