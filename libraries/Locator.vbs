'! The locator class will help the user define test objects skipping the Object Repository. 
'! The defined objects will be on static description and converted into dynamic description making 
'! the repository addition part of active development. 
'!
'! @author Arjun Rajeev
Class Locator

	Private LogicalName
    Private LocatorExpression
    
    '! Constructor for Locator
    '! @param locatorName expects the logical name of the locator.
    '! @param expression expects the static description of the object.
    '! @return Self Reference
	Public Default Function Init(locatorName,expression)
		LogicalName = locatorName
		If TypeName(expression) = "String" Then
			LocatorExpression = expression
		else
			Set LocatorExpression = expression
		End If
		Set Init = me
	End Function
	
	'! Gets the Logical Name of the locator object.
	Public Property Get Name
		Name = LogicalName
	End Property
	
	'! Gets the Locator static description from the object instance.
	Public Property Get Expression
		If TypeName(LocatorExpression) = "String" Then
			Expression = LocatorExpression
		else
			Set Expression = LocatorExpression
		End If			
	End Property
	
	'! Gets the description object generated on the fly from the static description provided in the expression.
	Public Property Get Identifier
		Dim arrItems: arrItems = Split(LocatorExpression,";")
		Dim oDesc: Set oDesc = Description.Create()
				
		For Each item in arrItems
			Dim propPair: propPair = Split(item,":=")
			oDesc(propPair(0)).Value = (propPair(1))			
		Next
		
		Set Identifier = oDesc
	End Property
	
End Class