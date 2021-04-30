

Function request($request : Object)->$response : Object
	
	var $headers : Collection
	$headers:=OB Entries:C1720($request.headers)
	ARRAY TEXT:C222($HeaderNames_at; $headers.length)
	ARRAY TEXT:C222($HeaderValues_at; $headers.length)
	var $i : Integer
	$i:=1
	For each ($header; $headers)
		$HeaderNames_at{$i}]:=$header.key
		$HeaderValues_at{$i}:=$header.value
		$i:=$i+1
	End for each 
	
	var $requestBody : Blob
	$requestBody:=$request.bodyBlob()
	
	
	var $mError : Text
	$mError:=Method called on error:C704
	ON ERR CALL:C155("CatchError")
	
	var $time : Integer
	$time:=Milliseconds:C459
	var $responseData : Blob
	var $statusCode : Integer
	$statusCode:=HTTP Request:C1158($request.method; $request.url; $requestBody; $responseData; $HeaderNames_at; $HeaderValues_at)
	
	ON ERR CALL:C155($mError)
	
	$response:=cs:C1710.Response.new()
	$response.time:=Milliseconds:C459-$time
	$response.statusCode:=$statusCode
	$response.response:=$response
	$response.body:=$responseData
	//$response.bodyT:=$response.bodyText()
	
	$response.headers:=New object:C1471()
	For ($i; 1; Size of array:C274($HeaderNames_at); 1)
		$response.headers[$HeaderNames_at{$i}]:=$HeaderValues_at{$i}
	End for 