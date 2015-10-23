// Use jquery to make a request for json data.
// Controller should have an action that renders json
//Jquery get request (get to class button)
//everytime you visit the page you make a get request

  // /attendences/current_user.id .. something along those lines
  
  $.getJSON('/attendences/1').done(function(data){
      var pie = new d3pie("pieChart", data);
  });


    