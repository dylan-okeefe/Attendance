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

function form(){
    var button = document.getElementsByClassName('btn')[0];
        form = document.getElementById('form');
        submit = document.getElementById('submit');

    button.addEventListener('click', function(){
        form.className = '';
        button.className = 'hide';
    });

    submit.addEventListener('click', function(){
        //route to a diff page when submit button is clicked.
    });
}

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
        navbar_dropdown();
        form();
        
    }
};

