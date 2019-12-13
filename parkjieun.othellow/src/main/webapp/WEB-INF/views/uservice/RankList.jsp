<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>오델로W</title>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1'>
<link rel='stylesheet'
	href='https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css' />
<script
	src='https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js'></script>
<script src='http://code.jquery.com/jquery-3.1.1.min.js'></script>

<style>
@font-face {
   font-family: 'Ddukkubi';
   src: url('../font/Ddukkubi.ttf');
}

@font-face {
   font-family: 'NotoSansBold';
   src: url('../font/NotoSansBold.otf');
}

@font-face {
   font-family: 'YoonGothic';
   src: url('../font/YoonGothic.otf');
}

body {
   margin: 0;
   font-family: 'NotoSansBold';
}

header{
  width:1200px;
  margin:0 auto;
  height:200px;
  background:url("");
  background-size:cover;
  background-position: center;
  backcground-image: url('../img/headerImg.png');
}
.header-wrapper{
  background: black;
}

nav {
   height: 180px;
}

nav ul {
   list-style: none;
   padding: 0px;
   margin: 0px;
   display: flex;
   justify-content: center;
   align-items: center;
}

nav li a {
   font-size: 25px;
   color: white;
   text-decoration: none;
   text-shadow: 2px 2px 0px black;
   font-family: 'NotoSansBold';
}
#logo{
  font-style: italic;
  -webkit-text-stroke: 2px #000;
  background-color:black;

  -webkit-background-clip:text;
  -webkit-text-fill-color:transparent;
  text-shadow:none;
  display:inline-block;
  width:380px;
  text-align: center;
  position:relative;
  left:10px; top:5px;
}
#logo:before{
  content:"오델로";
  position:absolute;
  left:-15px; top:-5px;
  text-align: center;
  background:-webkit-linear-gradient(white 0%, #aaa 100%);
  -webkit-background-clip:text;
  -webkit-text-fill-color:transparent;
  width:280px;
}
#w-word{
  font-style: italic;
  -webkit-text-stroke: 2px #000;
  background:black;
  display:inline-block;
  width:120px;
  text-align: center;
  -webkit-background-clip:text;
  -webkit-text-fill-color:transparent;
  text-shadow:none;
  position:relative;
}
#w-word:before{
  content:"W";
  position:absolute;
  left:-5px; top:-5px;
  background:-webkit-linear-gradient(rgb(10,155,135) 0%, rgb(214,211,20) 100%);
  width:120px;
  text-align: center;
  -webkit-background-clip:text;
  -webkit-text-fill-color:transparent;
}
.header-divider {
   height: 20px;
   background-image: linear-gradient(135deg, #383838 37.50%, #303030 37.50%, #303030 50%,
      #383838 50%, #383838 87.50%, #303030 87.50%, #303030 100%);
   background-size: 11.31px 11.31px;
}
</style>

<style>

body {
	margin: 0;
	font-family: 'YoonGothic';
}

.container {
	width: 1200px;
	height: 1200px;
	margin: 0 auto;
	padding-top: 30px;
	font-family: 'YoonGothic';
}

.Rank_page {
	width: 1200px;
	height: 450px;
	display: flex;
	flex-direction: column;
	padding-top: 30px;
}

.Rank_table {
	width: 100% line-height:1.5;
	font-size: 14px;
	border: collapse;
	table-layout: fixed;
	border-collapse: collapse
}

.Rank_table th, td {
	text-align: center;
	letter-spacing: -0.5px;
	line-height: 18px;
	border-bottom: 1px solid #ccc;
}

.Rank_table th {
	padding: 21px 0;
	color: #030303;
	border-top: 2px solid #acacac;
	border-bottom: 2px solid #acacac;
	background-color: #fff !important;
}

.Rank_table td {
	height: 82px;
}

#rank_Header {
	height: 120px;
	width: 100%;
}

.rk_search {
	height: 80%;
	margin: 0 auto;
	background: white;
	border:1px solid gray;
	display: flex;
	align-items: center;
	border-radius: 5px;
	box-shadow: 2px 2px 3px 3px lightgray;
}

.rk_search2 {
	width: 99%;
	height: 94%;
	border-color: white;
	display: flex;
	align-items: center;
	justify-content: space-between;
	padding: 50px;
}

.rk_search .search_txt1 {
	line-height: 40px;
	font-size: 23px;
	width: 300px;
	text-align: left;
}

.rk_search_form {
	width: 300px;
	display: flex;
	height: 30px;
}

.search_input {
	margin: 0 10px 0 10px;
	outline:none;
}

.search_input:hover{
	border: 2px solid #c0c962;
}

