const popup = document.getElementById("pop_up");
const btns = document.querySelectorAll("#open_pop_up");
const back = document.getElementById("back")
Array.from(btns).forEach(function (btn) {
  btn.addEventListener("click", function (e) {
    e.preventDefault();
    popup.classList.add("active");
  });
});
const closepopup = document.getElementById("back");
closepopup.addEventListener("click", function (e) {
  e.preventDefault();
  popup.classList.remove("active");
});


