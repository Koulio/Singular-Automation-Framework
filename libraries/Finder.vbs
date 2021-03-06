'! The Finder class provides accessories for any kind of object identification or any 
'! kind of object property extraction
'!
'! @author Arjun Rajeev
Class Finder

	'! Identify the specified locator. 
	'! @param locator expects the locator that needs be identified on the application under the given global context.
	'! @return The first object matching the description used in the locator expression.
	Function Find(locator)
		If TypeName(locator) = "Locator" Then
			If TypeName(locator.Expression) = "String" Then
				Set Find = context.ChildObjects(locator.Identifier)(0)			
			else
				Set Find = locator.Expression
			End If			
		else
			Set Find = context
		End If
	End Function
	
	'! Identify all elements matching the specified locator. 
	'! @param locator expects the locator that needs be identified on the application under the given global context.
	'! @return The list of objects matching the description used in the locator expression.
	Function FindAll(locator)
		Set Find = context.ChildObjects(locator.Identifier)
	End Function
		
	'! Extracts the attribute property of the given element.
	'! @param locator expects the locator that needs be identified on the application under the given global context.
	'! @param attribute expects the attribute that needs to be extracted.
	'! @return The value of the given attribute.
	Function AttributeOfElement(locator, attribute)
		AttributeOfElement = Find(locator).GetROProperty(attribute)
	End Function
	
	'! Extracts the options from the given combobox.
	'! @param locator expects the combobox identifier.
	'! @return ArrayList of all items in the combobox.
	Function ListItems(locator)
		Dim itemsCount, i
		Dim list : Set list = CreateObject("System.Collections.ArrayList")
		itemsCount = AttributeOfElement(locator, "items count")
		For i = 1 To itemsCount
			list.Add Find(locator).GetItem(i)
		Next
		Set ListItems = list
	End Function
	
End Class