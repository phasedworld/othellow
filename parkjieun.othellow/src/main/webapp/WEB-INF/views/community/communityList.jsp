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
  left:-60px; top:-5px;
  text-align: center;
  background:-webkit-linear-gradient(white 0%, #aaa 100%);
  -webkit-background-clip:text;
  -webkit-text-fill-color:transparent;
  width:370px;
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
					<li><a href="../uservice/03.html" class="nav">랭킹</a></li>
					<li class="logo"><a id="logo" href="../main.html" style="font-size:75px; font-family:'Ddukkubi'">오델로<span id="w-word">W</span></a></li>
					<li><a href="02.html" class="nav">커뮤니티</a></li>
				</ul>
			</nav>
		</header>
	</div>
  <div class="header-divider"></div>
  <!--본문-->

  <div class="table-header"><FONT style="font-size:28px;">커뮤니티</FONT> | <FONT style="color:#06a545;">전체</FONT> | 공지 | 잡담 | 팬아트 </div>
  <table class="table-wrapper">
    <tr><th>제목</th><th>작성자</th><th>작성일</th><th>조회수</th>
    </tr>
    <tr style = "cursor:pointer;" onClick="location.href='03.html'">
      <td>
        <div class="subject-header"><FONT style="color:#e65700;">공지</FONT> | No.123123</div>
        <div class="subject">구체 그 자체</div>
      </td>
      <td>
        <div class="author-header"><FONT style="color:#e65700;">플레2</FONT></div>
        <div class="author">지은 the Orianna</div>
      </td>
      <td>2019-11-12</td>
      <td>234234</td>
    </tr>
    <tr style = "cursor:pointer;" onClick="location.href='04.html'">
      <td>
        <div class="subject-header"><FONT style="color:#e65700;">팬아트</FONT> | No.123123</div>
        <div class="subject">나 쫌 잘그리는듯 ㅎ</div>
      </td>
      <td>
        <div class="author-header"><FONT style="color:#e65700;">바론</FONT></div>
        <div class="author">드랍 더 HAKJUM</div>
      </td>
      <td>2019-11-12</td>
      <td>234234</td>
    </tr>
    <tr style = "cursor:pointer;" onClick="location.href='03.html'">
      <td>
        <div class="subject-header"><FONT style="color:#e65700;">공지</FONT> | No.123123</div>
        <div class="subject">구체 그 자체</div>
      </td>
      <td>
        <div class="author-header"><FONT style="color:#e65700;">플레2</FONT></div>
        <div class="author">지은 the Orianna</div>
      </td>
      <td>2019-11-12</td>
      <td>234234</td>
    </tr>
    <tr style = "cursor:pointer;" onClick="location.href='03.html'">
      <td>
        <div class="subject-header"><FONT style="color:#e65700;">공지</FONT> | No.123123</div>
        <div class="subject">구체 그 자체</div>
      </td>
      <td>
        <div class="author-header"><FONT style="color:#e65700;">플레2</FONT></div>
        <div class="author">지은 the Orianna</div>
      </td>
      <td>2019-11-12</td>
      <td>234234</td>
    </tr>
    <tr style = "cursor:pointer;" onClick="location.href='03.html'">
      <td>
        <div class="subject-header"><FONT style="color:#e65700;">공지</FONT> | No.123123</div>
        <div class="subject">구체 그 자체</div>
      </td>
      <td>
        <div class="author-header"><FONT style="color:#e65700;">플레2</FONT></div>
        <div class="author">지은 the Orianna</div>
      </td>
      <td>2019-11-12</td>
      <td>234234</td>
    </tr>
    <tr style = "cursor:pointer;" onClick="location.href='03.html'">
      <td>
        <div class="subject-header"><FONT style="color:#e65700;">공지</FONT> | No.123123</div>
        <div class="subject">구체 그 자체</div>
      </td>
      <td>
        <div class="author-header"><FONT style="color:#e65700;">플레2</FONT></div>
        <div class="author">지은 the Orianna</div>
      </td>
      <td>2019-11-12</td>
      <td>234234</td>
    </tr>
    <tr style = "cursor:pointer;" onClick="location.href='03.html'">
      <td>
        <div class="subject-header"><FONT style="color:#e65700;">공지</FONT> | No.123123</div>
        <div class="subject">구체 그 자체</div>
      </td>
      <td>
        <div class="author-header"><FONT style="color:#e65700;">플레2</FONT></div>
        <div class="author">지은 the Orianna</div>
      </td>
      <td>2019-11-12</td>
      <td>234234</td>
    </tr>
    <tr style = "cursor:pointer;" onClick="location.href='03.html'">
      <td>
        <div class="subject-header"><FONT style="color:#e65700;">공지</FONT> | No.123123</div>
        <div class="subject">구체 그 자체</div>
      </td>
      <td>
        <div class="author-header"><FONT style="color:#e65700;">플레2</FONT></div>
        <div class="author">지은 the Orianna</div>
      </td>
      <td>2019-11-12</td>
      <td>234234</td>
    </tr>
    <tr style = "cursor:pointer;" onClick="location.href='03.html'">
      <td>
        <div class="subject-header"><FONT style="color:#e65700;">공지</FONT> | No.123123</div>
        <div class="subject">구체 그 자체</div>
      </td>
      <td>
        <div class="author-header"><FONT style="color:#e65700;">플레2</FONT></div>
        <div class="author">지은 the Orianna</div>
      </td>
      <td>2019-11-12</td>
      <td>234234</td>
    </tr>
    <tr style = "cursor:pointer;" onClick="location.href='03.html'">
      <td>
        <div class="subject-header"><FONT style="color:#e65700;">공지</FONT> | No.123123</div>
        <div class="subject">구체 그 자체</div>
      </td>
      <td>
        <div class="author-header"><FONT style="color:#e65700;">플레2</FONT></div>
        <div class="author">지은 the Orianna</div>
      </td>
      <td>2019-11-12</td>
      <td>234234</td>
    </tr>
  </table>
  <!--재활용 빈도가 아주 높을 버튼 클래스들-->
  <div class="content-footer">
    <div class="write-button" style="cursor:pointer;" onClick="location.href='01.html'">글쓰기</div>
    <div>
       <ul class="paging">
          <li>&lt;</li><li class="selected">1</li><li>2</li><li>3</li><li>4</li><li>5</li><li>6</li><li>7</li><li>8</li><li>9</li><li>10</li><li>&gt;</li>
       </ul>
    </div>
    <div class="search-wrapper">
      <select><option>제목</option></select>
      <input placeholder="검색어를 입력하세요"/>
      <span class="search-button">SEARCH</span>
    </div>
  </div>

</body>
<style>
.table-header, .table-wrapper, .content-footer{
  width:1200px;
  margin:0 auto;
  border-collapse: collapse;
  font-family:'YoonGothic';
}
.table-header{
  color:#333;
  margin-top:20px;
  margin-bottom:5px;
}
.table-wrapper tr{
  border-bottom:2px solid #ccc;
  color:#333;
}
.table-wrapper th{
  border-top:2px solid #999;
  border-bottom:2px solid #999;
  height:50px;
}
.table-wrapper tr:last-child{
  border-bottom:2px solid #999;
}
.table-wrapper tr td{
  padding:10px 20px;
  font-size:18px;
}
.table-wrapper tr:hover td{
  background:#eee;
}
.table-wrapper tr td:first-child{
  width:580px;
}
.table-wrapper tr td:nth-child(2){
  width:230px;
}
.table-wrapper tr td:nth-child(3){
  width:140px; text-align:center;
}
.table-wrapper tr td:nth-child(4){
  width:140px; text-align:center; color:#e65700;
}
.subject-header, .author-header{
  font-size:15px;
  margin-bottom:3px;
}
.subject, .author{
  font-size:19px;
}
.content-footer{
  margin-top:40px;
  margin-bottom:40px;/*밑에 안보여 쉬바*/
}
.write-button{
  font-family:'YoonGothic';
  font-size:30px;
  background:#c0c962;
  box-shadow:5px 5px 0px #959f2c;
  width:300px;
  margin:0 auto;
  cursor:pointer;
  text-align:center;
  color:white;
  padding:8px 0px;
  border-radius:10px;
  margin-bottom:30px;
}
.paging{
  list-style:none;
  padding:0px;
  margin:0 auto;
  text-align:center;
}
.paging li{
  border-left:2px dotted #999;
  display:inline-block;
  padding:20px 26px;
  font-size:22px;
  color:#555;
  cursor:pointer;
}
.paging li.selected{
  color:#06a545;
}
.paging li:first-child, .paging li:nth-child(2){
  border-left:none;
}
.paging li:last-child, .paging li:first-child{
  border:1px solid #999;
  border-radius:5px;
}
.paging li:last-child:hover, .paging li:first-child:hover{
  background:#eee;
}
.search-wrapper{
  margin-top:30px;
  text-align:center;
}
.search-wrapper input{
  width:500px;
  padding:0px 10px;
  line-height:40px;
  border:none;
  font-size:18px;
  font-family:'YoonGothic';
  border:2px solid #999;
  border-radius:3px;
}
.search-wrapper .search-button{
  padding:7px 20px;
  background:#777;
  color:white;
  cursor:pointer;
  border-radius:5px;
  font-family:'YoonGothic';
  font-size:20px;
}
.search-wrapper select{
  width:160px;
  height:40px;
  border:2px solid #999;
  font-family:'YoonGothic';
  font-size:18px;
  border-radius:3px;
}
</style>
</html>
