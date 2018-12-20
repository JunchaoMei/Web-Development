function addToCart(prodID, sPrice) {
    if (prodID.length == 0) {
        document.getElementById("itemAdded").innerHTML = "";
        return;
    } else {
        var xmlhttp = new XMLHttpRequest();
        xmlhttp.onreadystatechange = function () {
            if (this.readyState == 4 && this.status == 200) {
                strReturnValues = this.responseText.split(",");
                //document.write("<p>strReturnValues</p>");
                document.getElementById("itemAdded").innerHTML = strReturnValues[1];
                document.getElementById("cartListing").innerHTML = "Cart (" + strReturnValues[0] + ")";
            }
        };
        xmlhttp.open("GET", "includes/dynamicCart.asp?prodID=" + prodID + "&sPrice=" + sPrice, true);
        xmlhttp.send();
    }
    //window.location.reload();
}