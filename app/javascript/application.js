// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails";
import "controllers";
import "popper";
import "bootstrap";

// test if javascript is working
// document.addEventListener("DOMContentLoaded", () => {
//   alert("JavaScript is working!");
// });

// this is to confirm the delete action
// document.addEventListener("turbo:click", (event) => {
//     const element = event.target;
//     const confirmText = element.getAttribute("data-turbo-confirm");

//     if (confirmText && !window.confirm(confirmText)) {
//       event.preventDefault();
//     }
//   });
