<%@ Language="VBScript" %>
<%
Response.CodePage = 65001
Response.Charset = "UTF-8"
Session.CodePage = 65001
Session.LCID = 1054

ID = Request.QueryString("ID")

%>
<% username=Request.Cookies("LOGON_USER") 'esponse.write (username)
If username ="" Then
    Response.Write("<script>") 
    Response.Write("window.location.href = ' http://192.168.35.5/login.asp?href=http://192.168.35.5/basket/scan/default.asp?ID=" & T_ID & "'; ")
    Response.Write(" </script>")
  End If
 
  %>
    <!--#include file = "../backend/connection/db.asp"-->

<!DOCTYPE html>
<html lang="th">
    <head>
        <title>ตระกร้า</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width,initial-scale=1">  
        <link rel="stylesheet" href="../css/bootstrap.min.css">
        <link rel="stylesheet" href="../css/tempusdominus-bootstrap-4.min.css"/>
        <link rel="stylesheet" href="../css/Awesome_all.min.css">
        <link rel="stylesheet" href="../css/select2.min.css"> 
        <link rel="stylesheet" href="../css/adminlte.min.css">
    </head>
 <style>

 </style>

    <body >
     <!--#include file="./menu.asp"-->  
     <!--#include file="../lib/utility.asp"-->  
     <div class="container-fluid">
         <div class="row justify-content-center"> 
            <div class="col-md-12 text-center">
                  <h4>บันทึกข้อมูลตะกร้า</h4>  <hr/>
            </div>
           
                       <div class="col-md-3">
                                    <form id="insert_data">
                                            <div class="mb-3">
                                                <% 
                                                sql = "SELECT a.ID,b.ID as PTH_ID,b.PTH_Name,a.B_Number FROM [BasketPTH].[dbo].[Basket] a " &_  
                                                      " inner join [BasketPTH].[dbo].[PTH] b " &_ 
                                                      " On a.PTH_ID = b.ID " &_  
                                                      " Where a.ID = '"&ID&"'"
                                                        SET rs = db.Execute(sql)
                                                        IF Not rs.EOF Then  %>
                                                        <input class="form-control" id="Basket_ID" name="Basket_ID" value="<%=rs("ID")%>" hidden> 
                                                        <input class="form-control" id="PTH_ID" name="PTH_ID" value="<%=rs("PTH_ID")%>" hidden> 
                                                        <input class="form-control" value="<%=rs("PTH_Name")&" | "&rs("B_Number")%>" disabled>  
                                                <% End IF %>
                                                </select>
                                            </div>
                                            <hr />
                          
                                            <div class="mb-1">
                                            <label class="form-label">สถานะของตะกร้า</label>
                                                <select class="form-control" id="Status_ID" name="Status_ID" required>
                                                    <option value="">--- เลือก ---</option> 
                                                    <%
                                                            sql = "SELECT * FROM [BasketPTH].[dbo].[Status_basket]"
                                                            SET rs = db.Execute(sql)
                                                            While Not rs.EOF %>
                                                            <option value="<%=rs("ID")%>"><%=rs("s_status")%></option>  
                                                            <%  
                                                            rs.MoveNext
                                                            Wend
                                                            %>
                                                    </select>
                                            </div>
                                            <div class="mb-2" id="s_substatuss" style="display:none"> 
                                                <label class="form-label">ส่งซ่อม</label>
                                                <select class="form-control " id="Substatus_ID" name="Substatus_ID">
                                                    <option value="">--- เลือก ---</option> 
                                                    <%
                                                            sql = "SELECT * FROM [BasketPTH].[dbo].[Substatus_basket]"
                                                            SET rs = db.Execute(sql)
                                                            While Not rs.EOF %>
                                                            <option value="<%=rs("ID")%>"><%=rs("s_substatus")%></option>  
                                                            <%  
                                                            rs.MoveNext
                                                            Wend
                                                            %>
                                                    </select>   
                                            </div>
                                            <div class="mb-2 text-danger" id="others" style="display:none">
                                                 <textarea class="form-control" id="other" name="Other" rows="3" placeholder="จุดอื่นๆ"></textarea>
                                            </div>
                                            <div class="modal-footer">
                                            <button type="submit" class="btn btn-success">บันทึก</button>
                                            </div>
                                    </form>
                       </div>
            
</div>
                                <div class="row justify-content-center">
                                            <div class="col-md-4"> 

                                                            <%
                                                                SQL  = "SELECT COUNT(*) as COUNT_DATA From [BasketPTH].[dbo].[PTH_Detail] Where ID = '"&ID&"'"
                                                                            
                                                                SET rs = db.execute(SQL)

                                                                IF Not rs.EOF Then                
                                                                    IF rs("COUNT_DATA") > 0 Then 
                                                                %>
                                                                <hr/>
                                                                <a href="./report.asp?ID=<%=ID%>" class="btn btn-primary btn-block">ข้อมูลทั้งหมด</a> <hr>
                                                                <%
                                                        End IF
                                                    End IF
                                                %>
                                </div>
                            
                        </div>
                        
                </div>  
         </div>
    </body>
</html>
  
     <script src="../js/jquery.min.js"></script>
      <script src="../js/bootstrap.bundle.min.js"></script>      
      <script src="../js/select2.full.js"></script>
      <script src="../js/sweetalert2@11.js"></script>
      <script src="../js/moment.min.js"></script>  
      <script src="../js/tempusdominus-bootstrap-4.min.js"></script>
      <script src="../js/all.min.js"></script> 
      <script src="./script.js"></script> 
     