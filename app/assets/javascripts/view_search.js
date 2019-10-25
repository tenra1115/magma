$(function() {
  $('#inc_search_review').on('keyup', function(e){
    // e.preventDefault();
    if (event.code == "Backspace" || event.code == "Space"){
      // キーコマンドによって検索結果が出てこないようにしている
      // $("#user-search-result").empty();
      // ifで書いてある処理が実行されない場合はfalseで処理を中断している
      return false;
    }
    var title_view = $('#inc_search_review').val();
    $.ajax({
      type: 'GET', // リクエストのタイプはGETです
      url: '/reviews/dout', // ユーザー検索を行なっているところに飛ばす
      data: {view_title: title_view}, // コントローラへフォームの値を送信.teamは事前に定義してある
      dataType: 'script' // データの型はscriptで指定。htmlで使用するため
    })
  })
})