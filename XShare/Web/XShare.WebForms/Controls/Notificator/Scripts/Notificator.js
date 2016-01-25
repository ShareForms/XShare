$(document).ready(function () {
    $('.notificator').toggleClass('in');
    setTimeout(function () {
        $('.AutoHide').toggleClass('in');
        setTimeout(function() {
            $('.AutoHide').remove();
        }, 1500);
    }, 5000);
});