<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>

<html>
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>健康悠生網</title>

<script src="../js/jquery-3.6.0.js"></script>


<!-- js for modal -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.0.1/js/bootstrap.bundle.min.js"></script> 



<!-- css for modal -->			
		<link rel="stylesheet"
			href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.0.1/css/bootstrap.min.css">


<!-- css for sweet alert2  -->
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>


<%@ include file="/WEB-INF/pages/user-css-js.jsp"%>
</head>

<body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">

<%@ include file="/WEB-INF/pages/user-header.jsp"%>



  <!-- 老人圖 -->

    <div class="slide-item overlay" style="background-image: url('${pageContext.request.contextPath}/images/meme_old_man5.jpg')">
      <div class="container">
        <div class="row">
          <div class="col-lg-6 align-self-center">
            <h1 class="heading mb-3">健康悠生伴你一生</h1>
            <p class="lead text-white mb-5">健康一生 悠活一生</p>
            <p><a href="about.html" class="btn btn-primary">關於我們</a></p>
          </div>
        </div>
      </div>  
    </div>



	<!-- 表單 -->
	   <div id="layoutSidenav_content">
		<main>
			<div class="card-header" style="margin-bottom: 60px;">
				<i class="fas fa-table me-1"></i> 會員系統
			</div>


			<!-- 第一列 -->
			<div class=row style="margin-bottom: 18px">
				<div class="col-md-2"></div>
				<div class="col-md-9" style="margin: 0 auto;">
				</div>
				<div class="col-md-1"></div>

			</div>


			<!-- 第二列 -->
			<div class="row" style="margin-bottom: 100px">

				<div class="col-md-2">
					<!-- 會員資料索引 -->
					<%@ include file="/WEB-INF/pages/Member-index.jsp"%>
				</div>	
					
					
		<!-- 表單 ajax -->	
		<div class='col-md-6' style='margin: 0 auto;' id="showContent">	</div>
		
		
	</div></main></div>	
		
		
		
