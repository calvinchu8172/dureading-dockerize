function myFunction() {
  var x = document.getElementById("myTopnav");
  if (x.className === "header-mobile") {
    x.className += " responsive";
  } else {
    x.className = "header-mobile";
  }
}