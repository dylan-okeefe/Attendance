// Use jquery to make a request for json data.
// Controller should have an action that renders json
//Jquery get request

  // /attendances/current_user.id .. something along those lines
  //when i click a button i want the student to be present or late for that day. and
  //it updates the graph.

$.getJSON('/attendances/current_user').success(function(data){
    var pie = new d3pie("pieChart", data);
}); //the path it grabs the json data from needs to be updated.
//getting back to it. Working on d3
