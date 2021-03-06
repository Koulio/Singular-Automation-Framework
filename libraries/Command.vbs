'! Commands Class will be the placeholder for the element interactions, waits and verification. 
'! All the methods here will be provided to the page classes for usage through a global function cmd.
'! If a user wants to click an element for example it will look like below.
'!
'! cmd.Click(elementLocator) where the elementlocator is a defined locator.
'! 
'! @author Arjun Rajeev
Class Commands

	'! Clicks on a given locator.	
	'! @param locator expects a defined locator.
	Public Sub Click(locator)
		report.Info "Click on [" & locator.Name & "]"
		Element(locator).Click
	End Sub
	
	'! Double Clicks on a given locator.
	'! @param locator expects a defined locator. 	
	Public Sub DoubleClick(locator)
		report.Info "Double Click on [" & locator.Name & "]"
		Element(locator).DblClick
	End Sub
	
	'! Clear the text on a given text field.
	'! @param locator expects a defined locator.
	Public Sub ClearText(locator)		
		report.Info "Clear the text in [" & locator.Name & "]"
		Element(locator).Set ""
	End Sub
	
	'! Enter text in a given text field.
	'! @param locator expects a defined locator.
	'! @param text expects the text that needs to be entered.
	Public Sub EnterText(locator, text)	
		report.Info "Enter the text [" & text & "] in [" & locator.Name & "]"	
		Element(locator).Set text
	End Sub
	
	'! Clear the text and then enter the new text in the given text field.
	'! @param locator expects a defined locator.
	'! @param text expects the text that needs to be entered.
	Public Sub ClearAndEnterText(locator, text)	
		ClearText locator	
		EnterText locator, text
	End Sub	
	
	'! Select the given text in the specified Combo box.
	'! @param locator expects a defined locator.
	'! @param text expects the text that needs to be selected.
	Public Sub SelectText(locator, text)
		report.Info "Select Item [" & text & "] in [" & locator.Name & "]"
		Element(locator).Select text
	End Sub
	
	'! Wait for an event to happen.
	'! @param condition expects a Condition object defined in the Conditions class to provide a dynamic wait.
	'! @param expectedOutcome expects the variant value which is the expected outcome upon evaluating the condition.
	'! @raise TimeOut Exception.
	Public Sub WaitFor(condition, expectedOutcome)
		timeOut = DEFAULT_TIME_OUT
		counter = 0
		Do
			wait(1)
			counter = counter + 1
		Loop While condition.evaluate <> expectedOutcome and counter < timeOut
		
		If counter = timeOut Then
			Throw "Time Out exception while waiting for " & condition.message & ", to be " & expectedOutcome & "."
		End If
	End Sub
	
	'! Assert if a given condition meets a specified expectations
	'! @param condition expects a Condition object defined in the Conditions class.
	'! @param expectedOutcome expects the variant value which is the expected outcome upon evaluating the condition.
	'! @raise Assertion Error.
	Public Sub Verify(condition, expectedOutcome)
		If condition.Evaluate = expectedOutcome Then
			report.Passed "Verify " + condition.Message & ", to be " & expectedOutcome & "."		
		else
			report.Failed "Verify " + condition.Message & ", to be " & expectedOutcome & ", but was found to be " & (not expectedOutcome)  
			Throw "Assertion Exception on " + condition.Message
		End If
	End Sub
	
	'! Soft Assert if a given condition meets a specified expectations
	'! @param condition expects a Condition object defined in the Conditions class.
	'! @param expectedOutcome expects the variant value which is the expected outcome upon evaluating the condition.
	Public Sub Check(condition, expectedOutcome)
		If condition.Evaluate = expectedOutcome Then
			report.Passed "Verify " + condition.Message & ", to be " & expectedOutcome & "."		
		else
			report.Failed "Verify " + condition.Message & ", to be " & expectedOutcome & ", but was found to be " & (not expectedOutcome)   
		End If
	End Sub
	
	Private Function Element(locator)
		Set Element = (new Finder).Find(locator)
	End Function
	
	Private Function Elements(locator)
		Set Elements = (new Finder).FindAll(locator)
	End Function
	
End Class