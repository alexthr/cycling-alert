  const issueForm = document.getElementById("issue-form");
  const photoForm = document.getElementById("photo-form");
  const solutionForm = document.getElementById("solution-form");
  const uploadBtn = document.getElementById("upload-btn");
  const nextBtn = document.getElementById("next-form-btn");
  const addSolutionBtn = document.getElementById("add-solution-btn");
  const submitBtn = document.getElementById("submit-btn");

  uploadBtn.addEventListener("click", (e) => {
    nextBtn.classList.remove("hidden");
  });

  nextBtn.addEventListener("click", (e) => {
    e.preventDefault();
    photoForm.classList.add("hidden");
    issueForm.classList.remove("hidden");
    nextBtn.classList.add("hidden");
    submitBtn.classList.remove("hidden");
  });

  addSolutionBtn.addEventListener("click", (e) => {
    e.preventDefault();
    addSolutionBtn.classList.add("hidden");
    solutionForm.classList.remove("hidden");
  });
