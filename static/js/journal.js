let app;

app = new Vue({
    el: '#app',
    data: {
        scrollY: 0,
        navOpacity: 0,
        isDrawerOpen: false,
        mounted: false,
        isDarkMode: false
    },
    methods: {
            sgn(t, x) {
                let k = 1. / (1. - 2 * t);
                if (x <= t) return 0;
                else if (x >= 1 - t) return 1;
                else {
                    return k * (x - t);
                }
            },
            handleScroll() {
                this.scrollY = window.scrollY;
                this.navOpacity = this.sgn(.0, Math.min(1, Math.max(0, window.scrollY / (this.pageHeadHeight() - this.navBarHeight() * 0.8))));
                const {navBar, navBackground, navTitle, extraContainer, streamContainer} = this.$refs;

                if (this.navOpacity >= 1) {
                    navBackground.style.opacity = 1;
                    navTitle.style.opacity = 1;
                } else {
                    navBackground.style.opacity = 0;
                    navTitle.style.opacity = 0;
                }
            },
            handleResize() {
                const {navBar, navBackground, navTitle, extraContainer, streamContainer} = this.$refs;
                extraContainer.style.left = (streamContainer.offsetWidth - extraContainer.offsetWidth) + 'px';
            },
            navBarHeight() {
                return this.$refs.navBar.offsetHeight;
            },
            pageHeadHeight() {
                return this.$refs.pageHead.offsetHeight;
            },
            toggleDrawer() {
                this.isDrawerOpen = !this.isDrawerOpen;
                document.getElementsByTagName('html')[0].style.overflow = this.isDrawerOpen ? 'hidden' : 'unset';
            },
            closeDrawer() {
                this.isDrawerOpen = false;
                document.getElementsByTagName('html')[0].style.overflow = this.isDrawerOpen ? 'hidden' : 'unset';
            },
            toggleDarkMode() {
                this.isDarkMode = !this.isDarkMode;
                if (this.isDarkMode==true){
                    document.cookie = "night=1;path=/";
                    document.body.classList.add("night");
                } else {
                    document.cookie = "night=0;path=/";
                    document.body.classList.remove("night");
                }
            }
    },
    created() {
        window.addEventListener('scroll', this.handleScroll);
        window.addEventListener('resize', this.handleResize);
        window._nonDesktop = function () {
            let check = false;
            (function (a) {
                if (/(android|bb\d+|meego).+mobile|avantgo|bada\/|blackberry|blazer|compal|elaine|fennec|hiptop|iemobile|ip(hone|od)|iris|kindle|lge |maemo|midp|mmp|mobile.+firefox|netfront|opera m(ob|in)i|palm( os)?|phone|p(ixi|re)\/|plucker|pocket|psp|series(4|6)0|symbian|treo|up\.(browser|link)|vodafone|wap|windows ce|xda|xiino|android|ipad|playbook|silk/i.test(a) || /1207|6310|6590|3gso|4thp|50[1-6]i|770s|802s|a wa|abac|ac(er|oo|s\-)|ai(ko|rn)|al(av|ca|co)|amoi|an(ex|ny|yw)|aptu|ar(ch|go)|as(te|us)|attw|au(di|\-m|r |s )|avan|be(ck|ll|nq)|bi(lb|rd)|bl(ac|az)|br(e|v)w|bumb|bw\-(n|u)|c55\/|capi|ccwa|cdm\-|cell|chtm|cldc|cmd\-|co(mp|nd)|craw|da(it|ll|ng)|dbte|dc\-s|devi|dica|dmob|do(c|p)o|ds(12|\-d)|el(49|ai)|em(l2|ul)|er(ic|k0)|esl8|ez([4-7]0|os|wa|ze)|fetc|fly(\-|_)|g1 u|g560|gene|gf\-5|g\-mo|go(\.w|od)|gr(ad|un)|haie|hcit|hd\-(m|p|t)|hei\-|hi(pt|ta)|hp( i|ip)|hs\-c|ht(c(\-| |_|a|g|p|s|t)|tp)|hu(aw|tc)|i\-(20|go|ma)|i230|iac( |\-|\/)|ibro|idea|ig01|ikom|im1k|inno|ipaq|iris|ja(t|v)a|jbro|jemu|jigs|kddi|keji|kgt( |\/)|klon|kpt |kwc\-|kyo(c|k)|le(no|xi)|lg( g|\/(k|l|u)|50|54|\-[a-w])|libw|lynx|m1\-w|m3ga|m50\/|ma(te|ui|xo)|mc(01|21|ca)|m\-cr|me(rc|ri)|mi(o8|oa|ts)|mmef|mo(01|02|bi|de|do|t(\-| |o|v)|zz)|mt(50|p1|v )|mwbp|mywa|n10[0-2]|n20[2-3]|n30(0|2)|n50(0|2|5)|n7(0(0|1)|10)|ne((c|m)\-|on|tf|wf|wg|wt)|nok(6|i)|nzph|o2im|op(ti|wv)|oran|owg1|p800|pan(a|d|t)|pdxg|pg(13|\-([1-8]|c))|phil|pire|pl(ay|uc)|pn\-2|po(ck|rt|se)|prox|psio|pt\-g|qa\-a|qc(07|12|21|32|60|\-[2-7]|i\-)|qtek|r380|r600|raks|rim9|ro(ve|zo)|s55\/|sa(ge|ma|mm|ms|ny|va)|sc(01|h\-|oo|p\-)|sdk\/|se(c(\-|0|1)|47|mc|nd|ri)|sgh\-|shar|sie(\-|m)|sk\-0|sl(45|id)|sm(al|ar|b3|it|t5)|so(ft|ny)|sp(01|h\-|v\-|v )|sy(01|mb)|t2(18|50)|t6(00|10|18)|ta(gt|lk)|tcl\-|tdg\-|tel(i|m)|tim\-|t\-mo|to(pl|sh)|ts(70|m\-|m3|m5)|tx\-9|up(\.b|g1|si)|utst|v400|v750|veri|vi(rg|te)|vk(40|5[0-3]|\-v)|vm40|voda|vulc|vx(52|53|60|61|70|80|81|83|85|98)|w3c(\-| )|webc|whit|wi(g |nc|nw)|wmlb|wonu|x700|yas\-|your|zeto|zte\-/i.test(a.substr(0, 4))) check = true;
            })(navigator.userAgent || navigator.vendor || window.opera);
            return check;
        };
        
        // From https://www.jdeal.cn/archives/Dark.html
        var night = document.cookie.replace(/(?:(?:^|.*;\s*)night\s*\=\s*([^;]*).*$)|^.*$/, "$1");
        if (night==""){
            if (window.matchMedia && window.matchMedia('(prefers-color-scheme: dark)').matches) {
                //this.toggleDarkMode();
            }
        }else{
            // If night is not empty
            if (night=="1") {
                this.toggleDarkMode();
            }
        }
        
    },
    mounted() {
        this.handleScroll();
        this.handleResize();
        this.mounted = true;
    },
    destroyed() {
        window.removeEventListener('scroll', this.handleScroll);
        window.removeEventListener('resize', this.handleResize);
    }
});

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
