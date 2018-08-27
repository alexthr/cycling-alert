const btnNavbar = document.getElementById("nav-toggle");
if(btnNavbar) {
  btnNavbar.addEventListener("click", (event) => {
    event.currentTarget.classList.toggle("active");
  });
}
