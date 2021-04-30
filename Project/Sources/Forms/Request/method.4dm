

Case of 
	: (Form event code:C388=On Load:K2:1)
		
		Form:C1466.request:=cs:C1710.Request.new()
		Form:C1466.request.url:="https://mesopelagique.github.io/Facteur/Resources/welcome.json"
		Form:C1466.response:=cs:C1710.Response.new()
		Form:C1466.client:=cs:C1710.Client.new()
		
	Else 
		
End case 
