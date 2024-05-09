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
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"> 
    <title>ตระกร้า</title>
    <link rel="stylesheet" href="../css/bootstrap.min.css"> 
    <link rel="stylesheet" href="../css/tempusdominus-bootstrap-4.min.css"/>
   <!-- <link rel="stylesheet" type="text/css" href="../font/stylesheet.css"> -->
     <script src="../js/qrcode.min.js"></script>
  </head>
  <body> 
 <!--  onload=" window.print(); window.close()" -->
   <!--#include file="../lib/utility.asp"--> 
    <style> 
       .qrcode {
          display: flex;
          flex-direction: column;
          justify-content: center;
          align-items: center;
        }
    </style>
     
              <div class="container "> 
                          <div class="row justify-content-center">     

                          <%
                              sql = " SELECT a.ID as ID ,a.B_Number as B_Number, b.PTH_Name as PTH_Name" &_
                                    " FROM [BasketPTH].[dbo].[Basket] a" &_ 
                                    " INNER JOIN [BasketPTH].[dbo].[PTH] b ON a.PTH_ID = b.ID" &_   
                                    " INNER JOIN [BasketPTH].[dbo].[QrCode] c ON a.ID = c.Basket_ID" 

                          set row = db.execute(sql)
                              do while not row.eof                            
                          %>
                          <div class="col-md-3 p-1">
                            <div class="card">
                                <div class="card-body text-center">
                                  <div class="qrcode" id="qrcode<%=row(("ID"))%>"><%=GenerateQRCode(row(("ID")))%></div> 
                                  <hr>
                                  <h5><%=row("PTH_Name")&" | "&row("B_Number")%></h5>
                                </div>
                              </div> 
                          </div> 
  
           <%
                  row.moveNext 
            loop 
            %> 
            </div>  
          </div>
        </div>
      </div>
    </div>
     <script src="../js/jquery.min.js"></script> 
     
<script>
    $(document).ready(function() {
      // Print the page
      window.print();

      // Close the window after a short delay (adjust the delay as needed)
      setTimeout(function() {
        window.close();
      }, 500); // 1000 milliseconds = 1 second
    });
  </script>
</body>
 
</html>