<!-- "新增表單"的互動視窗 Modal -->

					<div class="modal fade" tabindex="-1" role="dialog" id="insertModalShow">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h4 class="modal-title">新增健康資訊</h4>
									<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
									</button>
								</div>
							<div class="modal-body">
							
								<form id='insertHealthForm' name='insertHealthForm'>
								
									<table class="table  table-hover">
										<tr>
											<td>收縮壓:</td>
											<td>
												<input type='text' id='systolicBloodPressure' name='systolicBloodPressure' size="5"/> mmHg
												<span id="nameCheck"></span>
											</td>
										</tr>
										<tr>
											<td>舒張壓:</td>
											<td>
												<input type='text' id='diastolicBloodPressure' name='diastolicBloodPressure' size="5"/> mmHg
												<span id="nameCheck"></span>
											</td>
										</tr>
										<tr>
											<td>心率:</td>
											<td>
												<input type='text' id='heartRate' name='heartRate' size="5"/> 次/分鐘
												<span id="nameCheck"></span>
											</td>
										</tr>
										<tr>
											<td>飯前(空腹)血糖:</td>
											<td>
												<input type='text' id='fastingBloodSugar' name='fastingBloodSugar' size="5"/> mg/dl
												<span id="nameCheck"></span>
											</td>
										</tr>
										<tr>
											<td>飯後血糖:</td>
											<td>
												<input type='text' id='bloodSugarAfterMeal' name='bloodSugarAfterMeal' size="5"/> mg/dl
												<span id="nameCheck"></span>
											</td>
										</tr>
										<tr>
											<td>身高:</td>
											<td>
												<input type='text' id='height' name='height' size="5"/> 公分
												<span id="nameCheck"></span>
											</td>
										</tr>
										<tr>
											<td>體重:</td>
											<td>
												<input type='text' id='weight' name='weight' size="5"/> 公斤
												<span id="nameCheck"></span>
											</td>
										</tr>
										<tr>
											<td>腰圍:</td>
											<td>
												<input type='text' id='waistline' name='waistline' size="5"/> 公分
												<span id='nameCheck'></span>
											</td>
										</tr>
										<tr>
											<td>血氧濃度:</td>
											<td>
												<input type='text' id='oxygenSaturation' name='oxygenSaturation' size="5"/> %
												<span id='nameCheck'></span>
											</td>
										</tr>
										<tr>
										<td>體溫:</td>
											<td>
												<input type='text' id='temperature' name='temperature' size="5"/> 度c
												<span id='nameCheck'></span>
											</td>
										</tr>
										<tr>
										<td>疾病史:</td>
											<td>
												<textarea id='medicalHistory' name='medicalHistory' rows='6' cols='40' style='resize : none;' placeholder='心臟病、氣喘、腎臟病...'/></textarea>
												<span id='nameCheck'></span>
											</td>
										</tr>
									</table>
								</form>
								<button type="button" class="btn btn-default" data-bs-dismiss="modal">關閉</button>
								<button id="insertHealthBtn" type="button" data-bs-dismiss="modal" class="btn btn-primary">確認新增</button>
								<button id="onekey" type="button" class="btn btn-primary">一鍵輸入</button>
		
								</div>
							</div>
						<!-- /.modal-content -->
						</div>
					<!-- /.modal-dialog -->
					</div>
				<!-- /.modal -->
				
				
				
				<!-- "修改表單"的互動視窗 Modal -->

					<div class="modal fade" tabindex="-1" role="dialog" id="updateModalShow">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h4 class="modal-title">修改健康資訊</h4>
									<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
									</button>
								</div>
							<div class="modal-body">
							
								<form id='updateHealthForm' name='updateHealthForm'>
								
									<table class="table  table-hover">
										<tr>
											<td>收縮壓:</td>
											<td>
												<input type='hidden' id='healthid1' name='healthid'/>
												<input type='text' id='systolicBloodPressure1' name='systolicBloodPressure' size="5"/> mmHg
												<span id="nameCheck"></span>
											</td>
										</tr>
										<tr>
											<td>舒張壓:</td>
											<td>
												<input type='text' id='diastolicBloodPressure1' name='diastolicBloodPressure' size="5"/> mmHg
												<span id="nameCheck"></span>
											</td>
										</tr>
										<tr>
											<td>心率:</td>
											<td>
												<input type='text' id='heartRate1' name='heartRate' size="5"/> 次/分鐘
												<span id="nameCheck"></span>
											</td>
										</tr>
										<tr>
											<td>飯前(空腹)血糖:</td>
											<td>
												<input type='text' id='fastingBloodSugar1' name='fastingBloodSugar' size="5"/> mg/dl
												<span id="nameCheck"></span>
											</td>
										</tr>
										<tr>
											<td>飯後血糖:</td>
											<td>
												<input type='text' id='bloodSugarAfterMeal1' name='bloodSugarAfterMeal' size="5"/> mg/dl
												<span id="nameCheck"></span>
											</td>
										</tr>
										<tr>
											<td>身高:</td>
											<td>
												<input type='text' id='height1' name='height' size="5"/> 公分
												<span id="nameCheck"></span>
											</td>
										</tr>
										<tr>
											<td>體重:</td>
											<td>
												<input type='text' id='weight1' name='weight' size="5"/> 公斤
												<span id="nameCheck"></span>
											</td>
										</tr>
										<tr>
											<td>腰圍:</td>
											<td>
												<input type='text' id='waistline1' name='waistline' size="5"/> 公分
												<span id='nameCheck'></span>
											</td>
										</tr>
										<tr>
											<td>血氧濃度:</td>
											<td>
												<input type='text' id='oxygenSaturation1' name='oxygenSaturation' size="5"/> %
												<span id='nameCheck'></span>
											</td>
										</tr>
										<tr>
										<td>體溫:</td>
											<td>
												<input type='text' id='temperature1' name='temperature' size="5"/> 度c
												<span id='nameCheck'></span>
											</td>
										</tr>
										<tr>
										<td>疾病史:</td>
											<td>
												<textarea id='medicalHistory1' name='medicalHistory' rows='6' cols='40' style='resize : none;' placeholder='心臟病、氣喘、腎臟病...'/></textarea>
												<span id='nameCheck'></span>
											</td>
										</tr>
									</table>
								</form>
								<button type="button" class="btn btn-default" data-bs-dismiss="modal">關閉</button>
								<button id="updateHealthBtn" type="button" data-bs-dismiss="modal" class="btn btn-primary">確認修改</button>
								<button id="twokey" type="button" class="btn btn-primary">一鍵輸入</button>
		
								</div>
							</div>
						<!-- /.modal-content -->
						</div>
					<!-- /.modal-dialog -->
					</div>
				<!-- /.modal -->
		
		
		
<%@ include file="/WEB-INF/pages/user-site-footer.jsp"%>
<%@ include file="/WEB-INF/pages/user-js.jsp"%>


		
		
<script type="text/javascript">




//顯示表單

