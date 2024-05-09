 
  

  <%   
   sql = "SELECT [EI_Title],[EI_FirstName],[EI_LastName],[EI_DepartmentShort] FROM MA_EffectiveUser Where Username =  '"+username+"'"

   set rs_userlogin = db96.execute(sql)
   if rs_userlogin.eof = false then
        name =  rs_userlogin("EI_Title") & "" & rs_userlogin("EI_FirstName") &" "& rs_userlogin("EI_LastName") &" "& rs_userlogin("EI_DepartmentShort")
        user = rs_userlogin("EI_FirstName")
     If   rs_userlogin("EI_DepartmentShort") <>"MFG" and rs_userlogin("EI_DepartmentShort") <>"IT"  Then %>
    <script>
        $(document).ready(function() {
            Swal.fire({
                title: 'Oops...',
                text: "เข้าใช้งานได้เฉพาะ PD และ MIS เท่านั้น!",
                icon: 'error',
                showCancelButton: false,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'OK'
            }).then((result) => {
                if (result.isConfirmed) {
                    location.href = "http://192.168.35.5/login.asp?href=http://192.168.35.5/basket/default.asp";

                }
            })
        });
    </script>

    <% 
 
     End if
 

    end if

    logout =  Request.Form("Logout")
 If logout  ="Logout"  Then
 For Each cookie in Response.Cookies
    Response.Cookies(cookie).Expires = DateAdd("d",-1,now())
    response.write("<script> window.location.reload()</script>") 
Next
 
 End if
 
  part_file = left(Request.ServerVariables("SCRIPT_NAME"),InStrRev(Request.ServerVariables("SCRIPT_NAME"),"/")) 
 
%>
<style> 
body {
  /* min-height: 75rem; */
  padding-top: 4.7rem; 
  background-color: #F8F8F8;
    }

 .navbar-brand_ {
  border-bottom: 3px solid #F8F8F8;
}   
</style>
 
<nav class="navbar navbar-expand-lg navbar-light fixed-top shadow navbar-brand_" style="background-color:  #0DC56F;" > 
   <% If part_file ="/basket/" Then %>
  <a class="navbar-brand text-light" href="./default.asp"><i class="fa-solid fa-basket-shopping"></i></a>
  <% Else %>
    <a class="navbar-brand text-light" href="../default.asp"><i class="fa-solid fa-basket-shopping"></i></a>
  <% End if %>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon "></span> 
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto "> 
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle text-light" href="#" role="button" data-toggle="dropdown" aria-expanded="false">
          การบันทึกข้อมูล
        </a>
        <div class="dropdown-menu">
           <% If part_file ="/basket/" Then %>
          <a class="dropdown-item" href="./Service">บันทึก-รายละเอียดการเปลี่ยนตระกร้า</a> 
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="./report/report.asp">ประวัติรายงานการเปลี่ยนตระกร้า</a> 
           <% Else %>
          <a class="dropdown-item" href="../Service">บันทึก-รายละเอียดการเปลี่ยนตระกร้า</a> 
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="../report/report.asp">ประวัติรายงานการเปลี่ยนตระกร้า</a>
        
           <% End if %>
        </div>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle text-light" href="#" role="button" data-toggle="dropdown" aria-expanded="false">
          การจัดการข้อมูล
        </a>
        <div class="dropdown-menu"> 
           <% If part_file ="/basket/" Then %>
            <a class="dropdown-item" href="./qrcode/default.asp">Print Qrcode</a> 
           <% Else %>
            <a class="dropdown-item" href="../qrcode/default.asp">Print Qrcode</a> 
           <% End if %>
        </div>
      </li>
       <li class="nav-item">
        <% If part_file ="/basket/" Then %>
          <a class="nav-link text-light" aria-current="page" href="./manual/default.asp">คู่มือการใช้งาน</a>
        <% Else %>
            <a class="nav-link text-light" aria-current="page" href="../manual/default.asp">คู่มือการใช้งาน</a>
        <% End if %>
        </li> 
    </ul>
    <form class="form-inline my-2 my-lg-0 text-light" method="Post">
        <div>
             <%=name%> &nbsp;
            <input type="text" name="Logout" value="Logout" hidden="true">
            <button type="submit" class="btn btn-sm btn-outline-light text-light">logout</button>
         </div>
    </form>
  </div>
</nav> 
  