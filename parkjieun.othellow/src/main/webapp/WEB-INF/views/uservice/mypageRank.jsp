<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>오델로W</title>
<meta charset="utf-8">
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

.container {
	width: 800px;
	height: 1200px;
	margin: 0 auto;
	font-family: 'YoonGothic';
}

a {
	font-size: 20px;
	color: black;
	text-decoration: none;
	font-family: 'YoonGothic';
}

.menu_div {
	display: flex;
	justify-content: space-around;
	align-items: center;
	height: 150px;
}

.menu {
	width: 300px;
	text-align: center;
}

.line1 {
	height: 4px;
	background: #ddd;
	width: 100%;
	margin-top: 20px;
	transition: 0.3s;
}

.menu:hover .line1 {
	background: #c0c962;
}

.mypage {
	width: 800px;
	height: 450px;
	display: flex;
	flex-direction: column;
}

.mypage_list {
	height: 330px;
	width: 800px;
	margin: auto;
	display: flex;
}

.mypage_sujung_tle {
	padding-bottom: 30px;
}

.mypage_sujung {
	background: #c0c962;
	width: 300px;
	padding: 17px 30px;
	margin: auto;
	display: flex;
	justify-content: space-around;
	border: 2px solid #c0c962;
	border-radius: 30px;
	cursor: pointer;
}

.mypage_Img {
	background: #eee;
	width: 330px;
	height: 330px;
	margin-top: auto;
	margin-bottom: auto;
	border-radius: 100%;
	text-align: center;
	display: flex;
}

.mypage_Img img {
	align-items: center;
	margin: auto;
	width: 330px;
	height: 330px;
}

.mypage_Rank {
	width: 400px;
	height: 300px;
	margin: auto;
	display: flex;
	flex-direction: column;
	justify-content: center;
}

.col {
	width: 100%;
	height: 50px;
	display: flex;
	align-items: center;
	display: flex;
}

.row1 {
	flex-grow: 1;
	width: 30%;
	color: gray;
	padding-left: 2px;
	font-size: 17px;
}

.row2 {
	width: 70%;
	font-weight: bold;
	font-size: 20px;
	display: flex;
}

</style>
</head>

<body>
  <div class="header-wrapper">
		<header>
			<nav>
				<ul>
					<li><a href="../uservice/RankList" class="nav">랭킹</a></li>
					<li class="logo"><a id="logo" href="../" style="font-size:75px; font-family:'Ddukkubi'">오델로<span id="w-word">W</span></a></li>
					<li><a href='list' class="nav">커뮤니티</a></li>
				</ul>
			</nav>
		</header>
	</div>
	<div class="header-divider"></div>
	<div class="container">
	<%
			if (session.getAttribute("user") == null) {
		%>
		<p>404 : 로그인이 되어 있지 않습니다.</p>
		<%
			} else {
		%>
		<div class="menu_div">
			<div class="menu">
				<a href="mypageRank">내 랭킹 조회</a>
				<div class="line1"></div>
			</div>
			<div class="menu">
				<a href="mypageUpdate">회원 정보 수정</a>
				<div class="line1"></div>
			</div>
		</div>

		<div class="mypage">
			<div class="mypage_list">
				<div class="mypage_Img">
					<img height="170px;" src="">
				</div>
				<div class="mypage_Rank">
					<span class="col">
						<div class="row1">닉네임</div>
						<div class="row2">${user.userNickname}</div>
					</span> <span class="col">
						<div class="row1">승률</div>
						<div class="row2">${user.userWin+user.userLose}전 ${user.userWin}승 ${user.userLose}패 (${user.userWin/(user.userWin+user.userLose)}%)</div>
					</span> <span class="col">
						<div class="row1">랭킹</div>
						<div class="row2"><p>${user.userRank}</p></div>
					</span> <span class="col">
						<div class="row1">EXP</div>
						<div class="row2">${user.userExp}</div>
					</span>
				</div>
			</div>
		</div>
		<div class="mypage_sujung_tle">
			<div class="mypage_sujung">
				<a href="Rank"><font color="white";>전체 랭킹 보기</font></a>
			</div>
		</div>
		<%
			}
		%>
	</div>
</body>
</html>
