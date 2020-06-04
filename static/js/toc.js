var spy = function () {
    var elems = $(":header");
    if (elems.length == 0) {
        return;
    }
    var currentTop = $(window).scrollTop();
    var currentBottom = $(window).scrollTop() + $(window).height();
    var pageBottom = $('#EOF').offset().top;

    var meetUnread = false
    var currentIndex = -1
    elems.each(function (idx) {
        var elemTop = $(this).offset().top;
        var id = $(this).attr('id');
        var navElem = $('#' + id + '-nav');
        if (currentTop + $(this).height() >= elemTop || currentBottom >= pageBottom) {
            navElem.addClass('toc-active');
        } else {
            if (meetUnread == false) {
                meetUnread = true
                currentIndex = idx - 1
            }
            navElem.removeClass('toc-active');
        }
    })
}
$().ready(function () {
    $(".collapse").each(function (idx) {
        $(this).collapse("show");
    });
    spy();
    $(window).bind('scroll', throttle(spy));
});

function throttle(func, timeout = 250) {
    let last;
    let timer;
   
    return function () {
      const context = this;
      const args = arguments;
      const now = +new Date();
   
      if (last && now < last + timeout) {
        clearTimeout(timer)
        timer = setTimeout(function () {
          last = now
          func.apply(context, args)
        }, timeout)
      } else {
        last = now
        func.apply(context, args)
      }
    }
  }