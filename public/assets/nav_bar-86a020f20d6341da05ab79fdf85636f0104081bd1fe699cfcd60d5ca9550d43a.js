function hasScrolled(){var l=$(this).scrollTop();Math.abs(lastScrollTop-l)<=delta||(l>lastScrollTop&&l>navbarHeight?$(".header").removeClass("nav-down").addClass("nav-up"):l+$(window).height()<$(document).height()&&$(".header").removeClass("nav-up").addClass("nav-down"),lastScrollTop=l)}var didScroll,lastScrollTop=600,delta=5,navbarHeight=$(".header").outerHeight();$(window).scroll(function(){didScroll=!0}),setInterval(function(){didScroll&&(hasScrolled(),didScroll=!1)},400);