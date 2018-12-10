import "bootstrap";
import "src/index";

const lossBtn = document.querySelector(".loss-btn");
const lossDiv = document.querySelector(".hide-loss-div");
const gainDiv = document.querySelector(".gain-div");
const closeBtn = document.querySelector(".result-card i");

lossBtn.addEventListener("click", (event) => {
  lossDiv.classList.toggle("show-loss-div");
});

closeBtn.addEventListener("click", (event) => {
  lossDiv.classList.remove("show-loss-div");
});

closeBtn.addEventListener("click", (event) => {
  gainDiv.style.display = "none";
});
