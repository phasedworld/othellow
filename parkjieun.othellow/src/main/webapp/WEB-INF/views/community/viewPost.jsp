<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>오델로W</title>
<meta charset="utf-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<style>
@font-face{
  font-family:'Ddukkubi';
  src:url('../resources/font/Ddukkubi.ttf');
}
@font-face{
  font-family:'NotoSansBold';
  src:url('../resources/font/NotoSansBold.otf');
}
@font-face{
  font-family:'YoonGothic';
  src:url('../resources/font/YoonGothic.otf');
}
body{
  margin:0;
  font-family:'NotoSansBold';
}
nav{
  height:180px;
}
nav ul{
  list-style: none;
  padding:0px; margin:0px;
  display:flex;
  justify-content: center;
  align-items: center;
}
nav li a{
  font-size:25px;
  color:white !important;
  text-decoration:none !important;
  text-shadow:2px 2px 0px black;
  font-family:'NotoSansBold';
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
#logo{
  font-style: italic;
  -webkit-text-stroke: 2px #000;
  background:-webkit-linear-gradient(white 0%, #aaa 100%);
  -webkit-background-clip:text;
  -webkit-text-fill-color:transparent;
  text-shadow:none;
  display:inline-block;
  width:380px;
  text-align: center;
}

#w-word{
  font-style: italic;
  -webkit-text-stroke: 2px #000;
  background:-webkit-linear-gradient(rgb(10,155,135) 0%, rgb(214,211,20) 100%);
  display:inline-block;
  width:120px;
  text-align: center;
  -webkit-background-clip:text;
  -webkit-text-fill-color:transparent;
  text-shadow:none;
}
.header-divider{
  height:20px;
  background-image: linear-gradient(135deg, #383838 37.50%, #303030 37.50%, #303030 50%, #383838 50%, #383838 87.50%, #303030 87.50%, #303030 100%);
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
            <li class="logo"><a id="logo" href="../main.html" style="font-size:75px; font-family:'Ddukkubi'">오델로<span id="w-word">W</span></a></li>
            <li><a href="02.html" class="nav">커뮤니티</a></li>
          </ul>
        </nav>
      </header>
  </div>
  <div class="header-divider"></div>

  <!--본문-->

  <div class="table-header">
		<FONT style="font-size: 28px;">커뮤니티</FONT> | <FONT
			style="color: #06a545;"><a href="02.html">전체</a></FONT> | <a href="02.html">공지</a>
		| <a href="02.html">잡담</a> | <a href="02.html">팬아트</a>
	</div>

  <div class="post-wrap">
    <div class="title">
        <div class="title-wrap">
          <div class="subject-header"><FONT style="color:#e65700;">팬아트 </FONT><FONT style="color:#666; font-size: 13pt; font-weight: bold;">| 나 쫌 잘그리는 듯ㅎ</FONT></div>
          <div class="subject-bottom"><FONT style="color:#9999;">2019-11-13 | 조회수 : 35 |</FONT><span style="color: red;" class="glyphicon glyphicon-heart" aria-hidden="true"></span><FONT style="color:#9999;"> 15</FONT></div>
        </div>
        <div class="nickname-wrap">
          <div class="ranking"><FONT style="color:#e65700;">바론</FONT></div>
          <div class="nickname"><FONT style="color:#7779; font-weight: bold;">드랍 더 HAKJUM</FONT></div>
        </div>
        <div class="profil_wrap">
          <div class="profil_img"><img src=""></div>
        </div>
    </div>
    <div class="content-wrap">
      <div class="contents">
        <img src=""><br>
        돌 그려봤는데 좋아요 많이 눌러주세요><<br>
        제가 생각해도 저 너무 존잘인듯..ㅠㅠ<br><br>
        p,s 불펌 ㄴㄴ해
      </div>
      <div class="heart">
        <div style="font-size:3em;"><span style="color: pink;" class="glyphicon glyphicon-heart" aria-hidden="true"></span></div>
        <div><label>좋아요!</label></div>
      </div>
    </div>
    <div class="content-footer">
      <div class="back-button" onClick="location.href='02.html'">목록으로</div>
    </div>
  </div>
</body>
<style>

.table-header{
  width: 1200px;
  margin: 0 auto;
  border-collapse: collapse;
  font-family:'YoonGothic';
  color:#333;
  margin-top:20px;
  margin-bottom:5px;
}

.table-header a, .table-header a:visited, .table-header a:link, .table-header a:active {
	display: inline-block;
	text-decoration: none;
	color: #333;
}

.table-header a:hover {
	color: #c0c962;
}
.post-wrap{
  width: 1200px;
  margin: 0 auto;
}

.title{
  display: table;
  border-top: solid 2.5px #CCC;
  border-bottom: solid 2.5px #CCC;
  padding-left: 30px;
}

.title-wrap{
  display: table-cell;
  width: 800px;
  vertical-align: middle;
}

.subject-header{
  margin-bottom: 5px;
}

.subject-bottom{
  margin-top: 5px;
}

.nickname-wrap{
  display: table-cell;
  width:250px;
  vertical-align: middle;
  background-color: #9993;
  padding-left: 20px;
}

.profil_wrap{
  display: table-cell;
  width:150px;
  background-color: #9993;
  padding: 10px;
}

.profil_img{
  width:100px;
  height: 100px;
  border: solid 5px #c0c962;
  border-radius: 90px;
  box-shadow: 2px 5px 5px #959f2c;
  float: right;
  margin-right: 20px;
}
.profil_img img{
  transform:scale(0.85);
  width:100px;
}
.content-wrap{
  padding: 30px 30px;
  color: #333;
  font-family: 'YoonGothic';
  border-bottom:  solid 2.5px #CCC;
}.content-footer {
	margin-top: 40px;
	margin-bottom: 60px;
	display: flex;
	justify-content: center;
}

.heart{
  text-align: center;
}

.heart img{
  position: relative;
  width:50px;
  height: 50px;
  opacity: 0.3;
	cursor: pointer;
}

.heart label{
  font-size: 15pt;
  font-weight: bold;
  color: #e65700;
}

.heart img:hover{
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
