<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
<meta charset="utf-8">
<title>오델로W</title>
<meta charset="utf-8">
<script src="//cdn.ckeditor.com/4.12.1/full/ckeditor.js"></script>
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
	font-family: 'NotoSansBold';
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

header {
	width: 1200px;
	margin: 0 auto;
	height: 200px;
	background: url("");
	background-size: cover;
	background-position: center;
}

.header-wrapper {
	background: linear-gradient(90deg, #11998e, #38ef7d);
}

#logo {
	font-style: italic;
	-webkit-text-stroke: 2px #000;
	background: -webkit-linear-gradient(white 0%, #aaa 100%);
	-webkit-background-clip: text;
	-webkit-text-fill-color: transparent;
	text-shadow: none;
	display: inline-block;
	width: 380px;
	text-align: center;
}

#w-word {
	font-style: italic;
	-webkit-text-stroke: 2px #000;
	background: -webkit-linear-gradient(rgb(10, 155, 135) 0%,
		rgb(214, 211, 20) 100%);
	display: inline-block;
	width: 120px;
	text-align: center;
	-webkit-background-clip: text;
	-webkit-text-fill-color: transparent;
	text-shadow: none;
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
					<li><a href="../uservice/03.html" class="nav">랭킹</a></li>
					<li class="logo"><a id="logo" href="../main.jsp"
						style="font-size: 75px; font-family: 'Ddukkubi'">오델로<span
							id="w-word">W</span></a></li>
					<li><a href="communityList.jsp" class="nav">커뮤니티</a></li>
				</ul>
			</nav>
		</header>
	</div>
	<div class="header-divider"></div>
	<!--본문-->
	<div class="table-header">
		<FONT style="font-size: 28px;">커뮤니티</FONT> | <FONT
			style="color: #06a545;"><a href="02.html">전체</a></FONT> | <a
			href="02.html">공지</a> | <a href="02.html">잡담</a> | <a href="02.html">팬아트</a>
	</div>
	<div class="board-wrapper">
		<div class="select-wrapper">
			<select>
				<option>잡담</option>
				<option>팬아트</option>
			</select> <input placeholder="제목을 입력하세요" value="나 쫌 잘그리는 듯ㅎ" />
		</div>
		<div class="line-div"></div>
		<div class="edit_wrapper">
			<form>
				<div class="inputArea">
					<textarea name="editor1" id="editor1" rows="10" cols="80">
						<img src="../resources/img/stone.png"><br>
        				돌 그려봤는데 좋아요 많이 눌러주세요><<br>
        				제가 생각해도 저 너무 존잘인듯..ㅠㅠ<br><br>
        				p,s 불펌 ㄴㄴ해
					</textarea>
					<script>
						CKEDITOR.replace('editor1', {
							width : '1200px',
							height : '500px',
							uploadUrl : "/image/drag",
							filebrowserUploadUrl : "/image"
						});
					</script>
				</div>
			</form>
			<img src="">
		</div>
	</div>


	<!--재활용 빈도가 아주 높을 버튼 클래스들-->
	<div class="content-footer">
		<div class="write-button" onClick="location.href='02.html'">수정하기</div>
		<div class="back-button" onClick="location.href='02.html'">목록으로</div>
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

.board-wrapper {
	width: 1200px;
	margin: 0 auto;
}

.subject-header, .author-header {
	font-size: 15px;
	margin-bottom: 3px;
}

.subject, .author {
	font-size: 19px;
}

.content-footer {
	margin-top: 40px;
	margin-bottom: 60px;
	display: flex;
	justify-content: center;
}

.write-button {
	font-family: 'YoonGothic';
	font-size: 19px;
	font-weight: 900px;
	background: #c0c962;
	width: 150px;
	cursor: pointer;
	text-align: center;
	color: white;
	padding: 17px 30px;
	border-radius: 30px;
	transition: 0.3s;
	background: #c0c962;
	margin-right: 10px;
}

.write-button:hover {
	background: #959f2c;
}

.back-button {
	font-family: 'YoonGothic';
	font-size: 19px;
	font-weight: 900px;
	background: #ccc;
	width: 150px;
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

.select-wrapper {
	margin-top: 30px;
	text-align: left;
	line-height: 80px;
}

.select-wrapper input {
	width: 1000px;
	padding: 0px 10px;
	line-height: 40px;
	border: none;
	font-size: 18px;
	font-family: 'YoonGothic';
	border-bottom: 2px solid #959f2c;
}

.select-wrapper select {
	width: 160px;
	height: 40px;
	border: 1.5px solid #3333;
	font-family: 'YoonGothic';
	font-size: 18px;
	color: #444;
}

.select-wrapper select option {
	color: #444;
}

.line-div {
	width: 1200px;
	height: 0px;
	border: 1px solid #3333;
	margin: 0 auto;
	margin-bottom: 20px;
}
</style>
</html>
