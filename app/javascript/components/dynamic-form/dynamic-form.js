$("#upload-btn").click(function(e) {
  $("#next-form-btn").fadeIn();
});

$("#next-form-btn").click(function(e) {
  e.preventDefault();
  $('#new-issue-form-header').hide();
  $("#next-form-btn").fadeToggle();
  $("#photo-form").slideUp();
  $("#issue-form").slideDown();
  $("#submit-btn").fadeToggle();
});

$("#add-solution-btn").click(function(e) {
  e.preventDefault();
  $("#add-solution-btn").fadeToggle();
  $("#solution-form").slideDown();
});

const issueLat = document.getElementById("issue_latitude");
const issueLong = document.getElementById("issue_longitude")

if(issueLat && issueLong) {
  navigator.geolocation.getCurrentPosition(function(location) {
    issueLat.value = location.coords.latitude;
    issueLong.value = location.coords.longitude;
  })
}

const userLat = document.getElementById("query_latitude");
const userLong = document.getElementById("query_longitude");

if(userLat && userLong) {
  navigator.geolocation.getCurrentPosition(function(location) {
    userLat.value = location.coords.latitude;
    userLong.value = location.coords.longitude;
  })
}

const nextBtn = document.getElementById("next-form-btn");
if(nextBtn) {
  nextBtn.addEventListener("click", function() {
    if (document.getElementById("issue_longitude").value === "") {
      hidden_address.classList.remove("hidden");}
    })
}

// const issueForm = document.getElementById("issue-form");
// const photoForm = document.getElementById("photo-form");
// const solutionForm = document.getElementById("solution-form");
// const uploadBtn = document.getElementById("upload-btn");
// const nextBtn = document.getElementById("next-form-btn");
// const addSolutionBtn = document.getElementById("add-solution-btn");
// const submitBtn = document.getElementById("submit-btn");

// if(uploadBtn) {
//   uploadBtn.addEventListener("click", (e) => {
//     console.log("clicked photo upload button");
//     nextBtn.classList.remove("hidden");
//   });
// }

// if(nextBtn) {
//   nextBtn.addEventListener("click", (e) => {
//     e.preventDefault();
//     photoForm.classList.add("hidden");
//     issueForm.classList.remove("hidden");
//     nextBtn.classList.add("hidden");
//     submitBtn.classList.remove("hidden");
//   });
// }

// if(addSolutionBtn) {
//   addSolutionBtn.addEventListener("click", (e) => {
//     e.preventDefault();
//     addSolutionBtn.classList.add("hidden");
//     solutionForm.classList.remove("hidden");
//   });
// }
