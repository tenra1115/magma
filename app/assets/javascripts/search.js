$(function() {
  $('#inc_search_user').on('keyup', function(e){
    // e.preventDefault();
    if (event.code == "Backspace" || event.code == "Space"){
      // キーコマンドによって検索結果が出てこないようにしている
      $(".user_list").empty();
      // ifで書いてある処理が実行されない場合はfalseで処理を中断している
      return false;
    }
    var bro = $('#inc_search_user').val();
    $.ajax({
      type: 'GET', // リクエストのタイプはGETです
      url: '/users', // ユーザー検索を行なっているところに飛ばす
      data: {man: bro}, // コントローラへフォームの値を送信.teamは事前に定義してある
      dataType: 'script' // データの型はscriptで指定
    })
  })
})