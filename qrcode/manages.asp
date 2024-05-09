<!--#include file = "../backend/connection/db.asp"-->
<%

ID = Request.Form("ID")
Data = Request.Form("insert")

IF Data = "insert" Then 
 
               sql = "INSERT INTO [BasketPTH].[dbo].[QrCode](Basket_ID)VALUES('"&ID&"')"

             on error resume next

                        db.Execute(sql)
     
                        if err<>0 Then
                
                                Response.Write (Err.Description)    
                                response.write("0")
                                show = "0" 
                                
                                Else
                                
                                show = "1"

                        End if
        Json =""
        Json = Json & "{"
        Json = Json & """data"": "& show &"  "& vbcrlf  
        Json = Json & "}"
        
        Response.Write Json  
       
  
End IF

cleanup = Request.Form("cleanup")

IF cleanup = "cleanup" Then 

      sql = "Delete From [BasketPTH].[dbo].[QrCode]"

            on error resume next

                        db.Execute(sql)
     
                        if err<>0 Then
                
                                Response.Write (Err.Description)    
                                response.write("0")
                                show = "0" 
                                
                                Else
                                
                                show = "1" 

                        End if
        Json =""
        Json = Json & "{" 
        Json = Json & """data"": "& show &"  "& vbcrlf  
        Json = Json & "}"
        
Response.Write Json  

End If 

%>