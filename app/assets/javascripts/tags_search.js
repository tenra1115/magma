$(function() {
  $('#inc_search_tag').on('keyup', function() {
    var tag = $('#inc_search_tag').val();
    console.log(tag)
    $.ajax({
      type: 'GET', // リクエストのタイプはGETです
      url: '/reviews', // ユーザー検索を行なっているところに飛ばす
      data: {tag: tag}, // コントローラへフォームの値を送信.teamは事前に定義してある
      dataType: 'script'
    })
  })
})