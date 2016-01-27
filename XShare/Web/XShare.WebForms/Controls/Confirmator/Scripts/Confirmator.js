﻿function xconfirm(btn, title, msg, style) {

    $('#confirmator-body').addClass('alert-' + style);
    $('#confirmator-title').text(title);
    $('#confirmator-text').text(msg);

    $('#btn-xconfirm').on('click', function (event) {

        if (btn.href && btn.href.indexOf("__doPostBack") > -1) {

            var event = btn.href.split(':')[1]
                .replace("__doPostBack('", "").replace("','')", "");

            $('#btn-xcancel').click();

            __doPostBack(event, '');

        } else if (btn.href && btn.href.indexOf("WebForm_DoPostBackWithOptions") > -1) {
            var func = btn.href.split(':')[1];

            $('#btn-xcancel').click();

            eval(func);

        } else {
            $('#confirmator-body').addClass('alert-danger' + style);
            $('#confirmator-title').text("Fatal Error");
            $('#confirmator-text').text("Something get really wrong, please contact the user control creator!");
            return false;
        }

        return true;
    });
};