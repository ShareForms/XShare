function xconfirm(btn, title, msg, style) {

   // debugger;
    $('#confirmator-body').addClass('alert-' + style);
    $('#confirmator-title').text(title);
    $('#confirmator-text').text(msg);

    $('#btn-confirm').on('click', function (event) {

        var eventt = $("#" + btn.id).attr('href').split(':')[1].replace("__doPostBack('", "").replace("','')", "");

        $('#exampleModal').modal('toggle');

        __doPostBack(eventt, '');

        return true;
    });
};

//function fancyConfirm(msg, btn, OkBtnText, CancelBtnText) {
//    var arrbtn = btn.id.split('_');
//    var html = '<div id="dialog-confirm" class="jumbirton"><h4>';
//    html += msg + '</h4><div class="form-subscribe">';
//    html += '<div style="text-align: center;"><a id="fancyConfirm_ok" class="btnGreen" style="display: inline-block; margin: 15px 15px 0 0;">' + OkBtnText + '</a>';
//    html += '<a id="fancyConfirm_cancel" class="btnRed">' + CancelBtnText + '</a>';
//    html += '</div></div></div>';
//    jQuery.fancybox({
//        'modal': true,
//        'content': html,
//        autoHeight: true,
//        autoWidth: true,
//        afterShow: function () {
//            $("#fancyConfirm_ok").bind("click", function (event) {
//                $.fancybox.close();
//                var event = $("#" + btn.id).attr('href').split(':')[1].replace("__doPostBack('", "").replace("','')", "");
//                __doPostBack(event, '');
//                return true;
//            });
//            $("#fancyConfirm_cancel").bind("click", function (event) {
//                $.fancybox.close();
//            });
//        },
//        afterClose: function () {
//            $.fancybox.close();
//        }
//    });
//    return false;
//}




//$(window).load(function () {

//    $('#exampleModal').on('show.bs.modal', function (event) {

//        debugger;
//        var button = $(event.relatedTarget) // Button that triggered the modal
//        var recipient = button.data('action') // Extract info from data-* attributes
//        // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
//        // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.

//        $('#btn-confirm').on('click', function (event) {
//            alert(recipient);
//        });


//        //var modal = $(this)
//        //modal.find('.modal-title').text('New message to ' + recipient)
//        //modal.find('.modal-body input').val(recipient)
//    });
//})



