<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


   <style type="text/css">
   body {
    background: #eee
}

#regForm {
    background-color: #ffffff;
    margin: 0px auto;
    font-family: Raleway;
    padding: 40px;
    border-radius: 10px
}

#register {
    color: #6A1B9A
}

h1 {
    text-align: center
}

input {
    padding: 10px;
    width: 100%;
    font-size: 17px;
    font-family: Raleway;
    border: 1px solid #aaaaaa;
    border-radius: 10px;
    -webkit-appearance: none
}

.tab input:focus {
    border: 1px solid #6a1b9a !important;
    outline: none
}

input.invalid {
    border: 1px solid #e03a0666
}

.tab {
    display: none
}

button {
    background-color: #6A1B9A;
    color: #ffffff;
    border: none;
    border-radius: 50%;
    padding: 10px 20px;
    font-size: 17px;
    font-family: Raleway;
    cursor: pointer
}

button:hover {
    opacity: 0.8
}

button:focus {
    outline: none !important
}

#prevBtn {
    background-color: #bbbbbb
}

.all-steps {
    text-align: center;
    margin-top: 30px;
    margin-bottom: 30px;
    width: 100%;
    display: inline-flex;
    justify-content: center
}

.step {
    height: 40px;
    width: 40px;
    margin: 0 2px;
    background-color: #bbbbbb;
    border: none;
    border-radius: 50%;
    display: flex;
    justify-content: center;
    align-items: center;
    font-size: 15px;
    color: #6a1b9a;
    opacity: 0.5
}

.step.active {
    opacity: 1
}

.step.finish {
    color: #fff;
    background: #6a1b9a;
    opacity: 1
}

.all-steps {
    text-align: center;
    margin-top: 30px;
    margin-bottom: 30px
}

.thanks-message {
    display: none
}
   </style>
</head>

<body>
    <div class="container mt-5">
    <div class="row d-flex justify-content-center align-items-center">
        <div class="col-md-8">
            <form action="/HealthProject/forgetPassword.controller" id="regForm">
                <h1 id="register">忘記密碼</h1>
                <div class="all-steps" id="all-steps"> <span class="step"><i class="fa fa-user"></i></span> <span class="step"><i class="fa fa-user-circle"></i></span> <span class="step"><i class="fa fa-envelope"></i></span> </div>
                <div class="tab">
                    <h6>請告訴我們姓名?</h6>
                    <p> <input id="membername" placeholder="姓名是..." oninput="this.className = ''" name="membername"></p>
                </div>
                <div class="tab">
                    <h6>請告訴我們帳號?</h6>
                    <p><input id="memberaccount" placeholder="帳號是..." oninput="this.className = ''" name="memberaccount"></p>
                </div>
                <div class="tab">
                    <h6>請告訴我們信箱?</h6>
                    <p><input id="memberemail" placeholder="信箱是..." oninput="this.className = ''" name="memberemail"></p>
                </div>
                <div class="thanks-message text-center" id="text-message"> <img src="https://i.imgur.com/O18mJ1K.png" width="100" class="mb-4">
                    <h3>感謝您耐心的回答!</h3> <span>請前往您的信箱，並取得最新的密碼!</span><br><br>
                	<button ><i class="fa fa-angle-double-right"></i></button>
                </div>
                <div style="overflow:auto;" id="nextprevious">
                	<div style="display: inline-block;">
                	<button type="button" id="returnLogin"><i class="fa fa-home"></i></button>
                		<button type="button" id="onekey">一鍵輸入</button>
                	</div>
                    <div style="float:right; display: inline-block">
                    	<button type="button" id="prevBtn" onclick="nextPrev(-1)"><i class="fa fa-angle-double-left"></i></button> 
                    	<button type="button" id="nextBtn" onclick="nextPrev(1)"><i class="fa fa-angle-double-right"></i></button> 
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>



<script type="text/javascript">



//一鍵輸入
$('#onekey').on('click', function (){
	$('#membername').val('張美麗');
	$('#memberaccount').val('qwer1234');
	$('#memberemail').val('iiieeit12907@gmail.com');
})


//返回首頁
$("#returnLogin").click(function(){
　　  $.ajax({ 
　　　　  type : "get", 
　　  　　url : "", 
　　　  　data : "", 
　  　　　async : false,   //注意：此處是同步，不是非同步
　　  　　success : function(data){ 
　　　　　　　　window.location.href="/Member/login";//需要跳轉的地址
　　   　　} 
　　   }); 
})




var currentTab = 0;
document.addEventListener("DOMContentLoaded", function(event) {


showTab(currentTab);

});

function showTab(n) {
var x = document.getElementsByClassName("tab");
x[n].style.display = "block";
if (n == 0) {
document.getElementById("prevBtn").style.display = "none";
} else {
document.getElementById("prevBtn").style.display = "inline";
}
if (n == (x.length - 1)) {
document.getElementById("nextBtn").innerHTML = '<i class="fa fa-angle-double-right"></i>';
} else {
document.getElementById("nextBtn").innerHTML = '<i class="fa fa-angle-double-right"></i>';
}
fixStepIndicator(n)
}

function nextPrev(n) {
var x = document.getElementsByClassName("tab");
if (n == 1 && !validateForm()) return false;
x[currentTab].style.display = "none";
currentTab = currentTab + n;
if (currentTab >= x.length) {

document.getElementById("nextprevious").style.display = "none";
document.getElementById("all-steps").style.display = "none";
document.getElementById("register").style.display = "none";
document.getElementById("text-message").style.display = "block";




}
showTab(currentTab);
}

function validateForm() {
var x, y, i, valid = true;
x = document.getElementsByClassName("tab");
y = x[currentTab].getElementsByTagName("input");
for (i = 0; i < y.length; i++) { if (y[i].value=="" ) { y[i].className +=" invalid" ; valid=false; } } if (valid) { document.getElementsByClassName("step")[currentTab].className +=" finish" ; } return valid; } function fixStepIndicator(n) { var i, x=document.getElementsByClassName("step"); for (i=0; i < x.length; i++) { x[i].className=x[i].className.replace(" active", "" ); } x[n].className +=" active" ; }

</script>


</body>

</html>
