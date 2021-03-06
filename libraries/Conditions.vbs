'! The PresenceOfElementLocated is an expected condition where in user checks if an element is present or 
'! waits for an element to be present before continuing with further steps in the test.
'! 
'! @author Arjun Rajeev
Class PresenceOfElementLocated
	
	Dim NameOfCondition
	Dim MessageDescription
	Dim Outcome
	Dim Locator
	
	'! Constructor for PresenceOfElementLocated.
	'! @param lotr expects the locator.
	'! @return Self Reference.
	Public Default Function Init(lotr)
		Set Locator = lotr
		NameOfCondition = "Presence Of Element"
		Set Init = me
	End Function
	
	'! Evaluates the condition PresenceOfElementLocated.
	'! @return boolean outcome of the condition evaluation.
	Public Function Evaluate		
		Outcome = (new Finder).FindAll(Locator) > 0
		If Outcome Then
			MessageDescription = "Condition - " & NameOfCondition & " [" & Locator.Name & "]"
			else
			MessageDescription = "Condition - " & NameOfCondition & " [" & Locator.Name & "]"
		End If
		Evaluate = Outcome
	End Function

	'! Get the Name of the Condition.
	'! @return The Name of the Condition.
	Public Property Get Name 	
 		Name = NameOfCondition
	End Property
	
	'! Get the evaluation description from the Condition.
	'! @return The evaluation message.
	Public Property Get Message
		Message = MessageDescription
	End Property
	
End Class

'! The VisibilityOfElementLocated is an expected condition where in user checks if an element is visible or 
'! waits for an element to be visible before continuing with further steps in the test.
'! 
'! @author Arjun Rajeev
Class VisibilityOfElementLocated
	
	Dim NameOfCondition
	Dim MessageDescription
	Dim Outcome
	Dim Locator
	
	'! Constructor for VisibilityOfElementLocated.
	'! @param lotr expects the locator.
	'! @return Self Reference.
	Public Default Function Init(lotr)
		Set Locator = lotr
		NameOfCondition = "Visibility Of Element"
		Set Init = me
	End Function
	
	'! Evaluates the condition VisibilityOfElementLocated.
	'! @return boolean outcome of the condition evaluation.
	Public Function Evaluate		
		Outcome = (new Finder).AttributeOfElement(Locator, "visibility")
		If Outcome Then
			MessageDescription = "Condition - " & NameOfCondition & " [" & Locator.Name & "]"
			else
			MessageDescription = "Condition - " & NameOfCondition & " [" & Locator.Name & "]"
		End If
		Evaluate = Outcome
	End Function

	'! Get the Name of the Condition.
	'! @return The Name of the Condition.
	Public Property Get Name 	
 		Name = NameOfCondition
	End Property
	
	'! Get the evaluation description from the Condition.
	'! @return The evaluation message.
	Public Property Get Message
		Message = MessageDescription
	End Property
	
End Class

'! The ElementSelectionStateToBe is an expected condition where in user checks if an element is selected or 
'! waits for an element to be selected before continuing with further steps in the test. This condition is
'! is exclusively applicable for radio button and checkboxes.
'! 
'! @author Arjun Rajeev
Class ElementSelectionStateToBe
	Dim NameOfCondition
	Dim ElementSelectionState
	Dim MessageDescription
	Dim Outcome
	Dim Locator
	
	'! Constructor for ElementSelectionStateToBe.
	'! @param lotr expects the locator.
	'! @return Self Reference.
	Public Default Function Init(lotr)
		Set Locator = lotr
		NameOfCondition = "Selected State Of Element"
		Set Init = me
	End Function
	
	'! Evaluates the condition ElementSelectionStateToBe.
	'! @return boolean outcome of the condition evaluation.
	Public Function Evaluate		
		Outcome = (new Finder).AttributeOfElement(Locator, "checked")
		If Outcome = 1 or Outcome = "ON" Then
			MessageDescription = "Condition - " & NameOfCondition & " [" & Locator.Name & "]"
			Outcome = true
			else
			MessageDescription = "Condition - " & NameOfCondition & " [" & Locator.Name & "]"
			Outcome = false
		End If
		Evaluate = Outcome
	End Function

	'! Get the Name of the Condition.
	'! @return The Name of the Condition.
	Public Property Get Name 	
 		Name = NameOfCondition
	End Property
	
	'! Get the evaluation description from the Condition.
	'! @return The evaluation message.
	Public Property Get Message
		Message = MessageDescription
	End Property
	
