// Use jquery to make a request for json data.
// Controller should have an action that renders json
//Jquery get request (get to class button)
//everytime you visit the page you make a get request

  // /attendances/current_user.id .. something along those lines
  //when i click a button i want the student to be present or late for that day. and
  //it updates the graph.

$.getJSON('/attendances/1').success(function(data){
    var pie = new d3pie("pieChart", data);
});
