<% username=Request.Cookies("LOGON_USER") 'esponse.write (username)
If username ="" Then
    Response.Write("<script>") 
    Response.Write("window.location.href = ' http://192.168.35.5/login.asp?href=http://192.168.35.5/basket/default.asp'; ")
    Response.Write(" </script>")
  End If
 
  %>
    <!--#include file = "../backend/connection/db.asp"-->
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>ตระกร้า</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="../css/bootstrap.min.css">     
        <link rel="stylesheet" href="../css/tempusdominus-bootstrap-4.min.css"/>
        <link rel="stylesheet" href="../css/Awesome_all.min.css">
        <link rel="stylesheet" href="../css/select2.min.css">
        <link rel="stylesheet" href="../css/dataTables.bootstrap4.min.css">
        <link rel="stylesheet" href="../css/adminlte.min.css"> 
        <!-- <link rel="stylesheet" href="../font/stylesheet.css">  -->
    </head>
    <body>
     <!--#include file="../memu/menu.asp"-->  

      <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-md-5">
                            <h4>บันทึกข้อมูลตะกร้า</h4>
                            <hr />
                            <div class="card"> 
                                <div class="card-body">
                                    <form id="insert_data"> 
                                            <div class="mb-1">
                                              <label class="form-label">PTH</label>
                                             <select class="form-control" id="PTH_ID" name="PTH_ID" required>
                                                <option value="">--- เลือก ---</option> 
                                                <%
                                                        sql = "SELECT * FROM [BasketPTH].[dbo].[PTH]"
                                                        SET rs = db.Execute(sql)
                                                        While Not rs.EOF
                                                        %>
                                                           <option value="<%=rs("ID")%>"><%=rs("PTH_Name")%>  </option>  
                                                        <%  
                                                        rs.MoveNext
                                                        Wend
                                                        %>
                                                </select>
                                            </div> 
                                            <div class="mb-1">   
                                            <label class="form-label">หมายเลขตะกร้า</label>
                                            <select class="form-control select2" id="Basket_ID" name="Basket_ID" required>
                                               <option value="">--- เลือก ---</option> 
                                                
                                                </select>
                                            </div> 
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
                                                <select class="form-control" id="Substatus_ID" name="Substatus_ID">
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
                        </div>  
                        </div>
                    <div>
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