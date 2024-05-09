<!--#include file = "../backend/connection/db.asp"-->
<!--#include file = "../lib/aspJSON1.18.asp"-->  
<%
username = Request.Cookies("LOGON_USER") 
  


 
searchBasket = Request.Form("searchBasket")
PTH_ID  = Request.Form("PTH_ID")
If searchBasket = "search" Then
    sql = "SELECT [ID], [B_Number] FROM [BasketPTH].[dbo].[Basket] WHERE PTH_ID = '" & PTH_ID & "'"
    On Error Resume Next
    Set rs = db.Execute(sql)
    
    Dim Json
    Json = "{""data"": ["
    
    If Not rs.EOF Then
        While Not rs.EOF
            Json = Json & "{"
            Json = Json & """ID"": " & rs("ID") & ","
            Json = Json & """B_Number"": """ & rs("B_Number") & """"
            Json = Json & "},"
            rs.MoveNext
        Wend
        ' ตัดเครื่องหมาย comma ที่ติดมาด้วยในตัวสุดท้าย
        Json = Left(Json, Len(Json) - 1) ' ตัดเครื่องหมาย comma ที่ติดมาด้วยในตัวสุดท้าย
    End If
    
    Json = Json & "]}"
    
    Response.Write Json
End If


PTH_ID          = Request.Form("PTH_ID")  
Basket_ID       = Request.Form("Basket_ID")  
Status_ID       = Request.Form("Status_ID")  
Substatus_ID    = Request.Form("Substatus_ID")  
Other           = Request.Form("Other")  
d_date =  (Year(NOW()) &"-"& Month(NOW()) &"-"& day(NOW()) &" "& Time)

insert = Request.Form("insert")  

If insert = "insert" Then

sql = " INSERT INTO [BasketPTH].[dbo].[PTH_Detail] (PTH_ID, Basket_ID, Status_ID, Substatus_ID, Other,D_datatime,D_username)"  &_ 
      " VALUES('"&PTH_ID&"','"&Basket_ID&"','"&Status_ID&"','"&Substatus_ID&"','"&Other&"','"&d_date&"','"&username&"') "
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


'T_ID  = Request.Form("T_ID")  
'Data = Request.Form("Data")
'IF Data = "Data" Then

'        sql = " SELECT * FROM [TankDB].[dbo].[Machine] a " &_   
'        " Inner join [TankDB].[dbo].[Tank] b " &_
'        " On a.M_ID = b.M_ID" &_
'        " Left join [TankDB].[dbo].[Tank_Dates] c " &_
'        " On b.T_ID = c.T_ID " &_
'        " Left join [TankDB].[dbo].[CsCode] d " &_
'        " On b.CS_ID = d.CS_ID " &_
'        " Where b.T_ID = '"&T_ID&"' and b.T_Status = 1 " &_ 
'        " order by c.TK_Id desc "
'        SET rs = db.Execute(sql)

'        If Not rs.EOF Then
'        M_Name   = rs("M_Name")
'        T_Name   = rs("T_Name")
'        CS_Code   = rs("CS_Code")
'        T_QTY    = rs("T_QTY")
'        T_Change = rs("T_Change")
'        T_Period = rs("T_Period")
'        TK_Date  = rs("TK_Date") 

                ' ตรวจสอบว่าข้อมูลที่อ้างอิงถูกต้องและมีอยู่ในฐานข้อมูล
'                If Not IsNull(show) And Not IsNull(T_Name) And Not IsNull(T_QTY) And Not IsNull(T_Change) And Not IsNull(T_Period) Then
'                        Json = ""
'                        Json = Json & "{"
'                        Json = Json & """M_Name"": """ & M_Name & """ , " & vbCrLf  
'                        Json = Json & """T_Name"": """ & T_Name & """ , " & vbCrLf
'                        Json = Json & """CS_Code"": """ & CS_Code & """ , " & vbCrLf
'                        Json = Json & """T_QTY"": """ & T_QTY & """ , " & vbCrLf
'                        Json = Json & """T_Change"": """ & T_Change & """ , " & vbCrLf
'                        Json = Json & """T_Period"": """ & T_Period & """ , " & vbCrLf
'                        Json = Json & """TK_Date"": """ & TK_Date & """  " & vbCrLf
'                        Json = Json & "}"
'                        
'                        Response.Write Json
'                End If
'        End IF
'End IF




%>


