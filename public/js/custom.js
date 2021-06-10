jQuery(document).ready(function ($) {


    $('#laravel_datatable').DataTable();

    $('#laravel_datatable_sa_post').DataTable();


    // CREATE
    $(".send_mail").click(function (e) {
        var elem = jQuery(this)
        $.ajaxSetup({
            headers: {
                'X-CSRF-TOKEN': jQuery('meta[name="csrf-token"]').attr('content')
            }
        });
        e.preventDefault();
        var formData = {
            id: jQuery(this).attr("data-id")
        };
        var type = "POST";
        $.ajax({
            type: type,
            url: jQuery(this).attr("data-url"),
            data: formData,
            dataType: 'json',
            success: function (data) {
                if (data.success == true) {

                }
                elem.append(data.message);
                console.log("sent");
            },
            error: function (data) {
                elem.append("failed");
                console.log("failed");
            }
        });
    });
});