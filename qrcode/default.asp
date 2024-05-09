<%@ Language="VBScript" %>
<%
Response.CodePage = 65001
Response.Charset = "UTF-8"
Session.CodePage = 65001
Session.LCID = 1054
%>
<% username=Request.Cookies("LOGON_USER") 'esponse.write (username)
If username ="" Then
    Response.Write("<script>") 
    Response.Write("window.location.href = ' http://192.168.35.5/login.asp?href=http://192.168.35.5/basket/default.asp'; ")
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
        <link rel="stylesheet" href="../css/dataTables.bootstrap4.min.css">
      
    </head>
 <style>

 </style>

    <body >
     <!--#include file="../memu/menu.asp"-->  
     <!--#include file="../lib/utility.asp"-->  
     <div class="container-fluid">
         <div class="row justify-content-center"> 
            <div class="col-md-12 text-center">
                  <h3>Qrcode</h3> 
            </div>
            <hr/>
                        <div class="col-md-7"> 
                            <hr />
                            <div class="card"> 
                                <div class="card-body">
                                <h4> คลิกเลือกรายการที่ต้องการ Print</h4> <hr/>
                                      <table class="table table-sm table-striped table-hover table-bordered example">
                                         <thead>
                                           <tr>
                                            <th scope="col">#</th>
                                            <th scope="col">เลือก</th> 
                                            <th scope="col">PTH</th>
                                            <th scope="col">หมายเลขตะกร้า</th> 
                                           </tr>
                                        </thead>
                                        <tbody>
                                               <% i=1
                                               sql = " SELECT a.ID AS ID, a.B_Number AS B_Number, b.PTH_Name AS PTH_Name" &_
                                                      " FROM [BasketPTH].[dbo].[Basket] a" &_ 
                                                      " INNER JOIN [BasketPTH].[dbo].[PTH] b ON a.PTH_ID = b.ID" &_  
                                                      " WHERE NOT EXISTS (SELECT 1 FROM [BasketPTH].[dbo].[QrCode] c WHERE a.ID = c.Basket_ID)"
 
                                                    Set rs = db.Execute(sql)
                                                    While Not rs.EOF
                                                        ID = rs("ID")
                                                        PTH_Name = rs("PTH_Name")
                                                        B_Number = rs("B_Number")
                                                         
                                                %>
                                            <tr>
                                            <th scope="row"><%=i %></th>
                                            <td><a href="#" class="insert_data" data-id="<%=ID%>">เลือก</a></td>
                                            <td><%=PTH_Name %></td>
                                            <td><%=B_Number %></td> 
                                            </tr>
                                             <%
                                        i = i + 1
                                        rs.MoveNext
                                    Wend
                                    %> 
                                        </tbody>
                                      </table>
                                     
                                </div>
                            </div>
                        </div>
                        <div class="col-md-7"> 
                            <hr />
                            <div class="card"> 
                                <div class="card-body">
                                <h4> รายการที่จะ Print</h4> <hr/>
                                 <table class="table table-sm table-striped table-hover table-bordered example1">
                                                <thead>
                                                    <tr>
                                                        <th>#</th>
                                                        <th scope="col">PHT</th>
                                                        <th scope="col">หมายเลขตะกร้า</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <% i=1
                                                  sql = " SELECT a.ID as ID ,a.B_Number as B_Number, b.PTH_Name as PTH_Name" &_
                                                        " FROM [BasketPTH].[dbo].[Basket] a" &_ 
                                                        " INNER JOIN [BasketPTH].[dbo].[PTH] b ON a.PTH_ID = b.ID" &_   
                                                        " INNER JOIN [BasketPTH].[dbo].[QrCode] c ON a.ID = c.Basket_ID"    
                                                        'on error resume next
                                                       set  rs = db.Execute(sql)
                                                            While Not rs.EOF
                                                              
                                                             PTH_Name = rs("PTH_Name")
                                                             B_Number = rs("B_Number")    
                                                   %>  
                                                    <tr>
                                                        <td><%=i%></td>
                                                        <td><%=PTH_Name%></td>
                                                        <td><%=B_Number%></td> 
                                                    </tr> 
                                                  <%
                                                            i = i + 1
                                                            rs.MoveNext
                                                    Wend
                                                  %> 
                                                </tbody> 
                                            </table>
                                            <div class="text-right">
                                                <hr>
                                            <a href="#" class="btn btn-danger" id="cleanup">ลบ</a> 
                                            <a href="print.asp" target="_black" class="btn btn-info" >Print</a>
                                            </div> 
                                </div>
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
      <script src="../js/jquery.dataTables.min.js"></script> 
      <script src="../js/dataTables.bootstrap4.min.js"></script> 
      <script src="../js/all.min.js"></script>
      <script src="./script.js"></script>
      <script>
        $(document).ready(function () {
             $('.example1').DataTable();
  // เช็คว่ามีค่าการค้นหาที่ถูกเก็บไว้ใน localStorage หรือไม่
  var searchValue = localStorage.getItem('datatableSearch');

  // ตั้งค่าค่าการค้นหาใน DataTables
  var dataTable = $('.example').DataTable();
  if (searchValue) {
    dataTable.search(searchValue).draw();
  }

  // เมื่อมีการค้นหาใน DataTables ให้เก็บค่าการค้นหาลงใน localStorage
  $('.example').on('search.dt', function () {
    var currentSearch = dataTable.search();
    localStorage.setItem('datatableSearch', currentSearch);
  });

  // การเรียกใช้ฟังก์ชัน reload ของ Bootstrap
  $('.reload-button').click(function () {
    // ลบค่าการค้นหาออกจาก localStorage
    localStorage.removeItem('datatableSearch');

    // เรียกใช้งานฟังก์ชัน reload ของ Bootstrap ที่ต้องการ
    // ตัวอย่าง: location.reload();
  });
});
      </script>