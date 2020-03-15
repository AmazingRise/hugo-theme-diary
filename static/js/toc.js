$().ready(function(){
  var elems = $(":header");
  if (elems.length == 0) {
    return;
  }
  $(window).bind('scroll', function() {
      var currentTop = $(window).scrollTop();
      var currentBottom = $(window).scrollTop() + $(window).height();
      var pageBottom = $('#EOF').offset().top;
      
      elems.each(function(idx){
        var elemTop = $(this).offset().top;
        var id = $(this).attr('id');
        var navElem = $('#' + id+ '-nav');
        if(currentTop >= elemTop || currentBottom >= pageBottom){
      	  navElem.addClass('toc-active');
        } else {
          navElem.removeClass('toc-active');
        }
      })
  });
});