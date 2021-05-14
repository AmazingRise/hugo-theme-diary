var spy = function () {
  var elems = $(":header");
  if (elems.length == 0) {
    return;
  }
  var currentTop = $(window).scrollTop();
  var currentBottom = $(window).scrollTop() + $(window).height();
  var pageBottom = $('#EOF').offset().top;

  var meetUnread = false
  var currentIndex = elems.length - 1
  elems.each(function (idx) {
    var elemTop = $(this).offset().top;
    var id = $(this).attr('id');
    var navElem = $('#' + id + '-nav');
    if (currentTop + $(this).height() >= elemTop) {
      navElem.addClass('toc-active');
    } else {
      if (meetUnread == false) {
        meetUnread = true
        currentIndex = idx - 1
      }
      navElem.removeClass('toc-active');
    }
  })
  if (currentBottom >= pageBottom) {
    currentIndex = -1
  }
  //console.log(currentIndex);
  //Collapse them
  collapseOthers(currentIndex);
}

var onNavClick = function () {
  spy()
}

var collapseOthers = function (currentIndex) {
  if (currentIndex == -1) {
    $(".collapse").each(function (idx) {
      $(this).collapse("hide");
    });
    return;
  }
  var elems = $(":header");
  //console.log(currentIndex);
  currentId = "#" + elems[currentIndex].id + "-nav";

  $(currentId).parents(".collapse").each(function (idx) {
    $(this).collapse("show");
  });
  $(currentId).parent().next().filter(".collapse").collapse("show");
  $(".collapse").not($(currentId).parents()).not($(currentId).parent().next()).each(function (idx) {
    $(this).collapse("hide");
  });
}

//From https://github.com/lodash/lodash/blob/master/debounce.js
// and https://github.com/lodash/lodash/blob/master/isObject.js

