<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>오델로W</title>
<meta charset=UTF-8">
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
	function communityList(){
		$.ajax({
			url : "communityList",
			method : "get",
			success : function(result){
				$("tbody").empty();
				$(result).each(
						function(idx){
							$("tbody").append(
									'<tr style = "cursor:pointer;" onClick="location.href="#"> <td>'
									+ '<div class="subject-header"><font style="color:#e65700;">' + result[idx].sort
									+ '</font> | No.' + result[idx].seq + '</div><div class="subject">'
									+ result[idx].title + '</div></td>'
									+ '<td> <div class="author-header"><font style="color:#e65700;">'
									+ result[idx].userRank + '</font></div>'
									+ '<div class="author">' + result[idx].userNickname + '</div></td>'
									+ '<td>' + result[idx].regDate + '</td>'
									+ '<td>' + result[idx].hitCount + '</td></tr>'
									);
						});
			},
			error : function(a, b, errMsg){
				alert('리스트 출력 실패' + errMsg);
			}
		})
	}
	function informList(){
		$.ajax({
			url : "communityList",
			method : "get",
			success : function(result){
				$("tbody").empty();
				$(result).each(
						function(idx){
							$("tbody").append(
									'<tr style = "cursor:pointer;" onClick="location.href="#"> <td>'
									+ '<div class="subject-header"><font style="color:#e65700;">' + result[idx].sort
									+ '</font> | No.' + result[idx].seq + '</div><div class="subject">'
									+ result[idx].title + '</div></td>'
									+ '<td> <div class="author-header"><font style="color:#e65700;">'
									+ result[idx].userRank + '</font></div>'
									+ '<div class="author">' + result[idx].userNickname + '</div></td>'
									+ '<td>' + result[idx].regDate + '</td>'
									+ '<td>' + result[idx].hitCount + '</td></tr>'
									);
						});
			},
			error : function(a, b, errMsg){
				alert('리스트 출력 실패' + errMsg);
			}
		})
	}
	window.onload=function(){
		communityList();
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
					<li><a href='list' class="nav">커뮤니티</a></li>
				</ul>
			</nav>
		</header>
	</div>
  <div class="header-divider"></div>
  <!--본문-->

  <div class="table-header"><FONT style="font-size:28px;">커뮤니티</FONT> | 
  <a href="list"><FONT style="color:#06a545;">전체</FONT></a> | 
  <a onClick="informList();">공지</a> | <a onClick="chatList();">잡담</a> | <a onClick="artList();">팬아트 </a></div>
  <table class="table-wrapper">
  <thead>
    <tr>
    	<th>제목</th>
    	<th>작성자</th>
    	<th>작성일</th>
    	<th>조회수</th>
    </tr>
    </thead>
    <tbody id='communityList'>
    </tbody>
  </table>
  <!--재활용 빈도가 아주 높을 버튼 클래스들-->
  <div class="content-footer">
    <div class="write-button" style="cursor:pointer;" onClick="location.href='insertPost'">글쓰기</div>
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
