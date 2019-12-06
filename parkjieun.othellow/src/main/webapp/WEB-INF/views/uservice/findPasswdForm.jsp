<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>오델로W</title>
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
<body onLoad="startFindId()">
  <div class="header-wrapper">
    <header>
        <nav>
          <ul>
            <li><a href="../uservice/RankList" class="nav">랭킹</a></li>
            <li class="logo" style="position:relative;"><a id="logo" href="../" style="font-size:75px; font-family:'Ddukkubi'">오델로<span id="w-word">W</span></a></li>
            <li><a href="../community/list" class="nav">커뮤니티</a></li>
          </ul>
        </nav>
      </header>
  </div>
  <div class="header-divider"></div>

  <div class="title">
    <h3 class="real_title">오델로W 계정 찾기</h3>
  </div>
	<div id="find_wrap" class="find_wrap">
		<div id="change-box">
			<form name="findIdForm" action="./findId" method="POST">
				<div class="input_title">
					<div class="label">비밀번호 찾기</div>
	           		<div class="label_help">오델로W에서 사용한 Email주소와 ID를 입력해주세요.</div>
	        	</div>
	         	<div class="txt_wrap">
					<input class="txt_in" type="text" id="userEmail" name="userEmail" placeholder="이메일주소를 입력하세요." required>
	         	</div>
	         	<div id="txt_wrap2" >
					<input class="txt_in" type="text" id="userId" name="userId" placeholder="아이디를 입력하세요." required>
	         	</div>
	      		
				<div class="button_wrap">
					<button type="button" id="findBtn" >find</button>
					<button type="button" id="cancelBtn" onclick="history.go(-1);">Cancel</button>
				</div>
		</div>		
				
	         	<a class="find-id-pw" href="findIdForm">아이디를 잊어버리셨나요?</a>
			</form>		
	</div>
</body>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
<script>

</script>
<style>
.title{
  width:800px;
  margin: 0 auto;
  padding:10px;
  padding-top: 100px;
  border-bottom: 1px solid #333;
  font-size:27px;
  font-weight:bold;
}

.find_wrap{
  width:800px;
  margin: 20px auto;
}

.input_title{
  margin-left:20px;
  margin-bottom: 20px;
}

.label{
  font-size:25px;
  font-weight:500;
  margin-bottom:8px;
}

.label_help{
  font-size:15px;
  color:#999
}

.txt_wrap{
  margin-left: 20px;
  margin-top: 20px;
  margin-bottom:10px;
  border:1px solid #999;
  width: 400px;
}

#txt_wrap2{
  margin-left: 20px;
  margin-top: 10px;
  margin-bottom:50px;
  border:1px solid #999;
  width: 400px;
}

#txt_wrap-id{
  margin-bottom:20px;
}

.txt_in{
  font-size:19px;
  padding:5px 10px;
  border:none;
  width:380px;
  font-family: YoonGothic;
}
/*ajax*/
.foundId{
  margin-left: 20px;
  margin-top: 20px;
  margin-bottom:50px;
  width: 400px;
}
.button_wrap{
  margin-top:10px;
  text-align:center;
  }
#loginBtn{
  display:inline-block;
  background: #c0c962;
  width:400px;
  padding:17px 30px;
  font-size:19px;
  font-weight:900px;
  border:2px solid #c0c962;
  border-radius:30px;
  color:white;
  cursor:pointer;
  transition:0.3s;
}
#loginBtn:hover{
  background: #959f2c;
  border:2px solid #959f2c;
}
/*end ajax*/
  
#findBtn{
display:inline-block;
background: #c0c962;
width:300px;
padding:17px 30px;
font-size:19px;
font-weight:900px;
border:2px solid #c0c962;
border-radius:30px;
color:white;
cursor:pointer;
transition:0.3s;
}
#findBtn:hover{
  background: #959f2c;
  border:2px solid #959f2c;
}
#cancelBtn{
display:inline-block;
background: #ccc;
width:300px;
padding:17px 30px;
font-size:19px;
border:2px solid #ccc;
border-radius:30px;
color:white;
cursor:pointer;
transition:0.3s;
}

#cancelBtn:hover{
  background: #aaa;
  border:2px solid #aaa;
}

.find-id-pw{
  text-decoration:none;
  color:#333;
  font-size:20px;
  width:800px;
  display:inline-block;
  margin-top:40px;
  text-align:center;
}
</style>
</html>
