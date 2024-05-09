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
    Response.Write("window.location.href = ' http://192.168.35.5/login.asp?href=http://192.168.35.5/basket/scan/default.asp?ID=" & T_ID & "'; ")
    Response.Write(" </script>")
  End If
 
  %>
    <!--#include file = "../backend/connection/db.asp"-->
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>คู่มือการใช้งานระบบตะกล้า</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">  
        <link rel="stylesheet" href="../css/bootstrap.min.css">
        <link rel="stylesheet" href="../css/tempusdominus-bootstrap-4.min.css"/>
        <link rel="stylesheet" href="../css/Awesome_all.min.css">
        <link rel="stylesheet" href="../css/select2.min.css"> 
        <link rel="stylesheet" href="../css/adminlte.min.css">
        <link rel="stylesheet" href="../css/dataTables.bootstrap4.min.css">
    </head>
    <body>
          <!--#include file="../memu/menu.asp"-->  
   
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                 <h3>คู่มือการใช้งานระบบตะกร้า <hr></h3>
                 <ul>
                    <li class="mb-3">1.ล็อกอินเข้าใช้งานระบบ
                        <ul >
                            <li >1.1 การล็อกอิน ใช้ Username  , Password ของ K2 คลิก Submit เพื่อเข้าสู่ระบบ -> 
                            <a href="http://192.168.35.5/basket/default.asp">URL เข้าใช้งานระบบตะกล้า</a>
                            <br><br>
                                <img src="../image/1.Login.jpg" class="img-thumbnail"  height="350"> 
                            </li>
                            
                        </ul> 
                    </li>
                    <li class="mb-4">2.สร้าง QrCode เข้าที่เมนู การจัดการข้อมูล -> Print QRCode <br>
                                <img src="../image/2.สร้างQrcode.jpg" class="img-thumbnail"  height="100">  
                        <ul>
                            <li>2.1 เลือกหมายเลขตระกร้าที่ต้องการ แล้วเลือก Print QrCode ที่เลือกไว้
                                <br/>
                                <img src="../image/2.1.สร้างQrcode.jpg" class="img-thumbnail"  height="450"> 
                                <img src="../image/2.2.สร้างQrcode.jpg" class="img-thumbnail"  height="450"> 
                                <img src="../image/2.3.สร้างQrcode.jpg" class="img-thumbnail"  height="400"> 
                            </li> 
                        </ul>
                    </li>
                    <li class="mb-3">3.การแสกน QRCode เพื่อบันทึกข้อมูลหมายเลขตะกล้า ด้วย Mobile <i class="fa-solid fa-mobile-screen-button"></i>
                        <ul>
                            <li class="mb-3">3.1 แสกน QrCode จะเห็นข้อมูลหมายเลขตะกร้า เช่น PTH1 | 10 หลังจากนั้นให้เลือกสถานะของตะกร้า เช่น ส่งตะกร้ายิงทราย คลิกที่ -> บันทึก <br>
                              <img src="../image/3.1.บันทึกข้อมูลผ่าน Moblie.jpg" class="img-thumbnail"  height="400"> 
                            </li>
                            <li class="mb-3">3.2 กรณีเลือกสถานะของตะกร้า เป็น ส่งซ่อม จะมีเหตุผลเพิ่มเติมให้เลือก เช่น งานด้านซ้ายชำรุด  คลิกที่ -> บันทึก<br>
                             <img src="../image/3.2.บันทึกข้อมูลผ่าน Moblie.jpg" class="img-thumbnail"  height="450"> 
                             </li>
                            <li class="mb-3">3.3 กรณีเลือก ส่งซ่อม เป็น จุดอื่นๆ บนตะกร้า จำเป็นต้องกรอก จุดอื่นๆเพิ่มเติมจากหัวข้อที่ให้เลือก  คลิกที่ -> บันทึก<br>
                             <img src="../image/3.2.บันทึกข้อมูลผ่าน Moblie.jpg" class="img-thumbnail"  height="450"> 
                            </li>
                        </ul>
                    </li>
                    <li class="mb-3"><hr>4.การบันทึกข้อมูล ผ่าน Browser Google Chome <br> <br>
                     <img src="../image/4.1.การบันทึข้อมูลผ่านgoogle chome.jpg" class="img-thumbnail"  height="150">
                        <ul>
                            <li>4.1 เลือก PTH 1 หรือ PTH 2 -> เลือก หมายเลขตะกร้า -> เลือกสถานะของตะกร้า เช่น ส่งตะกร้ายิงทราย คลิกที่ -> บันทึก <br>
                             <img src="../image/4.3.การบันทึข้อมูลผ่านgoogle chome.jpg" class="img-thumbnail"  height="400">
                            </li>  
                            <li>4.2 กรณีเลือกสถานะของตะกร้า เป็น ส่งซ่อม จะมีเหตุผลเพิ่มเติมให้เลือก เช่น งานด้านซ้ายชำรุด คลิกที่ -> บันทึก <br>
                             <img src="../image/4.4.การบันทึข้อมูลผ่านgoogle chome.jpg" class="img-thumbnail"  height="450">
                            </li>
                            <li>4.3 กรณีเลือก ส่งซ่อม เป็น จุดอื่นๆ บนตะกร้า จำเป็นต้องกรอก จุดอื่นๆเพิ่มเติมจากหัวข้อที่ให้เลือก คลิกที่ -> บันทึก <br>
                             <img src="../image/4.5.การบันทึข้อมูลผ่านgoogle chome.jpg" class="img-thumbnail"  height="500">
                            </li>  
                        </ul>
                    </li>
                    <li class="mb-3">5.รายงานประวัติรายงานการเปลี่ยนตระกร้า <br> 
                             <img src="../image/5.1 ReportAll.jpg" class="img-thumbnail"  height="100">
                        <ul>
                            <li class="mb-3">เป็นประวัติการกรอกข้อมูลทั้งหมดที่เคยบันทึกไว้ แสดงเวลาที่บันทึกและชื่อผู้ใช้งานที่บันทึกข้อมูลหมายเลขตะกร้านั้นๆ <br>
                            <img src="../image/5.2 ReportAll.jpg" class="img-thumbnail"  height="200">
                            </li>
                        </ul>
                    </li>
                    <li class="mb-3">6.รายงานตะกร้า(PTH)<br> 
                             <img src="../image/6 Report Basket PTH.jpg" class="img-thumbnail"  height="100">
                        <ul>
                            <li class="mb-3">เป็นรายงานแสดงการบันทึกข้อมูลสถานะล่าสุดของตะกล้านั้นๆ ตามหมายเลขตะกล้าที่มีในระบบ และสามารถ Export Excel ออกมาได้<br> 
                             <img src="../image/6.1 Report Basket PTH.jpg" class="img-thumbnail"  height="370">
                            </li>
                        </ul>
                    </li> 
                 </ul>
            </div>
            <div class="col-md-12 text-center">
                <hr>
                 <h1>จบขั้นตอนวิธีใช้งานระบบตะกร้า</h1>
                 <hr>
            </div>
        </div>
    </div>


      <script src="../js/jquery.min.js"></script>
      <script src="../js/bootstrap.bundle.min.js"></script>      
      <script src="../js/select2.full.js"></script>
      <script src="../js/sweetalert2@11.js"></script>
      <script src="../js/moment.min.js"></script>
      <script src="../js/tempusdominus-bootstrap-4.min.js"></script>
      <script src="../js/jquery.dataTables.min.js"></script> 
      <script src="../js/dataTables.bootstrap4.min.js"></script> 
      <script src="../js/all.min.js"></script>
    </body>
</html>