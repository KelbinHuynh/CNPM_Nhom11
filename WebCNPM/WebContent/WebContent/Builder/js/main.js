
const $$$ = document.querySelector.bind(document);
const $$ = document.querySelectorAll.bind(document);
// Scroll Top
var scrollTop = () => {
    var header = $$$(".header");
    header.scrollIntoView({ behavior: "smooth", block: "start" });
};

var scrollBtn = $$$(".scroll-top");
scrollBtn.addEventListener("click", scrollTop);
window.addEventListener("scroll", scrollBtnDisplay);

function scrollBtnDisplay() {
    if (
        document.body.scrollTop > 200 ||
        document.documentElement.scrollTop > 200
    ) {
        scrollBtn.style.display = "block";
    } else {
        scrollBtn.style.display = "none";
    }
}

// Active link header
var listLink = location.href;
var listItem = $$(".header .header_nav .header_nav_container--list a");
var listLength = listItem.length;

var i = 0;
for (i; i < listLength; i++) {
    if (listItem[i].href === listLink) {
        listItem[i].className = "active";
    }
}

var links = location.href;
var items = $$(".header .header_menu .header_menu_body--content a");
var listslength = items.length;

var j = 0;
for (j; j < listLength; j++) {
    if (items[j].href === links) {
        items[j].className = "active";
    }
}

// Header sticky
var headerSticky = $$$(".header .header_nav");
var topBar = $$$(".header .header_topbar");
window.addEventListener("scroll", scrollFunction);

function scrollFunction() {
    if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
        headerSticky.classList.add("scroll");
        topBar.classList.add("hide");
    } else {
        headerSticky.classList.remove("scroll");
        topBar.classList.remove("hide");

    }
}

// Active link
var links = $$(".header .header_nav .header_nav_container--list li");
var add = function () {
    $$$(".header .header_nav .header_nav_container--list li.active").classList.remove("active");
    this.classList.add("active");
};
links.forEach((link) => {
    link.addEventListener("click", add);
});
// Active Search
var tabs = $$(".search_container_tab");

tabs.forEach((tab) => {
    tab.onclick = function () {
        $$$(".header .search_container_tab.active").classList.remove("active");
        this.classList.add("active");
    };
});

// Header menu modal

var box = $$$(".header .header_menu .header_menu_overlay");
var boxBody = $$$(".header .header_menu .header_menu_body--content");
var open = $$$("#menu_open");
var close = $$$("#menu_close");

open.onclick = function () {
    box.style.display = "block";
    boxBody.classList.add("open");
};

close.onclick = function () {
    box.style.display = "none";
    boxBody.classList.remove("open");
};


// Carousel run

let slideIndex = 0;
showSlides()

function plusSlides(n) {
    slideIndex += n - 1;
    clearTimeout(myvar);
    showSlides();
}

function currentSlide(n) {

    slideIndex = n - 1;
    clearTimeout(myvar)
    showSlides();
}

function showSlides() {
    let i;
    let items = document.getElementsByClassName("item");
    let dots = document.getElementsByClassName("dot");
    if (slideIndex < 0) { slideIndex = items.length - 1 }
    for (i = 0; i < items.length; i++) {
        items[i].style.display = "none";
    }

    slideIndex++;
    if (slideIndex > items.length) { slideIndex = 1 }
    for (i = 0; i < dots.length; i++) {
        dots[i].className = dots[i].className.replace(" active_carousel", "");
    }
    items[slideIndex - 1].style.display = " block";
    dots[slideIndex - 1].className += " active_carousel";
    myvar = setTimeout(showSlides, 4000)
}



let productIndex = [1,1,1,1,1,1,1];
let productId = ["product0", "product1", "product2", "product3", "product4", "product5", "product6"];
let dotId = ["slick-dot-0", "slick-dot-1", "slick-dot-2", "slick-dot-3", "slick-dot-4", "slick-dot-5", "slick-dot-6"];
let k;
for(k = 0; k < 8; k++)
{
   showDots(k);
    showProducts(1,k);
}

function showDots(no) {
    let i;
    let products = document.getElementsByClassName(productId[no]);
    let slick_dots = document.getElementsByClassName(dotId[no]);
    let j = Math.floor(products.length / 4);
    let m = products.length % 4;

    for (i = 0; i < slick_dots.length; i++) {
        slick_dots[i].style.display = "none";
    }

    if (m == 0) {
        for (i = 0; i < j; i++) {
            slick_dots[i].style.display = "inline-block";
        }
    }
    else {
        for (i = 0; i < j + 1; i++) {
            slick_dots[i].style.display = "inline-block";
        }
    }
}

function plusPages(n, no) {
    showProducts(productIndex[no] += n, no);
}

function currentPages(n, no) {
    showProducts(productIndex[no] = n, no);
}

function showProducts(n, no) {
    let i;
    let products = document.getElementsByClassName(productId[no]);
    let slick_dots = document.getElementsByClassName(dotId[no]);
    let j = Math.floor(products.length / 4);
    let m = products.length % 4;
    if (m == 0) {
        if (n < 1) { productIndex[no] = j };
        if (n > j) { productIndex[no] = 1 };
    }
    else {
        if (n < 1) { productIndex[no] = j + 1 };
        if (n > j + 1) { productIndex[no] = 1 };
    }

    for (i = 0; i < products.length; i++) {
        products[i].style.display = "none";
    }

    for (i = 0; i < slick_dots.length; i++) {
        slick_dots[i].className = slick_dots[i].className.replace(" active_product", "");
    }

    if (productIndex[no] == j + 1) {
        for (i = 0; i < m; i++) {
            products[(productIndex[no] - 1) * 4 + i].style.display = "block";
        }

    }
    else {
        for (i = 0; i < 4; i++) {
            products[(productIndex[no] - 1) * 4 + i].style.display = "block";
        }
    }
    slick_dots[productIndex[no] - 1].className += " active_product";
} 
