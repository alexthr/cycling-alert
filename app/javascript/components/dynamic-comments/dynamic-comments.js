// const commentForm = document.getElementById("comment-form");
// const commentBtn = document.getElementById("openCommentFormBtn");
// const submitCommentBtn = document.getElementById("comment-submit");


$('#comment-form-wrapper').on('click', '#openCommentFormBtn', function(e) {
  console.log("clicked add a comment");
  $('#comment-form').slideDown();
  $('#openCommentFormBtn').hide();
});

$('#toggle-all-comments').on('click',function(e){
  $('#all-comments').slideDown();
  $('#toggle-all-comments').hide();
  $('#hide-all-comments').show();
});

$('#hide-all-comments').on('click', function(e) {
  $('#all-comments').slideUp();
  $('#hide-all-comments').hide();
  $('#toggle-all-comments').show();
});