End Class

'! The ElementToBeClickable is an expected condition where in user checks if an element is enabled or 
'! waits for an element to be enabled before continuing with further steps in the test. 
'! 
'! @author Arjun Rajeev
Class ElementToBeClickable
	Dim NameOfCondition
	Dim MessageDescription
	Dim Outcome
	Dim Locator
	
	'! Constructor for ElementToBeClickable.
	'! @param lotr expects the locator.
	'! @return Self Reference.
	Public Default Function Init(lotr)
		Set Locator = lotr
		NameOfCondition = "Enabled State Of Element"
		Set Init = me
	End Function
	
	'! Evaluates the condition ElementToBeClickable.
	'! @return boolean outcome of the condition evaluation.
	Public Function Evaluate	
		If (new Finder).AttributeOfElement(Locator, "enabled") = true then
			MessageDescription = "Condition - " & NameOfCondition & " [" & Locator.Name & "]"
			Outcome = true
		elseIf (new Finder).find(Locator).GetROProperty("disabled") = 0 then
			MessageDescription = "Condition - " & NameOfCondition & " [" & Locator.Name & "]"
			Outcome = true
		else
			MessageDescription = "Condition - " & NameOfCondition & " [" & Locator.Name & "]"
			Outcome = false
		End If
		Evaluate = Outcome
	End Function

	'! Get the Name of the Condition.
	'! @return The Name of the Condition.
	Public Property Get Name 	
 		Name = NameOfCondition
	End Property
	
	'! Get the evaluation description from the Condition.
	'! @return The evaluation message.
	Public Property Get Message
		Message = MessageDescription
	End Property
	
End Class

'! The TextOfElementLocated is an expected condition where in user checks if an element text matches
'! with a given criteria or waits for the element text to be match the given criteria. 
'! 
'! @author Arjun Rajeev
Class TextOfElementLocated
	Dim NameOfCondition
	Dim ComparisonCriteria
	Dim Comparer
	Dim MessageDescription
	Dim Outcome
	Dim Locator
	
	'! Constructor for ElementToBeClickable.
	'! @param lotr expects the locator.
	'! @param criteria expects the Criteria for comparison.
	'! @param expectedText expects the expected outcome of evlauation.
	'! @return Self Reference.
	Public Default Function Init(lotr, criteria, expectedText)
		Set Locator = lotr
		ComparisonCriteria = criteria
		Comparer = expectedText
		NameOfCondition = "Text Of Element"
		Set Init = me
	End Function
	
	'! Evaluates the condition ElementToBeClickable.
	'! @return boolean outcome of the condition evaluation.
	Public Function Evaluate	
		Select Case ComparisonCriteria
			Case EQUALS
				Outcome = (new Finder).AttributeOfElement(Locator, "text") = Comparer 
				MessageDescription = "Condition - " & NameOfCondition & " [" & Locator.Name & "]" & ComparisonCriteria & " " & Comparer  
			Case NOT_EQUALS
				Outcome = (new Finder).AttributeOfElement(Locator, "text") <> Comparer 	
				MessageDescription = "Condition - " & NameOfCondition & " [" & Locator.Name & "]" & ComparisonCriteria & " " & Comparer  
			Case EQUALS_IGNORE_CASE
				Outcome = LCase((new Finder).AttributeOfElement(Locator, "text")) = LCase(Comparer) 	
				MessageDescription = "Condition - " & NameOfCondition & " [" & Locator.Name & "]" & ComparisonCriteria & " " & Comparer  
			Case CONTAINS
				Outcome = InStr(1, (new Finder).AttributeOfElement(Locator, "text"), Comparer) > 0	
				MessageDescription = "Condition - " & NameOfCondition & " [" & Locator.Name & "]" & ComparisonCriteria & " " & Comparer  
			Case CONTAINS_IGNORE_CASE
				Outcome = InStr(1, LCase((new Finder).AttributeOfElement(Locator, "text")), LCase(Comparer)) > 0	
				MessageDescription = "Condition - " & NameOfCondition & " [" & Locator.Name & "]" & ComparisonCriteria & " " & Comparer  
			Case STARTS_WITH
				Outcome = InStr(1, (new Finder).AttributeOfElement(Locator, "text"), Comparer) = 1	
				MessageDescription = "Condition - " & NameOfCondition & " [" & Locator.Name & "]" & ComparisonCriteria & " " & Comparer  
			Case ENDS_WITH
				Outcome = Right((new Finder).AttributeOfElement(Locator, "text"), len(Comparer)) = Comparer  	
				MessageDescription = "Condition - " & NameOfCondition & " [" & Locator.Name & "]" & ComparisonCriteria & " " & Comparer  				
		End Select
		Evaluate = Outcome
	End Function

	'! Get the Name of the Condition.
	'! @return The Name of the Condition.
	Public Property Get Name 	
 		Name = NameOfCondition
	End Property
	
	'! Get the evaluation description from the Condition.
	'! @return The evaluation message.
	Public Property Get Message
		Message = MessageDescription
	End Property
	
