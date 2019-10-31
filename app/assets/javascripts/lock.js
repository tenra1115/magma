$(document).on('turbolinks:load', function() {
  $('#article-tags').tagit({
    fieldName: 'review[tag_list]',
    singleField: true
  });
});

$(document).on('turbolinks:load', function() {
  $('#article-tags2').tagit({
    fieldName: 'review[tag_list]',
    singleField: true
  });
  if (gon.get_used_tags != null) {
    console.log(gon.get_used_tags)
    // gon.get_used_tagsはコントローラーで定義している。タグを全て取得している
      tags = gon.get_used_tags;
    // 集めたタグを入れる配列を用意。表示させるときに使う
      tags_results = [];
    // iは0を代入、_lenはタグの数
      for (i = 0, _len = tags.length; i < tags.length; i++) {
        tag = tags[i];
        // pushは配列が持つメソッド(配列の形のものを表示したいから)。appendはjQueryオブジェクト内が持つもの。
        tags_results.push($('#article-tags2').tagit( 'createTag',tag));
      }
      return tags_results;
    }
});