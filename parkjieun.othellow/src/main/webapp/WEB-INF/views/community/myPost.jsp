<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>오델로W</title>
<meta charset="utf-8">
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
</head>
<body>
  <div class="header-wrapper">
    <header>
        <nav>
          <ul>
            <li><a href="../uservice/RankList" class="nav">랭킹</a></li>
            <li class="logo"><a id="logo" href="../" style="font-size:75px; font-family:'Ddukkubi'">오델로<span id="w-word">W</span></a></li>
            <li><a href="list" class="nav">커뮤니티</a></li>
          </ul>
        </nav>
      </header>
  </div>
  <div class="header-divider"></div>
  <!--본문-->

  <div class="table-header">
		<FONT style="font-size: 28px;">커뮤니티</FONT> | <FONT
			style="color: #06a545;"><a href="list">전체</a></FONT> | <a href="list">공지</a>
		| <a href="list">잡담</a> | <a href="list">팬아트</a>
	</div>

  <div class="post-wrap">
    <div class="title">
        <div class="title-wrap">
          <div class="subject-header"><FONT style="color:#e65700;">팬아트 </FONT><FONT style="color:#666; font-size: 13pt; font-weight: bold;">| 나 쫌 잘그리는 듯ㅎ</FONT></div>
          <div class="subject-bottom"><FONT style="color:#9999;">2019-11-13 | 조회수 : 35 |</FONT><FONT style="color: red; font-size: 18pt;"> ♡</FONT><FONT style="color:#9999;"> 15</FONT></div>
        </div>
        <div class="btn-wrap">
          <div class="update-button" onClick="location.href='updatePost'">수정</div>
		      <div class="delete-button" onClick="location.href='list'">삭제</div>
        </div>
    </div>
    <div class="content-wrap">
      <div class="contents">
        <img src=""><br>
        돌 그려봤는데 좋아요 많이 눌러주세요><<br>
        제가 생각해도 저 너무 존잘인듯..ㅠㅠ<br><br>
        p,s 불펌 ㄴㄴ해
      </div>
    </div>
    <div class="content-footer">
      <div class="back-button" onClick="location.href='list'">목록으로</div>
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
  height: 134px;
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

.btn-wrap{
  display: flex;
  width:400px;
  height: 67px;
  justify-content: flex-end;
  padding-left: 20px;
  align-items: center;
}

.update-button{
  font-family: 'YoonGothic';
	font-size: 15px;
	background: #ccc;
	width: 50px;
  line-height: 30px;
	cursor: pointer;
	text-align: center;
	color: white;
	border-radius: 5px;
  margin-right: 10px;
}

.delete-button{
  font-family: 'YoonGothic';
	font-size: 15px;
	background: #e65700;
	width: 50px;
  line-height: 30px;
	cursor: pointer;
	text-align: center;
	color: white;
	border-radius: 5px;
  margin-right: 30px;
}

.content-wrap{
  padding: 30px 30px;
  color: #333;
  font-family: 'YoonGothic';
  border-bottom:  solid 2.5px #CCC;
}

.content-footer {
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
