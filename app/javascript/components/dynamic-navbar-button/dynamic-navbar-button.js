const btnNavbar = document.getElementById("nav-toggle");
console.log(btnNavbar)
if(btnNavbar) {
  btnNavbar.addEventListener("click", (event) => {
    event.currentTarget.classList.toggle("active");
  });
}
