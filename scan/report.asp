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
    Response.Write("window.location.href = ' http://192.168.35.5/login.asp?href=http://192.168.35.5/Tank/scan/default.asp?ID=" & ID & "'; ")
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
                  <h4>ประวัติรายงานการเปลี่ยนตระกร้า</h4><hr/>
            </div>
             <div class="col-md-12 text-center">
                  <h4> <a href="./default.asp?ID=<%=ID%>"><i class="fa-solid fa-house-chimney"></i></a></h4> <hr/>
            </div>
            <div class="col-md-12 ">
                                    <div class="row justify-content-center">
                                        
                                                                    <%
                                                            
                                                                    i=1
                                                                   sql = "EXEC [BasketPTH].[dbo].[ReportPTHALL] '"&ID&"' "

                                                                            on error resume next

                                                                            SET rs = db.Execute(sql)
                                                                                While Not rs.EOF
                                                                                PTH_Name    = rs("PTH_Name")
                                                                                B_Number    = rs("B_Number")
                                                                                S_status    = rs("S_status")
                                                                                S_substatus = rs("S_substatus")
                                                                                Other       = rs("Other")
                                                                                D_datatime  = rs("D_datatime")
                                                                                D_username  = rs("D_username")
                                                                    %> 
                                                                    <div class="col-md-4">  
                                                                        <div class="card"> 
                                                                            <div class="card-body">  
                                                                            <div class="text-center">
                                                                                                    *** <%=i%> ***
                                                                                                </div> 
                                                                                                <table class="table table-sm">
                                                                                                <thead>
                                                                                                <tr>
                                                                                                    <th class="text-right">PTH :</th>
                                                                                                    <th ><%=PTH_Name  %></th> 
                                                                                                </tr>
                                                                                                <tr>
                                                                                                    <th class="text-right">หมายเลขตะกร้า :</th>
                                                                                                    <th ><%=B_Number  %></th> 
                                                                                                </tr>
                                                                                                <tr>
                                                                                                    <th class="text-right">สถานะของตะกร้า :</th>
                                                                                                    <th > <%=S_status  %></th> 
                                                                                                </tr>
                                                                                                <tr>
                                                                                                    <th class="text-right">ส่งซ่อม :</th>
                                                                                                    <th ><% IF IsNull(S_substatus) Then response.write("N/A") Else response.write S_substatus End IF%></th> 
                                                                                                </tr>
                                                                                                <tr>
                                                                                                    <th class="text-right">จุดเสียอื่นๆ :</th>
                                                                                                    <th > <% IF  Other ="" Then response.write("N/A") Else response.write Other End IF%></th> 
                                                                                                </tr>
                                                                                                <tr>
                                                                                                    <th class="text-right text-secondary">วันที่บันทึก :</th>
                                                                                                    <th class="text-secondary"><%=D_datatime %></th> 
                                                                                                </tr>
                                                                                                <tr>
                                                                                                    <th class="text-right text-secondary">ผู้บันทึก :</th>
                                                                                                    <th class="text-secondary"><%=D_username%> </th> 
                                                                                                </tr>
                                                                                                </thead> 
                                                                                            </table> 
                                                                                              
                                                                                   </div> 
                                                                         </div>
                                                                 </div>     
                                                                        
                                                                 <%
                                                                                i = i + 1
                                                                                rs.MoveNext
                                                                        Wend
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
     