document.addEventListener("DOMContentLoaded", function(event) {
  var playTimer;
  var imageUrls = [];

  function getRandomImageUrls(){
    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
      if (this.readyState == 4 && this.status == 200) {
        imageUrls = JSON.parse(this.responseText);
        if(imageUrls.length > 0){
          start();
        }
      }
    };
    xhttp.open("GET", "/image_uploads/random_image_urls", true);
    xhttp.send();
  }

  function start() {
    var count = 10;
    playTimer = setInterval(playClock, 1000);

    function playClock() {
      // Show 10 instead of 0 and repeat
      if (count == 0) {
        count = 10;
      }
      document.getElementById("timer_val").innerHTML = count;
      document.getElementById("image_url").src = imageUrls[10 - count];

      count -= 1;
    }
  }

  if(document.getElementById("create-play") != null){
    document.getElementById("create-play").onclick = function(){
      var xhttp = new XMLHttpRequest();

      timerVal = document.getElementById("timer_val").innerText
      imageURL = document.getElementById("image_url").src

      data = "image_url=" + imageURL + "&timer_val=" + timerVal
      
      xhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
          document.getElementById("play-records").innerHTML = "";
          document.getElementById("play-records").innerHTML = this.responseText;

          start();
        }
      };

      xhttp.open("POST", "/plays?" + data, true, 'html');
      xhttp.setRequestHeader('X-CSRF-Token', document.querySelector('meta[name="csrf-token"]').content);

      xhttp.send();
      return false;
    };
    getRandomImageUrls();  
  }
    
});