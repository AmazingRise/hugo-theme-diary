var spy = function () {
  var elems = document.querySelectorAll(Array.from(Array(6).keys(), x => ".post-body h"+(x+1).toString()));
  // ":is()" was not supported until Chrome 88+
  // Here is a backfill
  if (elems.length == 0) {
    return;
  }
  var supportPageOffset = window.pageXOffset !== undefined;
  var isCSS1Compat = ((document.compatMode || "") === "CSS1Compat");

  var currentTop = supportPageOffset ? window.pageYOffset : isCSS1Compat ? document.documentElement.scrollTop : document.body.scrollTop;
  var currentBottom = currentTop + window.height;
  var pageBottom = window.pageBottom;

  var meetUnread = false
  let lastElemName = elems[elems.length - 1].id;
  elems.forEach(function (elem, idx) {
    var elemTop = elem.offsetTop;
    var id = elem.getAttribute('id');
    var navElems = document.getElementsByClassName("nav-"+id);
    if (navElems.length == 0) {
      return
    }
    if (currentTop >= elemTop || currentBottom >= pageBottom) {
      Array.from(navElems).forEach((e) => {
        e.classList.add('toc-active');
      });
    } else {
      if (meetUnread == false) {
        meetUnread = true;
        if (idx > 0) {
          lastElemName = elems[idx - 1].id; 
        }
      }
      Array.from(navElems).forEach((e) => {
        e.classList.remove('toc-active');
      });
    }
  })
  let selector = ".nav-" + lastElemName;
  // Two toc elements here
  document.querySelectorAll(selector).forEach(e => {
    e.scrollIntoView({ block: "center", behavior: 'smooth' });
  });
}
