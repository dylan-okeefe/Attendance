// this grabs the users geolocation on the loading of the page
// i hope
function setGeoCookie(position) {
    var cookie_val = position.coords.latitude + "|" + position.coords.longitude;
    document.cookie = "lat_lng=" + escape(cookie_val);
}

function getGeoLocation() {
  navigator.geolocation.getCurrentPosition(setGeoCookie);
}


document.onreadystatechange = function() {
    if (document.readyState == 'complete') {
        getGeoLocation();
    }
};