$(document).ready(function(){
	load();

})



function load(){
		
		$.ajax({
			
			type:"post",
			url:"/Member/searchOneHealth",
			//dataType:'JSON',
			contentType:'application/json',
			
			success : function(data){
			     console.log("SUCCESS : "+ data);
			     
// 			     var json = JSON.stringify(data, null, 4);
			     
// 				 var parsedObjinArray = JSON.parse(json);
				 
// 				 console.log("parsedObjinArray: "+parsedObjinArray);
				 
				 
				 // 清除div下的所有子內容
				 $("#showContent").empty();
				 
				 var div =  $("#showContent");
				
				 var content =""
				 
					 if (data != ""){
						 
						 content += 
								"<h2 style='margin: 8px 150px;  text-align:center;''>健康資料表</h2><div class='card-body'><table class='table  table-hover'>"
							    +"<tr><td>收縮壓:</td><td>" + data.systolicBloodPressure + " mmHg</td><td id='showSystolicBloodPressure'></td></tr>"
							    +"<tr><td>舒張壓:</td><td>" + data.diastolicBloodPressure + " mmHg</td><td id='showDiastolicBloodPressure'></td></tr>"
							    +"<tr><td>心率(心跳數):</td><td>" + data.heartRate + " 次/分鐘</td><td id='showHeartRate'></td></tr>"
							    +"<tr><td>飯前(空腹)血糖:</td><td>" + data.fastingBloodSugar + " mg/dl</td><td id='showFastingBloodSugar'></td></tr>"						
								+"<tr><td>飯後血糖:</td><td>" + data.bloodSugarAfterMeal + " mg/dl</td><td id='showBloodSugarAfterMeal'></td></tr>"					
								+"<tr><td>身高:</td><td>" + data.height + " 公分</td><td></td></tr>"					
								+"<tr><td>體重:</td><td>" + data.weight + " 公斤</td><td></td></tr>"					
								+"<tr><td>BMI:</td><td>" + data.bmi + " 公斤/平方公尺</td><td id='showBMI'></td></tr>"					
								+"<tr><td>腰圍:</td><td>" + data.waistline + " 公分</td><td id='showWaistline'></td></tr>"					
								+"<tr><td>血氧濃度:</td><td>" + data.oxygenSaturation + " %</td><td id='showOxygenSaturation'></td></tr>"					
								+"<tr><td>體溫:</td><td>" + data.temperature + " 度c</td><td id='showTemperature'></td></tr>"					
								+"<tr><td>疾病史:</td><td>" + data.medicalHistory + "</td><td id='showMedicalHistory'></td></tr>"					
								+"<tr><td colspan='2' style='text-align: center'><input type='submit' class='btn' id='gotoUpdateHealthBtn' style='font-size:20px;' value='修改' /></td></tr></table>"					
								+"</div><div class='col-md-6'></div>"	
								
													
					 }else{
						 
						 content += 
							"<h2 style='margin: 8px 150px;  text-align:center;''>健康資料表</h2><div class='card-body'><table class='table  table-hover'>"
						    +"<tr><td>收縮壓:</td><td style='text-align: center'>請填寫資料</td></tr>"
						    +"<tr><td>舒張壓:</td><td style='text-align: center'>請填寫資料</td></tr>"
						    +"<tr><td>心率(心跳數):</td><td style='text-align: center'>請填寫資料</td></tr>"
						    +"<tr><td>飯前(空腹)血糖:</td><td style='text-align: center'>請填寫資料</td></tr>"						
							+"<tr><td>飯後血糖:</td><td style='text-align: center'>請填寫資料</td></tr>"					
							+"<tr><td>身高:</td><td style='text-align: center'>請填寫資料</td></tr>"					
							+"<tr><td>體重:</td><td style='text-align: center'>請填寫資料</td></tr>"					
							+"<tr><td>BMI:</td><td style='text-align: center'>請填寫資料</td></tr>"					
							+"<tr><td>腰圍:</td><td style='text-align: center'>請填寫資料</td></tr>"					
							+"<tr><td>血氧濃度:</td><td style='text-align: center'>請填寫資料</td></tr>"					
							+"<tr><td>體溫:</td><td style='text-align: center'>請填寫資料</td></tr>"					
							+"<tr><td>疾病史:</td><td style='text-align: center'>請填寫資料</td></tr>"					
							+"<tr><td colspan='2' style='text-align: center'><input type='submit' class='btn' id='gotoInsertHealthBtn' style='font-size:20px;' value='新增' /></td></tr></table>"					
							+"</div><div class='col-md-6'></div>"							 
						 
						 
						 
// 						 content += 
// 								"<h2 style='margin: 8px 150px;  text-align:center;'>新增健康資訊</h2><div class='card-body'><table class='table  table-hover'>"
// 								+"<form id='insertHealthForm111' name='insertHealthForm'><tr><td>收縮壓:</td><td><input type='text' id='systolicBloodPressure' name='systolicBloodPressure'/><span id='nameCheck'></span></td></tr>"
//       							+"<tr><td>舒張壓:</td><td><input type='text' id='diastolicBloodPressure' name='diastolicBloodPressure'/><span id='nameCheck'></span></td></tr>"
// 								+"<tr><td>心率:</td><td><input type='text' id='heartRate' name='heartRate'/><span id='nameCheck'></span></td></tr>"
// 								+"<tr><td>飯前(空腹)血糖:</td><td><input type='text' id='fastingBloodSugar' name='fastingBloodSugar'/><span id='nameCheck'></span></td></tr>"
// 								+"<tr><td>飯後血糖:</td><td><input type='text' id='bloodSugarAfterMeal' name='bloodSugarAfterMeal'/><span id='nameCheck'></span></td></tr>"
// 								+"<tr><td>身高:</td><td><input type='text' id='height' name='height'/><span id='nameCheck'></span></td></tr>"
// 								+"<tr><td>體重:</td><td><input type='text' id='weight' name='weight'/><span id='nameCheck'></span></td></tr>"
// 								+"<tr><td>腰圍:</td><td><input type='text' id='waistline' name='waistline'/><span id='nameCheck'></span></td></tr>"
// 								+"<tr><td>血氧濃度:</td><td><input type='text' id='oxygenSaturation' name='oxygenSaturation'/><span id='nameCheck'></span></td></tr>"
//       							+"<tr><td>體溫:</td><td><input type='text' id='temperature' name='temperature'/><span id='nameCheck'></span></td></tr>"
//       							+"<tr><td>疾病史:</td><td><textarea id='medicalHistory' name='medicalHistory' rows='6' cols='40' style='resize : none;' placeholder='心臟病、氣喘、腎臟病...'/></textarea><span id='nameCheck'></span></td></tr>"
//       							+"<tr><td style='text-align: center'><input type='image' id='insertHealthBtn111' data-bs-dismiss='modal' src='${pageContext.request.contextPath}/images/update.jpg'></td></form>"
//       							+"<td style='text-align: center'><input type='submit' class='btn' style='font-size:20px;' value='取消'></td></tr></table><button id='onekey'>範例</button></div>"
//       							+"<div class='col-md-6'></div>"
					 }

				 
				 
				div.html(content);
				
				if (data != ""){
				showHealthCheck();
				}
				

						//一鍵輸入
						$('#onekey').on('click', function oneClick() {
							console.log("一鍵輸入");
							$('#systolicBloodPressure').val(110);
							$('#diastolicBloodPressure').val(80);
							$('#heartRate').val(70);
							$('#fastingBloodSugar').val(75);
							$('#bloodSugarAfterMeal').val(120);
							$('#height').val(180);
							$('#weight').val(79);
							$('#waistline').val(68);
							$('#oxygenSaturation').val(95);
							$('#temperature').val(36.3);
							$('#medicalHistory').val('青光眼、失眠、厭食症');
						})
						
						//一鍵輸入
						$('#twokey').on('click', function twoClick() {
							console.log("一鍵輸入");
							$('#systolicBloodPressure1').val(300);
							$('#diastolicBloodPressure1').val(300);
							$('#heartRate1').val(300);
							$('#fastingBloodSugar1').val(300);
							$('#bloodSugarAfterMeal1').val(300);
							$('#height1').val(166);
							$('#weight1').val(300);
							$('#waistline1').val(300);
							$('#oxygenSaturation1').val(60);
							$('#temperature1').val(300);
							$('#medicalHistory1').val('青光眼、失眠、厭食症、躁鬱症、腸胃炎');
						})						
						
						
//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------						



						function showHealthCheck() {
							
						    let showSystolicBloodPressure = document.getElementById("showSystolicBloodPressure");
						    let showDiastolicBloodPressure = document.getElementById("showDiastolicBloodPressure");
						    let showHeartRate = document.getElementById("showHeartRate");
						    let showFastingBloodSugar = document.getElementById("showFastingBloodSugar");
						    let showBloodSugarAfterMeal = document.getElementById("showBloodSugarAfterMeal");
						    let showBMI = document.getElementById("showBMI");
						    let showWaistline = document.getElementById("showWaistline");
						    let showOxygenSaturation = document.getElementById("showOxygenSaturation");
						    let showTemperature = document.getElementById("showTemperature");
						    let showMedicalHistory = document.getElementById("showMedicalHistory");
							
						    //收縮壓
							if(data.systolicBloodPressure>140){
								showSystolicBloodPressure.innerHTML="&nbsp&nbsp<span style='color:red;'>收縮壓過高</span>";
							}else if(data.systolicBloodPressure<120){
								showSystolicBloodPressure.innerHTML="&nbsp&nbsp<span style='color:gray;'>收縮壓過低</span>";
							}else{
								showSystolicBloodPressure.innerHTML="&nbsp&nbsp<span style='color:green;'>收縮壓正常</span>";
							}
							
							//舒張壓
							if(data.diastolicBloodPressure>90){
								showDiastolicBloodPressure.innerHTML="&nbsp&nbsp<span style='color:red;'>舒張壓過高</span>";
							}else if(data.diastolicBloodPressure<80){
								showDiastolicBloodPressure.innerHTML="&nbsp&nbsp<span style='color:gray;'>舒張壓過低</span>";
							}else{
								showDiastolicBloodPressure.innerHTML="&nbsp&nbsp<span style='color:green;'>舒張壓正常</span>";
							}
							
							//心率(心跳數)
							if(data.heartRate>100){
								showHeartRate.innerHTML="&nbsp&nbsp<span style='color:red;'>心率過高</span>";
							}else if(data.heartRate<60){
								showHeartRate.innerHTML="&nbsp&nbsp<span style='color:gray;'>心率過低</span>";
							}else{
								showHeartRate.innerHTML="&nbsp&nbsp<span style='color:green;'>心率正常</span>";
							}
							
							//飯前(空腹)血糖
							if(data.fastingBloodSugar>99){
								showFastingBloodSugar.innerHTML="&nbsp&nbsp<span style='color:red;'>空腹血糖過高</span>";
							}else if(data.systolicBloodPressure<70){
								showFastingBloodSugar.innerHTML="&nbsp&nbsp<span style='color:gray;'>空腹血糖過低</span>";
							}else{
								showFastingBloodSugar.innerHTML="&nbsp&nbsp<span style='color:green;'>空腹血糖正常</span>";
							}
							
							//飯後血糖
							if(data.bloodSugarAfterMeal>140){
								showBloodSugarAfterMeal.innerHTML="&nbsp&nbsp<span style='color:red;'>飯後血糖過高</span>";
							}else if(data.bloodSugarAfterMeal<80){
								showBloodSugarAfterMeal.innerHTML="&nbsp&nbsp<span style='color:gray;'>飯後血糖過低</span>";
							}else{
								showBloodSugarAfterMeal.innerHTML="&nbsp&nbsp<span style='color:green;'>飯後血糖正常</span>";
							}
							
							//BMI
							if(data.bmi>=24 && data.bmi<27){
								showBMI.innerHTML="&nbsp&nbsp<span style='color:red;'>體重過重</span>";
							}else if(data.bmi>=27 && data.bmi<30){
								showBMI.innerHTML="&nbsp&nbsp<span style='color:red;'>輕度肥胖</span>";
							}else if(data.bmi>=30 && data.bmi<35){
								showBMI.innerHTML="&nbsp&nbsp<span style='color:red;'>中度肥胖</span>";
							}else if(data.bmi>=35){
								showBMI.innerHTML="&nbsp&nbsp<span style='color:red;'>重度肥胖</span>";
							}else if(data.bmi<18.5){
								showBMI.innerHTML="&nbsp&nbsp<span style='color:gray;'>體重過輕</span>";
							}else{
								showBMI.innerHTML="&nbsp&nbsp<span style='color:green;'>體重正常</span>";
							}
							
							//腰圍
							if(data.waistline>85){
								showWaistline.innerHTML="&nbsp&nbsp<span style='color:red;'>腹部肥胖</span>";
							}else{
								showWaistline.innerHTML="&nbsp&nbsp<span style='color:green;'>腰圍正常</span>";
							}
							
							//血氧濃度
							if(data.oxygenSaturation>=95 && data.oxygenSaturation<=100){
								showOxygenSaturation.innerHTML="&nbsp&nbsp<span style='color:green;'>血氧濃度正常</span>";
							}else if(data.oxygenSaturation>=90 && data.oxygenSaturation<95){
								showOxygenSaturation.innerHTML="&nbsp&nbsp<span style='color:green;'>血氧濃度偏低，但正常</span>";
							}else if(data.oxygenSaturation<90){
								showOxygenSaturation.innerHTML="&nbsp&nbsp<span style='color:red;'>血氧濃度過低</span>";
							}
							
							//體溫
							if(data.temperature>38){
								showTemperature.innerHTML="&nbsp&nbsp<span style='color:red;'>體溫過高</span>";
							}else if(data.temperature<36){
								showTemperature.innerHTML="&nbsp&nbsp<span style='color:gray;'>體溫過低</span>";
							}else{
								showTemperature.innerHTML="&nbsp&nbsp<span style='color:green;'>體溫正常</span>";
							}
							
						}



//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------						



						// "新增"按鈕叫出 Modal
						$('#gotoInsertHealthBtn').click(function (e) {
								e.preventDefault();
								$('#insertModalShow').modal('show');
						})							

						
						
						// "確認新增"按鈕，儲存資料
						$("#insertHealthBtn").click(
								function() {
									
									let insertFormData = new FormData($('#insertHealthForm')[0]);
									console.log(insertFormData);
									$.ajax({
										url : "/Member/insertHealth",
										method : "POST",
										data : insertFormData,
										contentType : false,
										processData : false,
										success : function(res) {
											
											Swal.fire({
												  icon: 'success',
												  title: '恭喜您成功新增!!',
												  showConfirmButton: false,
												  timer: 1500
												})
										window.setTimeout(function(){location.reload()},2000)		
// 										window.location.reload();     //頁面刷新
										},
										error : function(err) {
											
											Swal.fire({
												  icon: 'error',
												  title: 'Oops...',
												  text: 'Something went wrong!',
												  footer: '<a href="">Why do I have this issue?</a>'
												})
												
											console.log('新增失敗' + err);
										}
									});

								})
								


//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------								
								
								
						// "修改"按鈕叫出 Modal
						$('#gotoUpdateHealthBtn').click(function (e) {
								e.preventDefault();
								findHealth();
								$('#updateModalShow').modal('show');
						})									
								
								
						
				
		// 啟用"修改"按鈕前置準備，尋找單筆
		function findHealth() {
			$.ajax({
				url: "/Member/searchOneHealth",
				method: "POST",
				dataType: "json",
				success: function (res) {
					
					
					$('#updateHealthForm')[0].reset();
					
					console.log(res.healthid);
					console.log(res.systolicBloodPressure);
					
					$('#healthid1').val(res.healthid);
					$('#systolicBloodPressure1').val(res.systolicBloodPressure);
					$('#diastolicBloodPressure1').val(res.diastolicBloodPressure);
					$('#heartRate1').val(res.heartRate);
					$('#fastingBloodSugar1').val(res.fastingBloodSugar);
					$('#bloodSugarAfterMeal1').val(res.bloodSugarAfterMeal);
					$('#height1').val(res.height);
					$('#weight1').val(res.weight);
					$('#waistline1').val(res.waistline);
					$('#oxygenSaturation1').val(res.oxygenSaturation);
					$('#temperature1').val(res.temperature);
					$('#medicalHistory1').val(res.medicalHistory);
	
				},
				error: function (err) {
					console.log("bbb");
					console.log(err);
				}
			});
		}								
								
								

						// "確認修改"按鈕，儲存資料
						$("#updateHealthBtn").click(
								function() {
									
									let updateFormData = new FormData($('#updateHealthForm')[0]);
									console.log(updateFormData);
									$.ajax({
										url : "/Member/updateHealth",
										method : "POST",
										data : updateFormData,
										contentType : false,
										processData : false,
										success : function(res) {
											
											Swal.fire({
												  icon: 'success',
												  title: '恭喜您成功修改!!',
												  showConfirmButton: false,
												  timer: 1500
												})
										window.setTimeout(function(){location.reload()},2000)		
									//	window.location.reload();     //頁面刷新
										},
										error : function(err) {
											
											Swal.fire({
												  icon: 'error',
												  title: 'Oops...',
												  text: 'Something went wrong!',
												  footer: '<a href="">Why do I have this issue?</a>'
												})
												
											console.log('新增失敗' + err);
										}
									});

								})
						
						
						
						
						

					},
					error : function(err) {
						console.log("error");
						console.log(err);
					}
				})
	}
</script>
	

</body>
</html>