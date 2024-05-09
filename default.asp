<%@ Language=VBScript CodePage=65001 %>
<% Response.CharSet = "UTF-8" %>
<% username=Request.Cookies("LOGON_USER") 'esponse.write (username)
If username ="" Then
    Response.Write("<script>") 
    Response.Write("window.location.href = ' http://192.168.35.5/login.asp?href=http://192.168.35.5/basket/default.asp'; ")
    Response.Write(" </script>")
  End If
 
  %>
    <!--#include file = "./backend/connection/db.asp"-->


<!DOCTYPE html>
<html lang="th">
    <head>
        <title>ตระกร้า</title>
        <meta charset="UTF-8">
        <meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate">
        <meta http-equiv="Pragma" content="no-cache">
        <meta http-equiv="Expires" content="0">
        <meta name="viewport" content="width=device-width,initial-scale=1">  
        <link rel="stylesheet" href="./css/bootstrap.min.css">
        <link rel="stylesheet" href="./css/tempusdominus-bootstrap-4.min.css"/>
        <link rel="stylesheet" href="./css/Awesome_all.min.css">
        <link rel="stylesheet" href="./css/select2.min.css"> 
        <link rel="stylesheet" href="./css/adminlte.min.css"> 
        <link rel="stylesheet" href="./css/dataTables.bootstrap4.min.css"> 
    </head>


    <body >
     <!--#include file="./memu/menu.asp"-->  
     <!--#include file="./lib/utility.asp"-->  
     <div class="container-fluid">
         <div class="row justify-content-center"> 
            <div class="col-md-12 text-center">
                  <h3 class="text-info">รายงานตะกร้า(PTH)</h3> <hr>
            </div>
            <hr/>
                    <div class="col-md-11">
                        <div class="card">
                            <div class="card-body">
                                <div class="row justify-content-center">
                                    <div class="col-md-6 text-center">
                                        <!-- <form method= "post">
                                            <div class="row">
                                                <div class="col"> 
                                                    <input type="text" class="form-control datetimepicker-input" name="from" id="datetimepicker7" data-toggle="datetimepicker" data-target="#datetimepicker7" placeholder="From" autocomplete="off"/> 
                                                </div>
                                                <div class="col">
                                                    <input type="text" class="form-control datetimepicker-input" name="to" id="datetimepicker8" data-toggle="datetimepicker" data-target="#datetimepicker8"  placeholder="TO"  autocomplete="off"/>
                                                </div>
                                                <div class="col text-left">
                                                <button type="submit" class="btn btn-info">ค้นหา</button> 
                                                </div>
                                            </div>
                                            </form> -->
                                    </div>
                                </div>   
                                
                                <table class="table table-sm table-striped table-hover table-bordered" id="example">
                                    <thead>
                                        <tr>
                                        <th scope="col">#</th>
                                        <th scope="col">PTH</th>
                                        <th scope="col">หมายเลขตะกร้า</th>
                                        <th scope="col">สถานะของตะกร้า</th>
                                        <th scope="col">ส่งซ่อม</th>
                                        <th scope="col">จุดเสียอื่นๆ</th>
                                        <th scope="col">วันที่บันทึก</th>  
                                        <th scope="col">ผู้บันทึก</th> 
                                        </tr>
                                    </thead>
                                    <tbody >
 
                                                    <%    
                                                        i=1
                                                        sql = "EXEC [BasketPTH].[dbo].[PTH_Report]"
                                                        SET rs = db.execute(sql)
                                                                    While Not rs.EOF
                                                                    PTH_Name    = rs("PTH_Name")
                                                                    B_Number    = rs("B_Number")
                                                                    S_status    = rs("S_status")
                                                                    S_substatus = rs("S_substatus")
                                                                    Other       = rs("Other")
                                                                    D_datatime  = rs("D_datatime")
                                                                    D_username  = rs("D_username")
                                                                 
                                                                %> 
                                                                <tr style="font-size:15px">
                                                                <th scope="row"><%=i %></th>
                                                                <td><%=PTH_Name%></td>
                                                                <td><%=B_Number%></td>
                                                                <td><% if S_status <> "" then response.write(S_status) else response.write("-") end if %> </td> 
                                                                <td><% if S_substatus <> "" then response.write(S_substatus) else response.write("-") end if %></td>
                                                                <td><% if Other <> "" then response.write(Other) else response.write("-") end if %></td>
                                                                <td><% if D_datatime <> "" then response.write(D_datatime) else response.write("-") end if %></td> 
                                                                <td><% if D_username <> "" then response.write(D_username) else response.write("-") end if %></td> 
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
                </div>  
         </div>
    </body>
</html>

 
<%

%>
 

<!DOCTYPE html>
<html>
<head>
    <title>คำนวณระยะเวลา</title>
</head>
<body>
    
 
</body>
</html>

 
      <script src="./js/jquery.min.js"></script>
      <script src="./js/bootstrap.bundle.min.js"></script>      
      <script src="./js/select2.full.js"></script>
      <script src="./js/sweetalert2@11.js"></script>
      <script src="./js/moment.min.js"></script>  
      <script src="./js/tempusdominus-bootstrap-4.min.js"></script> 
      <script src="./js/all.min.js"></script> 
      <script src="./js/jquery.dataTables.min.js"></script> 
      <script src="./js/dataTables.bootstrap4.min.js"></script> 
      <!-- Excel -->
      <script src="./js/dataTables.buttons.min.js"></script>  
      <script src="./js/jszip.min.js"></script>   
      <script src="./js/buttons.html5.min.js"></script>  
      <!--End Excel -->
      <script>
        $(document).ready(function () {
            $('#example').DataTable({
        dom: 'Bfrtip',
        buttons: [{
                extend: 'excel',
                className: 'btn btn-success btn-sm', // เพิ่มคลาสนี้
                text: 'Export to Excel' // เปลี่ยนข้อความที่ปุ่ม Excel
            }]
            }); 
 
       });
        $(function () {
                $('#datetimepicker7').datetimepicker({
                    format: 'L',
                    format: 'YYYY-MM-DD' 
                });
                $('#datetimepicker8').datetimepicker({
                    useCurrent: false,
                    format: 'L',
                    format: 'YYYY-MM-DD'
                });
                $("#datetimepicker7").on("change.datetimepicker", function (e) {
                    $('#datetimepicker8').datetimepicker('minDate', e.date);
                });
                $("#datetimepicker8").on("change.datetimepicker", function (e) {
                    $('#datetimepicker7').datetimepicker('maxDate', e.date);
                });
            });
      </script>
     