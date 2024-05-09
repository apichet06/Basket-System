// Force a reload of the current page



$(".insert_data").click(function (e) {
    e.preventDefault();
    var ID = $(this).data("id");

    $.ajax({
        type: "post",
        url: "./manages.asp",
        data: { ID, insert: "insert" },
        dataType: "json",
        success: function (response) {
            window.location.reload();
        }
    });

})

$("#cleanup").click(function (e) {
    e.preventDefault();
    $.ajax({
        type: "post",
        url: "./manages.asp",
        data: { cleanup: "cleanup" },
        dataType: "json",
        success: function (response) {
            window.location.reload();
        }
    });
});

// $(document).ready(function () {
//     $('.example').DataTable();
// });