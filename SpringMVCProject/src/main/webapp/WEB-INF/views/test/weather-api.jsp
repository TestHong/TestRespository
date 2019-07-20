<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div>
	# 지역: 
	<select name="region" id="region-select">
		<optgroup label="Asia">
			<option value="Seoul">서울(대한민국)</option>
			<option value="Tokyo">동경(일본)</option>
		</optgroup>
		<optgroup label="Europe">
			<option value="London">런던(영국)</option>
			<option value="Paris">파리(프랑스)</option>
		</optgroup>
	</select>
	<input type="button" id="region-btn" value="확인">	
</div>
<hr>
<div id="show-weather">
	<p></p>
</div>

<jsp:include page="../include/plugin-js.jsp" />

<script>
	
	$("#region-btn").on("click", function() {

		const myApiKey = "6c390db8468b28880f0d34dff89b416e";
		const city = $("#region-select option:selected").val();
		console.log(city);
		const apiURI = "http://api.openweathermap.org/data/2.5/weather?q="
				+ city + "&appid=" + myApiKey;
		console.log(apiURI);
		
		 $.ajax({
	            url: apiURI,
	            type: "GET",
	            dataType: "json",
	            success: function(result) {
	                printWeatherInfo(result);                
	            }
		 });
	});
	
	//날씨 정보 출력 함수
	function printWeatherInfo(result) {
		const temp = result.main.temp - 273;
		const humid = result.main.humidity;
		const country = result.sys.country
		const city = result.name;
		
		const target = $("#show-weather p");
		const element = "- 온도: " + temp + "<br>" 
						+ "- 습도: " + humid + "<br>"
						+ "- 국가: " + country + "<br>"
						+ "- 도시: " + city;
		target.html(element);
		
	}
</script>
</body>
</html>






