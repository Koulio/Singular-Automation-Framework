Const DEFAULT_TIME_OUT = 60

Const EQUALS_IGNORE_CASE = " TO BE EQUAL (IRRESPECTIVE OF CASE) TO "
Const EQUALS = " TO BE EQUAL TO "
Const GREATER_THAN = " TO BE GREATER THAN "
Const GREATER_THAN_OR_EQUAL = " BE GREATER THAN OR EQUAL TO "
Const LESS_THAN = " BE LESS THAN "
Const LESS_THAN_OR_EQUAL = " BE LESS THAN OR EQUAL TO "
Const NOT_EQUALS = " BE NOT EQUAL TO "
Const STARTS_WITH = " TO STARTS WITH "
Const CONTAINS = " TO CONTAIN "
Const CONTAINS_IGNORE_CASE = " TO CONTAIN (IRRESPECTIVE OF CASE) "
Const ENDS_WITH = " TO END WITH "

'! Will hold the current context of the application under test
Dim context 

'! Will hold the instance of the Logger class.
'! @return The logger instance.
Function Report
	Set Report = new Logger
End Function


'! Raise an exception with the given text.
'! @param exception expects the error message that needs to be displayed on the reports and loggers.
'! @raise Exception
Sub Throw(exception)
	Err.Raise 6001, "Test Framework Exception" ,exception  
End Sub

'! Create a global instance of the Find object to be used in the page models. 
'! @return Condition Instance.
Function Find
	Set Find = new Finder
End Function

'! Create a global instance of the condition object to be used in the page models. 
'! @return Condition Instance.
Function Condition
	Set Condition = new Conditions
End Function

'! Global function available to the page class exhibiting psuedo inheritance and provide them 
'! with a handle to the various object interaction requried by the page methods.
'! @return Instance of the Command class.
Function Cmd
    Set cmd = new Commands	
End Function

'! Create an instance of the relevant page class to help properties of the object to be preserved.
'! @param exptects the Class Name whose instance needs to be created.
'! @return The instance of the class mentioned
Function require(pageClass)
	Set require = Eval("new " & pageClass)
End Function

'! Import the test data file on to action sheet of UFT to be used by the corresponding page objects 
'! and tests
'! @param dataSheet expects the data sheet that needs to be imported from the master data.
Function Import(dataSheet, rowId)
	Dim i
	Dim tmpDataSheetLocation : tmpDataSheetLocation = Environment.Value("MASTERDATA")
	If IsEmpty(rowId) Then rowId = 1
	If not Instr(1, tmpDataSheetLocation, ":\") > 1 Then
		tmpDataSheetLocation = PathFinder.Locate(tmpDataSheetLocation)
	End If
	DataTable.ImportSheet tmpDataSheetLocation, dataSheet, "Action1"
	For i = rowId To DataTable.GetSheet("Action1").GetRowCount
		If DataTable.GetSheet("Action1").GetParameter("Key").ValueByRow(i) = Environment.Value("TestName") Then
			rowId = i
			Exit For				
		End If			
	Next
	DataTable.GetSheet("Action1").SetCurrentRow(rowId)
	Import = rowId + 1
End Function

Function Value(header)	
	Value = DataTable.Value(header, "Action1")
End Function