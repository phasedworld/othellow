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

<script type="text/javascript">
	var alert = function(msg, type) {
		swal({
			title : "오델로W",
			text : msg,
			type : type,
			timer : 1000,
			customClass : 'sweet-size',
			showConfirmButton : false
		});
	}

	function update() {
		if (document.update_post.title.value == "") {
			alert("제목을 입력하세요.", "warning")
		} else if (document.update_post.contents.value = "") {
			alert("내용을 입력하세요.", "warning")
		} else {
			document.update_post.submit();
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
					<li class="logo"><a id="logo" href="../"
						style="font-size: 75px; font-family: 'Ddukkubi'">오델로<span
							id="w-word">W</span></a></li>
					<li><a href="list" class="nav">커뮤니티</a></li>
				</ul>
			</nav>
		</header>
	</div>
	<div class="header-divider"></div>
	<!--본문-->
	<div class="table-header">
		<FONT style="font-size: 28px;">커뮤니티</FONT>
	</div>
	<form name="update_post" id="update_post" action="../updatePost"
		method="post">
		<input type="hidden" name="seq" value="${community.seq }">
		<div class="board-wrapper">
			<div class="select-wrapper">
				<select id="sort" name="sort">
					<option value="chat">잡담</option>
					<option value="art">팬아트</option>
				</select> <input name='title' placeholder="제목을 입력하세요"
					value='${community.title }' >
			</div>
			<div class="line-div"></div>
			<input type="hidden" name="image" value=""/>
			<div class="edit_wrapper">
				<form>
					<div class="inputArea">
						<textarea name="contents" id="contents" rows="10" cols="80">
						${community.contents }
					</textarea>
						<script>
							CKEDITOR.replace('contents', {
								width : '1200px',
								height : '500px',
								uploadUrl : "/image/drag",
								filebrowserUploadUrl : "/image"
							});
						</script>
						
					</div>
				</form>
	</form>
	</div>
	</div>


	<!--재활용 빈도가 아주 높을 버튼 클래스들-->
	<div class="content-footer">
		<div class="write-button" onClick="update()">수정하기</div>
		<div class="back-button" onClick="location.href='../list'">목록으로</div>
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