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