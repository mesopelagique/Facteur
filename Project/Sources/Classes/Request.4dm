

Class constructor
	This:C1470.method:=HTTP GET method:K71:1
	This:C1470.headers:=New object:C1471()
	This:C1470.url:="https://developer.4d.com/"
	
	
Function bodyBlob()->$blob : Blob
	
	// according to type
	Case of 
		: (Value type:C1509(This:C1470.body)=Is BLOB:K8:12)
			$blob:=This:C1470.body
		: (Value type:C1509(This:C1470.body)=Is text:K8:3)
			$text:=This:C1470.body
			TEXT TO BLOB:C554($text; $blob)
		: (Value type:C1509(This:C1470.body)=Is object:K8:27)
			$text:=JSON Stringify:C1217(This:C1470.body)
			TEXT TO BLOB:C554($text; $blob)
		: (Value type:C1509(This:C1470.body)=Is collection:K8:32)
			$text:=JSON Stringify:C1217(This:C1470.body)
			TEXT TO BLOB:C554($text; $blob)
		Else 
			
	End case 
	