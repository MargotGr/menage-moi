import $ from 'jquery';

// Slot Machine
// $(document).ready(function() {
//   $(window).on('load', function() {
//     $(".loader").delay(1000).fadeOut(500);
//   });
// });

// Gestion de la partial loss
var lossBtn = document.querySelector(".loss-btn");
var lossDiv = document.querySelector(".hidden-loss-div");
var closeBtnLoss = document.querySelector("#loss i");

lossBtn.addEventListener("click", (event) => {
  lossDiv.classList.remove("hidden-loss-div");
});

if (closeBtnLoss !== null) {
  closeBtnLoss.addEventListener("click", (event) => {
    lossDiv.classList.add("hidden-loss-div");
  });
}

// Gestion de la partial gain
var gainDiv = document.querySelector(".gain-div");
var closeBtnGain = document.querySelector("#gain i");

if (closeBtnGain !== null) {
  closeBtnGain.addEventListener("click", (event) => {
    gainDiv.style.display = "none";
  });
}
