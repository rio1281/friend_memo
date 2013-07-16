//FacebookからfacebookIDを含む文字列を取得
var a = $("div#pagelet_timeline_main_column").attr("data-gt");

//Friendテーブルに保存されたfacebook_idが、上記で取得した文字列に含まれる場合、そのfacebook_idに対応するメモを表示
$.getJSON("http://0.0.0.0:3000/friends.json", function(json){
  for (var i = 0; i < json.length;) {
    if (a.indexOf(json[i].facebook_id) == 18) {
      $("a._8_2").append("<br>");
      $("a._8_2").append(json[i].memo);
      break;
    } else {
      i = i + 1;
    }
  }
});
