var spy = function() {
  var elems = $(":header");
  if (elems.length == 0) {
    return;
  }
  var currentTop = $(window).scrollTop();
  var currentBottom = $(window).scrollTop() + $(window).height();
  var pageBottom = $('#EOF').offset().top;
  
  var meetUnread = false
  var currentIndex = -1
  elems.each(function(idx){
    var elemTop = $(this).offset().top;
    var id = $(this).attr('id');
    var navElem = $('#' + id+ '-nav');
    if(currentTop + $(this).height() >= elemTop || currentBottom >= pageBottom){
      navElem.addClass('toc-active');
    } else {
      if (meetUnread == false) {
        meetUnread = true
        currentIndex = idx - 1
      }
      navElem.removeClass('toc-active');
    }
  })
  if (currentIndex==-1) {
    currentIndex = elems.length - 1;
  }
  //console.log(elems[currentIndex].id);
  //Collapse them
  collapseOthers("#"+elems[currentIndex].id+"-nav");
}
var collapseOthers = function (currentId) {
  //console.log(currentId);
  $(currentId).parents(".collapse").each(function(idx){
    $(this).collapse("show");
  });
  $(currentId).parent().next().filter(".collapse").collapse("show");
  $(".collapse").not($(currentId).parents()).not($(currentId).parent().next()).each(function(idx){
    $(this).collapse("hide");
  });

}
$().ready(function(){
  spy();
  $(window).bind('scroll', spy);
});