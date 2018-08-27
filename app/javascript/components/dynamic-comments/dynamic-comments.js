// const commentForm = document.getElementById("comment-form");
// const commentBtn = document.getElementById("openCommentFormBtn");
// const submitCommentBtn = document.getElementById("comment-submit");

// if(commentBtn) {
  $('#openCommentFormBtn').click(function(e) {
    $('#comment-form').slideDown();
    $('#openCommentFormBtn').hide();
  })

$('#toggle-all-comments').click(function(e){
  $('#all-comments').slideDown();
  $('#toggle-all-comments').hide();
  $('#hide-all-comments').show();
});

$('#hide-all-comments').click(function(e) {
  $('#all-comments').slideUp();
  $('#hide-all-comments').hide();
  $('#toggle-all-comments').show();
});

