$(function() {

  var yy = `<div class="sell" value="1">
              <%= link_to '非公開', nonrelease_review_path(@review.id), method: :patch, class: "jiji" %>
              <label class="btn btn-default">
                <input autocomplete="off" class="input" type="checkbox">/</input>
              </label>
            </div>`

  var hh = `<div class="buy" value="2">
              <%= link_to '公開', release_review_path(@review.id), method: :patch %>
              <label class="btn btn-default">
                <input autocomplete="off" class="input" type="checkbox">/</input>
              </label>
            </div>`
  
  $(".input").on('click', function() {
    console.log(this)
    $(".buy").remove();
    $(".l").append(yy);
  });

  $(".btn-default").on('click', function() {
    $(".sell").remove();
    $(".l").append(hh);
  });
})