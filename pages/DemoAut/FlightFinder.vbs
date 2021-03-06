Class FlightFinderPage
	
	Dim ListPassengers
	Dim ListDepartingFrom 
	Dim ListDepartureMonth
	Dim ListDepartureDay
	Dim ListArrivingIn
	Dim ListReturnMonth
	Dim ListReturnDay
	Dim ImageContinue 
	
	Private Sub Class_Initialize
	    Set context = Browser("title:=Find a Flight.*").Page("url:=http://newtours.demoaut.com/mercuryreservation.php.*")
	    
	    Set ListPassengers = (new Locator)("Passengers Combobox", "micClass:=WebList;name:=passCount")
	    Set ListDepartingFrom = (new Locator)("Departing From Combobox", "micClass:=WebList;name:=fromPort")		
	    Set ListDepartureMonth = (new Locator)("Departing Month Combobox", "micClass:=WebList;name:=fromMonth")		
		Set ListDepartureDay = (new Locator)("Departure Day Combobox", "micClass:=WebList;name:=fromDay")		
	    Set ListArrivingIn = (new Locator)("Arriving In Combobox", "micClass:=WebList;name:=toPort")		
	    Set ListReturnMonth = (new Locator)("Return Month Combobox", "micClass:=WebList;name:=toMonth")		
	    Set ListReturnDay = (new Locator)("Return Day Combobox", "micClass:=WebList;name:=toDay")	
		Set ImageContinue = (new Locator)("Continue Button", "micClass:=Image;name:=findFlights")	
	End Sub
	
	Sub CompleteFlightFinderForm
		SelectPassengers 2
		SelectDepartingFrom "Frankfurt"
		SelectDepartureDate "November","23"
		SelectArrivingIn "London"
		SelectReturnDate "December", "24"
	End Sub
	
	Sub SelectPassengers(numberOfPassengers)
		cmd.SelectText ListPassengers, numberOfPassengers
	End Sub
	
	Sub SelectDepartingFrom(departingfrom)
		cmd.SelectText ListDepartingFrom, departingfrom
	End Sub
	
	Sub SelectDepartureDate(departureMonth, departureDay)
		cmd.SelectText ListDepartureMonth, departureMonth 
		cmd.SelectText ListDepartureDay, departureDay
	End Sub
	
	Sub SelectArrivingIn(arrivingIn)
		cmd.SelectText ListArrivingIn, arrivingIn
	End Sub
	
	Sub SelectReturnDate(returnMonth, returnDay)
		cmd.SelectText ListReturnMonth, returnMonth 
		cmd.SelectText ListReturnDay, returnDay 
	End Sub
	
	Sub SelectContinue		
		cmd.Click ImageContinue 
	End Sub
	
End Class