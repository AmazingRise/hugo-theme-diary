new SmoothScroll('a#globalBackToTop');

Vue.component('parent',{
    props:['name','type'],
    data: function () {
        return {
            isHidden: true
        }
    },
    template: `
    <div class="a-block" :class="type" v-on:click="isHidden = !isHidden">
        {{ name }}
        <div class="nav-link-subitem" v-if="!isHidden">
            <slot></slot>
        </div>
    </div>
    `
});

$().ready(function(){
    var elems = $("table");
    elems.each(function(idx){
      $(this).addClass('table-striped');
      $(this).addClass('table');
      $(this).addClass('table-responsive');
      $(this).addClass('table-hover');
      });
});