.search_btn {
	background-position: -571px -24px;
	border:none;
	border-radius: 5px;
	background: #fafafa;
	font-family: 'YoonGothic';
	font-size: 15px;
	width:90px;
	border: 1px solid lightgray;
	outline:none;
}
.search_btn:hover {
	border: 2px solid #c0c962;
}

.rank {
	font-size: 20px;
	font-weight: bold;
	color: #e65700;
}

.character_child {
	display: flex;
	align-items: center;
}

.character_child1 {
	width: 60px;
	height: 60px;
	margin-right: 20px;
	padding: 0px 20px;
}
</style>
<script type="text/javascript">
	var alert = function(msg, type){
	swal({
		title : "오델로W",
		text : msg,
		type: type,
		timer : 1000,
		customClass : 'sweet-size',
		showConfirmButton : false
	});
}
	function rankUsers(){
		$.ajax({
			url : "rankUsers",
			method : "get",
			success : function(result){
				$("tbody").empty();
				$(result).each(
						function(idx){
							$("tbody").append(
									'<tr><td class="rank">'+result[idx].rNum +'</td><td class="character">'
									+'<div class="character_child"><div class="character_child1"><img height="60px" src="'
									+result[idx].imageLink
									+'"></div>'
									+'<div class="character_child2">'+result[idx].userNickname + result[idx].characterNo +'</div></div></td>'
									+'<td>'+ result[idx].userRank + '</td>'
									+'<td class="exp">' + result[idx].userExp +'</td>'
									+'<td class="win_lose">'+ (result[idx].userWin+result[idx].userLose)+'전'+'&nbsp'
									+result[idx].userWin + '승'+'&nbsp' + result[idx].userLose+ '패'  
									+'</td></tr>'	
							);
						});
			},
			error : function(a, b, errMsg){
				alert('리스트 출력 실패' + errMsg);
			}
		})
	}
	
	function searchUser(){ 
		if($('#search_input').val() == ''){
			alert('닉네임을 입력하세요!', 'warning')
		}else{ 
			$.ajax({
				method:"GET",
				url:"searchUser",
				data:{userNickname:$('#search_input').val()},
				success:function(result){
				if(result == ''){
						alert('그런 사용자 없습니다!', 'warning');
					}else{  
					$("tbody").empty();
					$(result).each(
							function(idx){
								$("tbody").append(
										'<tr><td class="rank">'+result[idx].rNum +'</td><td class="character">'
										+'<div class="character_child"><div class="character_child1"><img height="60px" src="'
										+result[idx].imageLink
										+'"></div>'
										+'<div class="character_child2">'+result[idx].userNickname + '</div></div></td>'
										+'<td>'+ result[idx].userRank + '</td>'
										+'<td class="exp">' + result[idx].userExp +'</td>'
										+'<td class="win_lose">'+ (result[idx].userWin+result[idx].userLose)+'전'+'&nbsp'
										+result[idx].userWin + '승'+'&nbsp' + result[idx].userLose+ '패' 
										+'</td></tr>'	
								);
							});
					}
				},error: function(a, b, errMsg){
					alert('실패'+ errMsg);
				}
			})
		}
	}
	window.onload = function(){
		rankUsers();
	}
	function enterSubmit(){
		if(event.keyCode == 13){
			searchUser();
		}
	}
	
</script>
</head>
<body>
	<div class="header-wrapper">
		<header>
			<nav>
				<ul>
					<li><a href="../uservice/RankList" class="nav">랭킹</a></li>
					<li class="logo"><a id="logo" href="../" style="font-size:75px; font-family:'Ddukkubi'">오델로<span id="w-word">W</span></a></li>
					<li><a href='../community/list' class="nav">커뮤니티</a></li>
				</ul>
			</nav>
		</header>
	</div>
  <div class="header-divider"></div>
	<div class="container">
		<div id="rank_Header">
			<div class="rk_search">
				<div class="rk_search2">
					<div class="search_txt1">랭킹 검색</div>
					<div class="rk_search_form">
						
						<input id="search_input" class="search_input" type="text" placeholder="닉네임을 입력하세요" onkeypress="enterSubmit()" required>
						<input class="search_btn" value="검색" type="submit" onclick="searchUser()">
					</div>
				</div>
			</div>
		</div>

		<div class="Rank_page">
			<table class="Rank_table">
			
				<colgroup>
					<col style="width: 10%;">
					<col style="width: 45%">
					<col style="width: 15%">
					<col style="width: 15%">
					<col style="width: 15%">
				</colgroup>
				<thead>
					<tr>
						<th>순위</th>
						<th>캐릭터</th>
						<th>랭킹</th>
						<th>EXP</th>
						<th>플레이 근성도</th>
					</tr>
				</thead>
				<tbody id="rankUsers">
				</tbody>
			</table>
			
		</div>
	</div>
</body>
</html>