$("#pageLogo a").text("RIORIO");

$.getJSON("http://0.0.0.0:3000/friends.json", function(json){
  for (var i = 0; i < json.length; ++i) {
    console.log(json[i]);
  }
  console.log($("a.passiveName").attr("data-hovercard"));
});