End Class

'! The AttributeOfElementLocated is an expected condition where in user checks if an element attribute matches
'! with a given criteria or waits for the element attribute to be match the given criteria. 
'! 
'! @author Arjun Rajeev
Class AttributeOfElementLocated
	Dim NameOfCondition
	Dim ComparisonCriteria
	Dim Attribute
	Dim Comparer
	Dim MessageDescription
	Dim Outcome
	Dim Locator
	
	'! Constructor for AttributeOfElementLocated.
	'! @param lotr expects the locator.
	'! @param elementAttribute expects the element attribute that needs to be returned.
	'! @param criteria expects the criteria used for evlauation.
	'! @param expectedText expects the expected outcome of evlauation.
	'! @return Self Reference.
	Public Default Function Init(lotr, elementAttribute, criteria, expectedText)
		Set Locator = lotr
		ComparisonCriteria = criteria
		Comparer = expectedText
		Attribute = elementAttribute
		NameOfCondition = "Text Of Element"
		Set Init = me
	End Function
	
	'! Evaluates the condition AttributeOfElementLocated.
	'! @return boolean outcome of the condition evaluation.
	Public Function Evaluate	
		Select Case ComparisonCriteria
			Case EQUALS
				Outcome = (new Finder).AttributeOfElement(Locator, elementAttribute) = Comparer 
				MessageDescription = "Condition - " & NameOfCondition & " [" & Locator.Name & "]" & ComparisonCriteria & " " & Comparer  
			Case NOT_EQUALS
				Outcome = (new Finder).AttributeOfElement(Locator, elementAttribute)) <> Comparer 	
				MessageDescription = "Condition - " & NameOfCondition & " [" & Locator.Name & "]" & ComparisonCriteria & " " & Comparer  
			Case EQUALS_IGNORE_CASE
				Outcome = LCase((new Finder).AttributeOfElement(Locator, elementAttribute)) = LCase(Comparer) 	
				MessageDescription = "Condition - " & NameOfCondition & " [" & Locator.Name & "]" & ComparisonCriteria & " " & Comparer  
			Case CONTAINS
				Outcome = InStr(1, (new Finder).AttributeOfElement(Locator, elementAttribute), Comparer) > 0	
				MessageDescription = "Condition - " & NameOfCondition & " [" & Locator.Name & "]" & ComparisonCriteria & " " & Comparer  
			Case CONTAINS_IGNORE_CASE
				Outcome = InStr(1, LCase((new Finder).AttributeOfElement(Locator, elementAttribute)), LCase(Comparer)) > 0	
				MessageDescription = "Condition - " & NameOfCondition & " [" & Locator.Name & "]" & ComparisonCriteria & " " & Comparer  
			Case STARTS_WITH
				Outcome = InStr(1, (new Finder).AttributeOfElement(Locator, elementAttribute), Comparer) = 1	
				MessageDescription = "Condition - " & NameOfCondition & " [" & Locator.Name & "]" & ComparisonCriteria & " " & Comparer  
			Case ENDS_WITH
				Outcome = Right((new Finder).AttributeOfElement(Locator, elementAttribute), len(Comparer)) = Comparer  	
				MessageDescription = "Condition - " & NameOfCondition & " [" & Locator.Name & "]" & ComparisonCriteria & " " & Comparer  				
		End Select
		Evaluate = Outcome
	End Function

	'! Get the Name of the Condition.
	'! @return The Name of the Condition.
	Public Property Get Name 	
 		Name = NameOfCondition
	End Property
	
	'! Get the evaluation description from the Condition.
	'! @return The evaluation message.
	Public Property Get Message
		Message = MessageDescription
	End Property
	
