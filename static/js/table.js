$().ready(function(){
      var elems = $("table");
      elems.each(function(idx){
        $(this).addClass('table-striped');
        $(this).addClass('table');
        $(this).addClass('table-responsive');
        $(this).addClass('table-hover');
        });
});