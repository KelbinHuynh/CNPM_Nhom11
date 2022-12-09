//Active li purchase
var listLinkPurchase = location.href;
var listItemPurchase = $$(".user_sidebar ul li a");
var listLengthPurchase = listItemPurchase.length;

var i = 0;
for (i; i < listLengthPurchase; i++) {
    if (listItemPurchase[i].href === listLinkPurchase) {
        listItemPurchase[i].className = "active ";
    }
}