End Class

'! The GenericComparison is an expected condition where in user checks if a given value matches
'! with an expected value. This condition is mainly intended to handle evaluation that might not 
'! be handled by the condition classes.
'! 
'! @author Arjun Rajeev
Class GenericComparison
	
	Dim NameOfCondition
	Dim ComparisonCriteria
	Dim ValueExpected
	Dim ValueActual
	Dim MessageDescription
	Dim Outcome
	
	'! Constructor for GenericComparison.
	'! @param actualText expects the given text.
	'! @param expectedText expects the expected text.
	'! @param criteria expects the criteria used for evlauation.
	'! @return Self Reference.
	Public Default Function Init(actualValue, criteria, expectedValue)
		ComparisonCriteria = criteria
		ValueExpected = expectedValue
		ValueActual = actualValue
		NameOfCondition = "Generic Comparison"
		Set Init = me
	End Function
	
	'! Evaluates the condition AttributeOfElementLocated.
	'! @return boolean outcome of the condition evaluation.
	Public Function Evaluate	
		Select Case ComparisonCriteria
			Case EQUALS
				Outcome = ValueActual = ValueExpected
				MessageDescription = "Condition - " & NameOfCondition & " " & ValueActual & " " & ComparisonCriteria & " " & ValueExpected 
			Case NOT_EQUALS
				Outcome = ValueActual <> ValueExpected
				MessageDescription = "Condition - " & NameOfCondition & " " & ValueActual & " " & ComparisonCriteria & " " & ValueExpected 
			Case EQUALS_IGNORE_CASE
				Outcome = LCase(ValueActual) = LCase(ValueExpected)
				MessageDescription = "Condition - " & NameOfCondition & " " & ValueActual & " " & ComparisonCriteria & " " & ValueExpected 
			Case CONTAINS
				Outcome = Instr(1, ValueActual, ValueExpected) > 0
				MessageDescription = "Condition - " & NameOfCondition & " " & ValueActual & " " & ComparisonCriteria & " " & ValueExpected 
			Case CONTAINS_IGNORE_CASE
				Outcome = Instr(1, LCase(ValueActual), LCase(ValueExpected)) > 0
				MessageDescription = "Condition - " & NameOfCondition & " " & ValueActual & " " & ComparisonCriteria & " " & ValueExpected 
			Case STARTS_WITH
				Outcome = InStr(1, ValueActual, ValueExpected) = 1	
				MessageDescription = "Condition - " & NameOfCondition & " " & ValueActual & " " & ComparisonCriteria & " " & ValueExpected   
			Case ENDS_WITH
				Outcome = Right(ValueActual, len(ValueExpected)) = TextExpected  	
				MessageDescription = "Condition - " & NameOfCondition & " " & ValueActual & " " & ComparisonCriteria & " " & ValueExpected 			
		End Select
		Evaluate = Outcome
	End Function

	'! Get the Name of the Condition.
	'! @return The Name of the Condition.
	Public Property Get Name 	
 		Name = NameOfCondition
	End Property
	
	'! Get the evaluation description from the Condition.
	'! @return The evaluation message.
	Public Property Get Message
		Message = MessageDescription
	End Property
	
End Class

