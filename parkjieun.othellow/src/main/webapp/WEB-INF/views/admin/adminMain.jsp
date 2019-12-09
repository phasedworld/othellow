<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>오델로W</title>
<meta charset="utf-8">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<style>
@font-face{
  font-family:'Ddukkubi';
  src:url('./font/Ddukkubi.ttf');
}
@font-face{
  font-family:'NotoSansBold';
  src:url('./font/NotoSansBold.otf');
}
@font-face{
  font-family:'YoonGothic';
  src:url('./font/YoonGothic.otf');
}
body{
  margin:0;
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
  color:white;
  text-decoration:none;
  text-shadow:2px 2px 0px black;
  font-family:'NotoSansBold';
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
.header-divider{
  height:20px;
  background-image: linear-gradient(135deg, #383838 37.50%, #303030 37.50%, #303030 50%, #383838 50%, #383838 87.50%, #303030 87.50%, #303030 100%);
  background-size: 11.31px 11.31px;
}
</style>
<script>
var imgView = function(input){
	if(input.files && input.files[0]){
		var reader = new FileReader();
		reader.readAsDataURL(input.files[0]);
		reader.addEventListener('load',function(){
			$('.previewImg').attr('src',reader.result);
			$('.file-name').val(input.files[0].name);
		},false);
	}
}
function upImg(){
	var charImg = new FormData($("#charForm")[0]);
	$.ajax({
		url:'uploadchar',
		method:'post',
		data:charImg,
		processData:false,
		contentType:false,
		success:function(){
			console.log('성공적으로 이미지 업로드!');
		}
	});
}
</script>
</head>
<body>
  <div class="header-wrapper">
    <header>
        <nav>
          <ul>
			<li><a href="../uservice/RankList" class="nav">랭킹</a></li>
			<li class="logo"><a id="logo" href="../main"
				style="font-size: 75px; font-family: 'Ddukkubi'">오델로<span
					id="w-word">W</span></a></li>
			<li><a href="list" class="nav">커뮤니티</a></li>
		  </ul>
        </nav>
        <div class="header-replace">헤더 교체</div>
      </header>
  </div>
  <div class="header-divider"></div>
  <!--본문-->
  <div id="container">
    <div class="button-wrap">
      <div class="nav-btn selected">캐릭터 추가</div>
      <div class="nav-btn" onClick="location.href='02.html';">캐릭터 삭제</div>
      <div class="nav-btn" style="float:right; margin:0px;" onClick="location.href='user/logout'">로그아웃</div>
    </div>
    <div class="char-sheet">
      <div class="img-wrapper">
        preview<img class="previewImg"/>
      </div>
      <div class="char-info">
      <form id="charForm">
        <input type="text" class="char-name" name="characterName" placeholder="캐릭터 이름"/>
        <input type="text" class="file-name" name="imageLink" placeholder="디렉토리 주소" readonly/>
        <label class="upload-btn">이미지 업로드<input type="file" name="charImg" onChange="imgView(this)"></label>
        <div class="confirm-btn" onClick="upImg()">등록하기</div>
      </form>
      </div>
    </div>

  </div>
</body>
<style>
#container{
  width:1000px;
  padding:100px;
  margin:0px auto;
  margin-top:30px;
}
.nav-btn{
  display:inline-block;
  padding:5px 15px;
  border:1px solid #ccc;
  margin-right:10px;
  cursor:pointer;
}
.nav-btn.selected{
  border:1px solid #aaa;
  background:#eee;
}
.char-sheet{
  display:flex;
  margin-top:10px;
}
.img-wrapper{
  width:300px;
  height:350px;
  background:#ddd;
  display:flex;
  justify-content: center;
  align-items: center;
}
.previewImg{
  max-width:300px;
  max-height:350px;
  position:absolute;
}
.char-info{
  padding:0px 20px;
  width:660px;
}
.upload-btn{
  display:inline-block;
  text-align:center;
  background:white;
  cursor:pointer;
  color:#959f2c;
  border:2px solid #959f2c;
  border-radius: 30px;
  position:relative;
  padding:10px 0px;
  width:230px;
  margin-left:20px;
}
.upload-btn input{
  position:absolute;
  left:0px; top:0px;
  width:230px;
  opacity:0;
  line-height:48px;
  cursor:pointer;
}
input:focus{
  outline:none;
}
.char-name{
  width:640px;
  padding:8px 15px;
  font-size:19px;
  border:none;
  border-bottom:1px solid #777;
  margin-bottom:30px;
}
.file-name{
  width:350px;
  padding:8px 15px;
  font-size:19px;
  border:none;
  border-bottom:1px solid #777;
}
.confirm-btn{
  margin:0 auto;
  margin-top:130px;
  border-radius:50px;
  width:180px;
  text-align:center;
  padding:10px 50px;
  background:#c0c962;
  font-size:22px;
  cursor:pointer;
  transition:0.2s;
}
.confirm-btn:hover{
  background:#959f2c;
}
.header-replace{
  padding:5px 20px;
  position:absolute;
  right:100px;
  top:150px;
  border:1px solid #333;
  cursor:pointer;
}
.header-replace:hover{
  background:rgba(255,255,255,0.5);
}
</style>
</html>