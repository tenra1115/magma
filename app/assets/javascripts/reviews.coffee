$(document).on 'ready page:load', ->
  $('.admin-articles #article-tags').tagit
    fieldName:   'article[tag_list]'
    singleField: true
