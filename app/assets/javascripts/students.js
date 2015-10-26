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


//at this point this form is being shown after button is being clicked
//i actually want the form to not show, however still be generated in the backend, autofilled
//the 'student' should not see the form, they should just submit their attendance and be directed
//to their page. OR once the button is clicked it updates the pie chart and that view is rendered.
// function form(){
//     var button = document.getElementsByClassName('btn')[0];
//         form = document.getElementById('form');
//         submit = document.getElementById('submit');

//     button.addEventListener('click', function(){
//         form.className = '';
//         button.className = 'hide';
//     });

//     submit.addEventListener('click', function(){
//         //route to a diff page when submit button is clicked.
//     });
// }

document.onreadystatechange = function() {
    if (document.readyState == 'complete') {
        navbar_dropdown();

    }
};