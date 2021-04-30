

Function statusCodeMessage()->$message : Text
	
	$message:=String:C10(This:C1470.statusCode)
	
	Case of 
		: (This:C1470.statusCode=200)
			$message:=$message+" OK"
			// TODO other codes
		: (This:C1470.statusCode=0)
			$message:="ERROR"
	End case 
	
Function bodyText()->$text : Text
	
	// according to type
	var $tmpFix : Blob  // Variant
	$tmpFix:=This:C1470.body
	Case of 
		: (Value type:C1509($tmpFix)=Is BLOB:K8:12)
			$text:=BLOB to text:C555($tmpFix; UTF8 C string:K22:15)  // XXX maybe if binary send special messsage
		: (Value type:C1509($tmpFix)=Is text:K8:3)
			$text:=$tmpFix
		Else 
			$text:="<none>"
	End case 
	