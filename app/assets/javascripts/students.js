//navbar drop down
function navbar_dropdown(){
    var timer;
    var nav = document.getElementsByClassName('navbar-brand')[0];
    var list = document.getElementById('list');
    var ul = document.getElementById('list-ul');
    
    nav.addEventListener('mouseover', function(event){
        list.className = '';
        clearTimeout(timer);
    });    
    nav.addEventListener('mouseout', function(event){
        timer = setTimeout(hideMenu,600);
    });    
    ul.addEventListener('mouseover', function(event){
        list.className = '';
        clearTimeout(timer);
    });    
    ul.addEventListener('mouseout', function(event){
        timer = setTimeout(hideMenu,600);
    });


    function hideMenu() {
        list.className = 'hide';
    }

}

// this grabs the users geolocation on the loading of the page
// i hope
function getGeoLocation() {
  navigator.geolocation.getCurrentPosition(setGeoCookie);
}

function setGeoCookie(position) {
  var cookie_val = position.coords.latitude + "|" + position.coords.longitude;
  document.cookie = "lat_lng=" + escape(cookie_val);
}

document.onreadystatechange = function() {
    if (document.readyState == 'complete') {
        navbar_dropdown();
        form();
        getGeoLocation();
    }
};

