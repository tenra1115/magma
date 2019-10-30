$(document).on('turbolinks:load', function() {
  $('#article-tags').tagit({
    fieldName: 'review[tag_list]',
    singleField: true
  });
});

// $(document).on('turbolinks:load', function() {
//   $('#article-tags2').tagit({
//     fieldName: 'review[tag_list]',
//     singleField: true
//   });
// });