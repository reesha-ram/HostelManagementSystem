
<%@ page contentType="text/html" language="java"
import="java.sql.*" errorPage="" %>
<!DOCTYPE html>
<html>
<head>
    <title>CEG HOSTELS</title>
</head>


<body>
<%@ include file="banner.jsp" %>

  <div class="w3-bar w3-white w3-wide w3-padding w3-card">
    <a href="#home" class="w3-bar-item w3-button"><b>CEG HOSTELS</b></a>
    <!-- Float links to the right. Hide them on small screens -->
    <div class="w3-right w3-hide-small">
      <a href="#categories" class="w3-bar-item w3-button">Dashboard</a>
      <a href="#about" class="w3-bar-item w3-button">About</a>
      <a href="sindex.jsp" class="w3-bar-item w3-button">USER Login</a>
        <a href="index.jsp" class="w3-bar-item w3-button">ADMIN Login</a>
    </div>
  </div>

<!-- Header -->
<header class="w3-display-container w3-content w3-wide" style="max-width:500px;" id="home">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta content="text/html; charset=iso-8859-2" http-equiv="Content-Type">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<style>
.mySlides {display:none;}



body {
	  background-color: lightgreen;

    
  height: 100%; 
  background-position: center;
  background-repeat: no-repeat;
  background-size: cover;

}







</style>
</head>

<body>
    

<marquee>
<div class="w3-content w3-section" style="max-width:1000px">
    <center>
  <img class="mySlides" src="h9.jpg" >
  <img class="mySlides" src="h8.jpg"   >
  <img class="mySlides" src="h9.jpg"  >
<img class="mySlides" src="h4.jpg"  >
<img class="mySlides" src="h8.jpg"  >
<img class="mySlides" src="h4.jpg"  >
    </center>
</div>
</marquee>

<script>
var myIndex = 0;
carousel();

function carousel() {
  var i;
  var x = document.getElementsByClassName("mySlides");
  for (i = 0; i < x.length; i++) {
    x[i].style.display = "none";  
  }
  myIndex++;
  if (myIndex > x.length) {myIndex = 1}    
  x[myIndex-1].style.display = "block";  
  setTimeout(carousel, 2000); // Change image every 2 seconds
}
</script>
  <div class="w3-display-middle w3-margin-top w3-center">
  </div>
</header>
<marquee>
<!-- Page content -->
<div class="w3-content w3-padding" style="max-width:1564px">

  <!-- Project Section -->
  <div class="w3-container w3-padding-32" id="categories">
    <h3 class="w3-border-bottom w3-border-light-green w3-padding-16">Categories</h3>
  </div>

  <div class="w3-row-padding">
    <div class="w3-col l3 m6 w3-margin-bottom">
      <div class="w3-display-container">
        <div class="w3-display-topleft w3-black w3-padding"><a href="index.jsp" class="w3-bar-item w3-button">ADMIN LOGIN</a></div>
        <img src="a.jpg" alt="House" style="width:100%;height:50%">
      </div>
    </div>
    <div class="w3-col l3 m6 w3-margin-bottom">
      <div class="w3-display-container">
        <div class="w3-display-topleft w3-black w3-padding"><a href="sindex.jsp" class="w3-bar-item w3-button">USER LOGIN</a></div>
        <img src="userlogin.png" alt="House" style="width:100%">
      </div>
    </div>
  </div>
</marquee>

  <!-- About Section -->
  <div class="w3-container w3-padding-32" id="about">
    <h3 class="w3-border-bottom w3-border-light-green w3-padding-16">About</h3>
   <h2>We are honoured</h2>
						<p>
Our CEG Hostels are the pioneer in providing accommodation for students of CEG in our College campus for the past 10 years.
</p>
	
<h2>Facilities</h2>
                                                <ul>
                                                    <li>Food</li>
                                                    <li>Wifi</li>
                                                    <li>Laundry</li>
                                                    <li>Safety & Security</li>
                                                    <li>Mediclaim</li>
                                                    <li>Logistics</li>
                                                    
                                                </ul>
  

<!-- End page content -->
</div>


<!-- Footer -->
<footer class="w3-center w3-black w3-padding-16">
  <p>CEG HOSTELS</p>
</footer>

</body>
</html>


    	
    	
            