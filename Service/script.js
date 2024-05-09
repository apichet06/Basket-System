

$(".select2").select2({});

$(document).ready(function () {
    $('#example').DataTable();
});

$("#insert_data").submit(function (e) {
    e.preventDefault();
    var PTH_ID = $("#PTH_ID").val();
    var Basket_ID = $("#Basket_ID").val();
    var Status_ID = $("#Status_ID").val();
    var Substatus_ID = $("#Substatus_ID").val();
    var Other = $("#other").val();
    $.ajax({
        type: "post",
        url: "./manages.asp",
        data: { PTH_ID, Basket_ID, Status_ID, Substatus_ID, Other, insert: "insert" },
        dataType: "json",
        success: function (response) {
            if (response.data == "1") {
                Swal.fire({
                    title: 'บันทึกข้อมูลสำเร็จ',
                    icon: 'success',
                    showCancelButton: false,
                    confirmButtonColor: '#3085d6',
                    confirmButtonText: 'ตกลง'
                }).then((result) => {
                    if (result.isConfirmed) {
                        window.location.reload();
                    }
                })

            } else {
                Swal.fire({
                    title: 'ข้อมูลซ้ำ',
                    icon: 'error',
                    showCancelButton: false,
                    confirmButtonColor: '#3085d6',
                    confirmButtonText: 'ตกลง'
                })

            }

        }
    });

});

$("#PTH_ID").change(function (e) {
    var PTH_ID = $("#PTH_ID").val();

    $.ajax({
        type: "post",
        url: "./manages.asp",
        data: { PTH_ID, searchBasket: "search" },
        dataType: "json",
        success: function (response) {
            var optionsHtml = '<option value="">--- เลือก ---</option>';
            response.data.forEach(function (item) {
                // console.log("ID: " + item.ID + ", B_Number: " + item.B_Number);
                optionsHtml += '<option value="' + item.ID + '">' + item.B_Number + '</option>';
            });

            $("#Basket_ID").html(optionsHtml);
        }
    });
})


$("#Status_ID").change(function (e) {
    e.preventDefault()
    var Status_ID = $("#Status_ID").val();
    var s_substatuss = document.getElementById("s_substatuss")
    var others = document.getElementById("others")
    console.log(Status_ID);
    if (Status_ID == 4) {
        s_substatuss.style.display = "block";
        document.getElementById("Substatus_ID").setAttribute("required", "required");

    }
    else {
        s_substatuss.style.display = "none";
        others.style.display = "none";
        document.getElementById("Substatus_ID").removeAttribute("required")
        document.getElementById("other").removeAttribute("required");
    }
})

$("#Substatus_ID").change(function (e) {
    e.preventDefault()
    var Substatus_ID = $("#Substatus_ID").val();
    var others = document.getElementById("others")
    if (Substatus_ID == 15) {
        others.style.display = "block";
        document.getElementById("Substatus_ID").setAttribute("required", "required");
        document.getElementById("other").setAttribute("required", "required");

    }
    else {
        others.style.display = "none";
        document.getElementById("other").removeAttribute("required");
    }
})
