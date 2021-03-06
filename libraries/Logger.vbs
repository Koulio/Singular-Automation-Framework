'! The Logger class will hold the place holders for all reporting methods that needs to be performed. 
'! The loggers will replace the end to end reporting and will replace the inbuilt UFT reporting engines 
'! from a test and page model perspective.
'! 
'! @author Arjun Rajeev
Class Logger
	
	'! Logs an Information Statement in the console logger, UFT report and Custom HTML report.
	'! @param descriptionStatement expects the statement that needs to be logged
	Sub Info(descriptionStatement)
		Print "[INFO]   [" & TimeStamp & "] " & descriptionStatement
	End Sub
	
	'! Logs an Warning Statement in the console logger, UFT report and Custom HTML report.
 	'! @param descriptionStatement expects the statement that needs to be logged
	Sub Warning(descriptionStatement)
		Print "[WARNING][" & TimeStamp & "] " & descriptionStatement
	End Sub
	
	'! Logs an Fail Statement in the console logger, UFT report and Custom HTML report.
 	'! @param descriptionStatement expects the statement that needs to be logged
	Sub Failed(descriptionStatement)
		Print "[FAILED] [" & TimeStamp & "] " & descriptionStatement
	End Sub
	
	'! Logs an Pass Statement in the console logger, UFT report and Custom HTML report.
 	'! @param descriptionStatement expects the statement that needs to be logged
	Sub Passed(descriptionStatement)
		Print "[PASSED] [" & TimeStamp & "] " & descriptionStatement
	End Sub
	
	Private Function TimeStamp
		TimeStamp = FormatDateTime(now)
	End Function
	
End Class