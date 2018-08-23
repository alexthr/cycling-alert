// const commentForm = document.getElementById("comment-form");
// const commentBtn = document.getElementById("openCommentFormBtn");
// const submitCommentBtn = document.getElementById("comment-submit");

// if(commentBtn) {
  $('#openCommentFormBtn').click(function(e) {
    $('#comment-form').slideDown();
    $('#openCommentFormBtn').hide();
  })



// const toggleAllComments = document.getElementById("toggle-all-comments");
// const allComments = document.getElementById("all-comments");
// const hideAllComments = document.getElementById("hide-all-comments");


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


