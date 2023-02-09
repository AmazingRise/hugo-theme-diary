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
  elems.forEach(function (elem, idx) {
    var elemTop = elem.offsetTop;
    var id = elem.getAttribute('id');
    //console.log(id,elem.offsetTop)
    var navElems = document.getElementsByClassName(id + '-nav');
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
        try{
          document.getElementById(elems[idx-1].id+"-nav").scrollIntoView({ block:"center", behavior: 'smooth' });
        } catch {

        }
        
      }
      Array.from(navElems).forEach((e) => {
        e.classList.remove('toc-active');
      });
      
    }
  })

}
