<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>오델로W</title>
<meta charset="utf-8">
<!-- <link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"> -->
<style>
@font-face {
	font-family: 'Ddukkubi';
	src: url('../../font/Ddukkubi.ttf');
}

@font-face {
	font-family: 'NotoSansBold';
	src: url('../../font/NotoSansBold.otf');
}

@font-face {
	font-family: 'YoonGothic';
	src: url('../../font/YoonGothic.otf');
}

body {
	margin: 0;
	font-family: 'NotoSansBold';
}

header {
	width: 1200px;
	margin: 0 auto;
	height: 200px;
	background-size: cover;
	background-position: center;
	background-image: url('../../img/headerImg.png');
}

.header-wrapper {
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

#logo {
	font-style: italic;
	-webkit-text-stroke: 2px #000;
	background-color: black;
	-webkit-background-clip: text;
	-webkit-text-fill-color: transparent;
	text-shadow: none;
	display: inline-block;
	width: 380px;
	text-align: center;
	position: relative;
	left: 10px;
	top: 5px;
}

#logo:before {
	content: "오델로";
	position: absolute;
	left: -15px;
	top: -5px;
	text-align: center;
	background: -webkit-linear-gradient(white 0%, #aaa 100%);
	-webkit-background-clip: text;
	-webkit-text-fill-color: transparent;
	width: 280px;
}

#w-word {
	font-style: italic;
	-webkit-text-stroke: 2px #000;
	background: black;
	display: inline-block;
	width: 120px;
	text-align: center;
	-webkit-background-clip: text;
	-webkit-text-fill-color: transparent;
	text-shadow: none;
	position: relative;
}

#w-word:before {
	content: "W";
	position: absolute;
	left: -5px;
	top: -5px;
	background: -webkit-linear-gradient(rgb(10, 155, 135) 0%,
		rgb(214, 211, 20) 100%);
	width: 120px;
	text-align: center;
	-webkit-background-clip: text;
	-webkit-text-fill-color: transparent;
}

.header-divider {
	height: 20px;
	background-image: linear-gradient(135deg, #383838 37.50%, #303030 37.50%, #303030 50%,
		#383838 50%, #383838 87.50%, #303030 87.50%, #303030 100%);
	background-size: 11.31px 11.31px;
}
</style>
</head>
<body>
	<div class="header-wrapper">
		<header>
			<nav>
				<ul>
					<li><a href="../../uservice/RankList" class="nav">랭킹</a></li>
					<li class="logo"><a id="logo" href="../../"
						style="font-size: 75px; font-family: 'Ddukkubi'">오델로<span
							id="w-word">W</span></a></li>
					<li><a href='../list' class="nav">커뮤니티</a></li>
				</ul>
			</nav>
		</header>
	</div>
	<div class="header-divider"></div>

	<!--본문-->

	<div class="table-header">
		<FONT style="font-size: 28px;">커뮤니티</FONT>
	</div>
	<div class="post-wrap">
		<div class="title">
			<div class="title-wrap">
				<div class="subject-header">
					<FONT style="color: #e65700;"><c:out
							value="${community.sort }" /> </FONT><FONT
						style="color: #666; font-size: 13pt; font-weight: bold;">|
						<c:out value="${community.title }" />
					</FONT>
				</div>
				<div class="subject-bottom">
					<FONT style="color: #9999;"><c:out
							value="${community.regDate }" /> | 조회수 : <c:out
							value="${community.hitCount }" /> |</FONT> <FONT style="color: red;">♥</FONT><FONT
						style="color: #9999;"> <c:out
							value="${community.likeCount }" /></FONT>
				</div>
			</div>
			<div class="nickname-wrap">
				<div class="ranking">
					<FONT style="color: #e65700;"><c:out
							value="${community.userRank }" /></FONT>
				</div>
				<div class="nickname">
					<FONT style="color: #7779; font-weight: bold;"><c:out
							value="${community.userNickname }" /></FONT>
				</div>
			</div>
			<div class="profil_wrap">
				<div class="profil_img" style="background-image:url('../../img/${community.imageLink}')";>
				</div>
			</div>
		</div>
		<div class="content-wrap">
			<div class="contents">${community.contents }</div>
			<div class="heart">
				<div id="heart" style="font-size: 3em;">
					<font>♥</font>
				</div>
				<div>
					<label>좋아요!</label>
				</div>
			</div>
		</div>
		<div class="content-footer">
			<div class="back-button" onClick="location.href='../list'">목록으로</div>
		</div>
	</div>
</body>
<style>
.table-header {
	width: 1200px;
	margin: 0 auto;
	border-collapse: collapse;
	font-family: 'YoonGothic';
	color: #333;
	margin-top: 20px;
	margin-bottom: 5px;
}

.table-header a, .table-header a:visited, .table-header a:link,
	.table-header a:active {
	display: inline-block;
	text-decoration: none;
	color: #333;
}

.table-header a:hover {
	color: #c0c962;
}

.post-wrap {
	width: 1200px;
	margin: 0 auto;
}

.title {
	display: table;
	border-top: solid 2.5px #CCC;
	border-bottom: solid 2.5px #CCC;
	padding-left: 30px;
}

.title-wrap {
	display: table-cell;
	width: 800px;
	vertical-align: middle;
}

.subject-header {
	margin-bottom: 5px;
}

.subject-bottom {
	margin-top: 5px;
}

.nickname-wrap {
	display: table-cell;
	width: 250px;
	vertical-align: middle;
	background-color: #9993;
	padding-left: 20px;
}

.profil_wrap {
	display: table-cell;
	width: 150px;
	background-color: #9993;
	padding: 10px;
}

.profil_img {
	width: 100px;
	height: 100px;
	border: solid 5px #c0c962;
	border-radius: 90px;
	box-shadow: 2px 5px 5px #959f2c;
	float: right;
	margin-right: 20px;
	background-position : center;
	background-size:contain;
	background-repeat:no-repeat;
}

/* .profil_img img {
	transform: scale(0.85);
	width: 100px;
} */

.content-wrap {
	padding: 30px 30px;
	color: #333;
	font-family: 'YoonGothic';
	border-bottom: solid 2.5px #CCC;
}

.content-footer {
	margin-top: 40px;
	margin-bottom: 60px;
	display: flex;
	justify-content: center;
}

.heart {
	text-align: center;
}

#heart {
	color: red;
	opacity: 0.3;
	cursor: pointer;
	transform: scale(1.8, 1);
}

.heart label {
	font-size: 15pt;
	font-weight: bold;
	color: #e65700;
}

#heart:hover {
	opacity: 1;
}

.back-button {
	font-family: 'YoonGothic';
	font-size: 19px;
	font-weight: 900px;
	background: #ccc;
	width: 300px;
	cursor: pointer;
	text-align: center;
	color: white;
	padding: 17px 30px;
	border-radius: 30px;
	transition: 0.3s;
	margin-left: 10px;
}

.back-button:hover {
	background: #aaa;
}
</style>
</html>
