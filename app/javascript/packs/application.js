import "bootstrap";

const lossBtn = document.querySelector(".loss_btn");
const lossDiv = document.querySelector(".loss_div");
lossBtn.addEventListener("click", (event) => {
  lossDiv.classList.add("show_loss");
});
