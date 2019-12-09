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
}
.header-wrapper{
  background: linear-gradient(90deg, #11998e, #38ef7d);
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
@font-face {
	font-family: 'Ddukkubi';
	src: url('../resources/font/Ddukkubi.ttf');
}

@font-face {
	font-family: 'NotoSansBold';
	src: url('../resources/font/NotoSansBold.otf');
}

@font-face {
	font-family: 'YoonGothic';
	src: url('../resources/font/YoonGothic.otf');
}

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
	padding: 0;
	height: 100px;
	width: 100% margin: 30px 0 30px 0;
	background: #d0beb7;
	display: flex;
	align-items: center;
}

.rk_search {
	width: 99%;
	height: 94%;
	margin: 0 auto;
	border: 1px dashed;
	border-color: white;
	display: flex;
	align-items: center;
	justify-content: space-between;
}

.rk_search2 {
	width: 99%;
	height: 94%;
	margin: 0 auto;
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
	justify-content: space-around;
}

.search_txt2 {
	margin: 0px;
	line-height: 30px;
	flex-grow: 2;
	text-align: center;
}

.search_input {
	flex-grow: 3;
	margin: 0 10px 0 10px;
}

.search_btn {
	background-position: -571px -24px;
	background: white;
	flex-grow: 2;
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
									'<tr><td class="rank">'+(idx+1) +'</td><td class="character">'
									+'<div class="character_child"><div class="character_child1"><img height="60px" src=""></div>'
									+'<div class="character_child2">'+result[idx].userNickname + '</div></div></td>'
									+'<td>'+ result[idx].userRank + '</td>'
									+'<td class="exp">' + result[idx].userExp +'</td>'
									+'<td class="win_lose">'+ (result[idx].userWin+result[idx].userLose)+'전'+'&nbsp'
									+result[idx].userWin + '승'+'&nbsp' + result[idx].userLose+ '패' 
									/* +'('+(result[idx].userWin/(result[idx].userWin + result[idx].userLose))+')' */
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
		if("$('#search_input').val()" != null){
			alert('닉네임을 입력하세요!', 'warning')
		}else{ 
			$.ajax({
				method:"GET",
				url:"searchUser",
				data:{
					userNickname:$('#search_input').val()
					Console.
					},
				success:function(data){
					$("tbody").empty();
					$(search).each(
							function(idx){
								$("tbody").append(
										'<tr><td class="rank">'+(idx+1) +'</td><td class="character">'
										+'<div class="character_child"><div class="character_child1"><img height="60px" src=""></div>'
										+'<div class="character_child2">'+data[idx].userNickname + '</div></div></td>'
										+'<td>'+ data[idx].userRank + '</td>'
										+'<td class="exp">' + data[idx].userExp +'</td>'
										+'<td class="win_lose">'+ (data[idx].userWin+data[idx].userLose)+'전'+'&nbsp'
										+data[idx].userWin + '승'+'&nbsp' + data[idx].userLose+ '패' 
										+'</td></tr>'
								);
							});
				},error: function(a, b, errMsg){
					alert('실패'+ errMsg);
				}
				
			})
		}
	}
	window.onload = function(){
		rankUsers();
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
						<h4 class="search_txt2">검색</h4>
						<input id="search_input" class="search_input" type="text" placeholder="닉네임을 입력하세요">
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