'! The TextOfElementInListLocated is an expected condition where in user checks if a given text 
'! is present within a combo box. This condition is exclusive to comboboxes.
'! 
'! @author Arjun Rajeev
Class TextOfElementInListLocated
	
	Dim NameOfCondition
	Dim Comparer
	Dim MessageDescription
	Dim Outcome
	Dim Locator
	
	'! Constructor for TextOfElementInListLocated.
	'! @param lotr expects the locator.
	'! @param elementAttribute expects the element attribute that needs to be returned.
	'! @param criteria expects the criteria used for evlauation.
	'! @param expectedText expects the expected outcome of evlauation.
	'! @return Self Reference.
	Public Default Function Init(lotr, expectedText)
		Set Locator = lotr
		Comparer = expectedText
		NameOfCondition = "Text Of Element In List Located"
		Set Init = me
	End Function
	
	'! Evaluates the condition TextOfElementInListLocated.
	'! @return boolean outcome of the condition evaluation.
	Public Function Evaluate	
		Dim tmpList : Set tmpList = (new Finder).ListItems(Locator)	
		Outcome = tmpList.Contains(Comparer)
		MessageDescription = "Condition - " & NameOfCondition & " [" & Locator.Name & "] -> [" & vbCrLf & Join(tmpList.ToArray, "," & vbCrLf ) & "] to contain " & Comparer  	
		Evaluate = Outcome
	End Function

	'! Get the Name of the Condition.
	'! @return The Name of the Condition.
	Public Property Get Name 	
 		Name = NameOfCondition
	End Property
	
	'! Get the evaluation description from the Condition.
	'! @return The evaluation message.
	Public Property Get Message
		Message = MessageDescription
	End Property
	
End Class

'! The Conditions class holds all user accesible methods that will inturn return the actual condition objects.
'!
'! @author Arjun Rajeev
Class Conditions	
	
	'! Get a handle to the instance of PresenceOfElementLocated.
	'! @param locator expects a defined locator.
	'! @return Instance of PresenceOfElement.
	Public Function PresenceOfElement(locator)
		Set PresenceOfElement = (new PresenceOfElementLocated)(locator)
	End Function
	
	'! Get a handle to the instance of VisibilityOfElementLocated.
	'! @param locator expects a defined locator.
	'! @return Instance of VisibilityOfElementLocated.
	Public Function VisibilityOfElement(locator)
		Set VisibilityOfElementLocated = (new VisibilityOfElementLocated)(locator)
	End Function
	
	'! Get a handle to the instance of ElementSelectionStateToBe.
	'! @param locator expects a defined locator.
	'! @return Instance of ElementSelectionStateToBe.
	Public Function SelectedStateOfElement(locator)
		Set SelectedStateOfElement = (new ElementSelectionStateToBe)(locator)
	End Function
	
	'! Get a handle to the instance of ElementToBeClickable.
	'! @param locator expects a defined locator.
	'! @return Instance of ElementToBeClickable.
	Public Function EnabledStateOfElement(locator)
		Set EnabledStateOfElement = (new ElementToBeClickable)(locator)
	End Function
	
	'! Get a handle to the instance of TextOfElementLocated.
	'! @param locator expects a defined locator.
	'! @param criteria expects the criteria for comparison.
	'! @param comparer expects the text to be compared.
	'! @return Instance of TextOfElementLocated.
	Public Function TextOfElement(locator, criteria, comparer)
		Set TextOfElement = (new TextOfElementLocated)(locator, criteria, comparer)
	End Function
	
	'! Get a handle to the instance of AttributeOfElementLocated.
	'! @param locator expects a defined locator.
	'! @param attribute expects the attribute that needs to be extracted from the element.
	'! @param criteria expects the criteria for comparison.
	'! @param comparer expects the text to be compared.
	'! @return Instance of TextOfElementLocated.
	Public Function AttributeOfElement(locator, attribute, criteria, comparer)
		Set AttributeOfElement = (new AttributeOfElementLocated)(locator, criteria, comparer)
	End Function
	
	'! Get a handle to the instance of GenericComparison. As a rule of thumb its higly recommended
	'! to restrict the use of generic comaprisons to only numbers and text. Complex data types 
	'! will and should hold a custom condition for evaluation.
	'! @param actual expects the given text.
	'! @param expected expects the expected text.
	'! @param criteria expects the criteria used for evlauation.
	'! @return Instance of GenericComparison.
	Public Function Compare(actual, criteria, expected)
		Set Compare = (new GenericComparison)(actual, criteria, expected)
	End Function
	
	'! Get a handle to the instance of TextOfElementInListLocated.
	'! @param locator expects a defined locator.
	'! @param expectedText expects the text to be compared.
	'! @return Instance of TextOfElementInListLocated.
	Public Function TextOfElementInList(locator, expectedText)
		Set TextOfElementInList = (new TextOfElementInListLocated)(locator, expectedText)
	End Function
	
End Class