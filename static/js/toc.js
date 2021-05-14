var spy = function () {
  var elems = document.querySelectorAll("h1, h2, h3, h4, h5, h6");
  if (elems.length == 0) {
    return;
  }
  var supportPageOffset = window.pageXOffset !== undefined;
  var isCSS1Compat = ((document.compatMode || "") === "CSS1Compat");

  var currentTop = supportPageOffset ? window.pageYOffset : isCSS1Compat ? document.documentElement.scrollTop : document.body.scrollTop;
  var currentBottom =  currentTop + window.height;
  var pageBottom = window.pageBottom;

  var meetUnread = false
  var lastId = ""
  elems.forEach(function (elem, idx) {
    var elemTop = elem.offsetTop;
    var id = elem.getAttribute('id');
    //console.log(id,elem.offsetTop)
    var navElem = document.getElementById(id + '-nav');
    if (navElem==null) {
      return
    }
    if (currentTop >= elemTop || currentBottom >= pageBottom) {
      navElem.classList.add('toc-active');
    } else {
      if (meetUnread == false) {
        meetUnread = true;
        try{
          document.getElementById(elems[idx-1].id+"-nav").scrollIntoView({ block:"center", behavior: 'smooth' });
        } catch {

        }
        
      }
      navElem.classList.remove('toc-active');
    }
  })

}

var onNavClick = function () {
  
}


/*$().ready(function () {
  $(".collapse").each(function (idx) {
    $(this).collapse("show");
  });
  //spy();
  //$(window).bind('scroll', throttle(spy));
});*/

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