<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>오델로W</title>
<meta charset="utf-8">
<script src="//code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<style>
@font-face{
  font-family:'Ddukkubi';
  src:url('../font/Ddukkubi.ttf');
}
@font-face{
  font-family:'NotoSansBold';
  src:url('../font/NotoSansBold.otf');
}
@font-face{
  font-family:'YoonGothic';
  src:url('../font/YoonGothic.otf');
}
body{
  margin:0;
  font-family:'NotoSansBold';
}
header{
  width:1200px;
  margin:0 auto;
  height:200px;
  background:url('');
  background-size:cover;
  background-position: center;
  background-image: url('../img/headerImg.png');
}
.header-wrapper{
  background: black;
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
            <li class="logo"><a id="logo" href="../" style="font-size:75px; font-family:'Ddukkubi'">오델로<span id="w-word">W</span></a></li>
            <li><a href="../community/01.html" class="nav">커뮤니티</a></li>
          </ul>
        </nav>
      </header>
  </div>
  <div class="header-divider"></div>
  <!--본문-->
  <div id="container">
  <form id="signupForm">
    <div class="main-msg">생성할 오델로W 계정 정보를 입력해주세요.</div>

    <div class="input-help">계정 아이디 (영문+숫자, 6~12자 이내)</div>
    <div class="input-wrap">
      <input type="text" class="input-text" name="userId" id="userId" onChange="idVerify()" placeholder="아이디를 입력해주세요" required/>
      <span class="input-liner"></span>
    </div>
    <div id="id-msg" class="confirmmsg"></div>

    <div class="input-help">당신의 캐릭터를 선택하세요!</div>
    <div class="character-wrap">
      <!-- <div class="character-img" style="background-image:url(\"\");" onClick="chooseImg(1)"></div>
      <div class="character-img" style="background-image:url(\"\");" onClick="chooseImg(2)"></div>
      <div class="character-img" style="background-image:url(\"\");" onClick="chooseImg(3)"></div> -->
      <c:forEach var="cha" items="${character}">
      <div class="character-img" style="background-image:url(../img/${cha.imageLink});" onClick="chooseImg(${cha.characterNo})"></div>
      </c:forEach>
      <input type="hidden" name="characterNo" id="userPic"/>
    </div>

    <div class="input-help">닉네임</div>
    <div class="input-wrap">
      <input type="text" class="input-text" name="userNickname" id="userNickname" onChange="nicknameVerify()" placeholder="닉네임을 입력해주세요" required/>
      <span class="input-liner"></span>
    </div>
    <div id="nickname-msg" class="confirmmsg"></div>

    <div class="input-help">비밀번호 (8~20자 이내)</div>
    <div class="input-wrap">
      <input type="password" class="input-text" name="userPassword" id="userPassword" onKeyup="passwordVerify()" placeholder="비밀번호" required/>
      <span class="input-liner"></span>
    </div>
    <div class="input-wrap">
      <input type="password" class="input-text" name="passwordConfig" id="passwordConfig" onKeyup="passwordVerify()" placeholder="비밀번호 재입력" required/>
      <span class="input-liner"></span>
    </div>
    <div id="pwre-msg" class="confirmmsg">비밀번호를 입력해주세요</div>

    <div class="input-help">이메일</div>
    <div class="input-wrap">
      <input type="text" class="input-text" name="userEmail" id="userEmail" placeholder="이메일 주소 입력" required/>
      <span class="input-liner"></span>
    </div>
    <div class="email-confirmwrap">
      <input type="email" id="email-authnum" name="email-authnum" placeholder="인증번호 5자리" onChange="emailAuth()"><div class="email-confirmbtn" onClick="sendEmail()">이메일 전송</div>
    </div>
	<div id="email-msg" class="confirmmsg">이메일 인증을 받아주세요</div>
    <div class="button-wrapper">
      <div class="write-button" onClick="addUser()">회원가입</div>
    </div>
	</form>
  </div>
  
</body>
<script>
var idDuplicate = 1;
var nickDuplicate = 1;
var passVerify = 1;
var emailVerify = 1;
var matchEng = /[a-z|A-Z]/;
var matchNum = /[0-9]/;

var alert = function(msg, type){
	swal({
		title:'',
		text:msg,
		icon:type,
		timer:1000,
		customClass:'sweet-size',
		showConfirmButton:false
	});
}

function chooseImg(num){
	$('#userPic').val(num);
}

function idVerify(){
	if($('#userId').val().length<6 || $('#userId').val().length>13){
		$('#id-msg').text('아이디는 6자 이상 12자 이하여야합니다');
		$('#id-msg').css('color','#e74c3c');
		idDuplicate = 1;
	}
	
	else if(!$('#userId').val().match(matchEng)||!$('#userId').val().match(matchNum)){
		$('#id-msg').text('아이디는 영어와 숫자를 모두 포함해야 합니다');
		$('#id-msg').css('color','#e74c3c');
		idDuplicate = 1;
	}
	else{
		$.ajax({
			method:"GET",
			url:"idVerify",
			data:{userId:$('#userId').val()},
			success:function(data){
				if(data==0){
					$('#id-msg').text('사용 가능한 아이디입니다');
					$('#id-msg').css('color','#06a545');
					idDuplicate = 0;
				}else{
					$('#id-msg').text('이미 존재하는 아이디입니다');
					$('#id-msg').css('color','#e74c3c');
					idDuplicate = 1;
				}
			}
		});
	}
}

function nicknameVerify(){
	$.ajax({
		method:"GET",
		url:"nicknameVerify",
		data:{userNickname:$('#userNickname').val()},
		success:function(data){
			if(data==0){
				$('#nickname-msg').text('사용 가능한 닉네임입니다');
				$('#nickname-msg').css('color','#06a545');
				nickDuplicate = 0;
			}else{
				$('#nickname-msg').text('이미 존재하는 닉네임입니다');
				$('#nickname-msg').css('color','#e74c3c');
				nickDuplicate = 1;
			}
		}
	});
}
function passwordVerify(){
	if($('#userPassword').val().length<8||$('#userPassword').val().length>20){
		$('#pwre-msg').text('비밀번호는 8자 이상 20자 이하여야 합니다');
		$('#pwre-msg').css('color','#e74c3c');
		passVerify = 1;
	}
	else if($('#userPassword').val()!=$('#passwordConfig').val()){
		$('#pwre-msg').text('비밀번호가 일치하지 않습니다');
		$('#pwre-msg').css('color','#e74c3c');
		passVerify = 1;
	}else{
		$('#pwre-msg').text('비밀번호가 일치합니다');
		$('#pwre-msg').css('color','#06a545');
		passVerify = 0;
	}
}

function sendEmail(){
	$('#email-msg').text('이메일을 보내는 중...');
	$.ajax({
		method:"GET",
		url:"emailAuth",
		data:{email:$('#userEmail').val()},
		success:function(){
			$('#email-authnum').css('display','inline-block');
			$('#email-msg').text('이메일을 보냈습니다. 이메일을 확인해주세요');
			emailVerify = 1;
		}
	});
}

function emailAuth(){
	
	$.ajax({
		method:"GET",
		url:"emailVerify",
		data:{auth:$('#email-authnum').val()},
		success:function(data){
			if(data==0){
				$('#email-msg').text('성공적으로 이메일을 인증했습니다');
				$('#email-msg').css('color','#06a545');
				emailVerify = 0;
			}else{
				$('#email-msg').text('이메일 인증에 실패했습니다. 인증 코드를 다시 한번 확인해주세요');
				$('#email-msg').css('color','#e74c3c');
				emailVerify = 1;
			}
		}
	});
	
}

function addUser(){
	//value에 대한 검증
	if(idDuplicate == 1){
		alert('검증된 아이디를 사용하세요','warning');
	}else if (nickDuplicate == 1){
		alert('검증된 닉네임을 사용하세요','warning');
	}else if (passVerify ==1){
		alert('비밀번호와 비밀번호 확인값이 다릅니다','warning');
	}else if($('#userPic').val()==""){
		alert('당신을 표현할 캐릭터를 골라주세요','warning');
	}else if(emailVerify == 1){
		alert('이메일 검증이 필요합니다','warning');
	}else{
		$.ajax({
			method:"GET",
			url:"addUser",
			data:$('#signupForm').serialize(),
			success:function(){
				location.href="../";
			}
		});
	}
}
</script>
<style>
.mainbar{/*임시방편으로 로그인바를 올리는거야!*/
  top:15%;
}
#container{
  width:800px;
  margin:0 auto;
  font-family:'YoonGothic';
  padding:100px;
}
.main-msg{
  text-align:center;
  font-size:27px;
  font-weight:bold;
  margin-bottom:90px;
}
.input-help{
  font-size:21px;
  font-weight:500;
  margin-top:40px;
  margin-bottom:8px;
}
.input-wrap{
  position:relative;
  margin-bottom:10px;
}
.input-text{
  width:800px;
  font-family:'YoonGothic';
  font-size:19px;
  padding:5px 10px;
  border:none;
}
.input-liner{
  position:absolute;
  bottom:0px;
  display:inline-block;
  width:800px;
  height:2px;
  background:#ddd;
}
.input-text:focus{
  outline:none;
}
/* 메시지의 종류에 따라
javascript의 classList.add() 또는 jQuery의 addClass() 메소드를
적절히 사용하여 css 컨트롤하길 바랍니다. */
.confirmmsg.success{
  color:#06a545;
}
.confirmmsg.failed{
  color:#e74c3c;
}
.button-wrapper{
  margin-top:150px;
}

.email-confirmwrap{
  float:right;
}
#email-authnum{
  display:none;
  width:150px;
  font-family:'YoonGothic';
  font-size:19px;
  padding:5px 10px;
  border:none;
  border-bottom:2px solid #ddd;
  margin-right:20px;
}
#email-authnum:focus{
  outline:none;
}
.email-confirmbtn{
  display:inline-block;
  padding:17px 30px;
  font-size:19px;
  border:2px solid #aaa;
  border-radius:30px;
  color:#aaa;
  cursor:pointer;
}

.email-confirmbtn:hover{
  background:#fafafa;
}

.character-wrap{
  display:block;
  perspective: 600px;
  perspective-origin: center;
  transform-origin:right;
  width:700px;
  padding:50px;
  white-space:nowrap;
  overflow:hidden;
}

.character-img{
  background:#eee;
  width:255px;
  height:300px;
  display:inline-block;
  position:relative;
  z-index:1;
  margin:0px -60px;
  background-position:center;
  background-size:contain;
  background-repeat: no-repeat;
  transition:0.5s ease;
}

.character-img.selected{
  box-shadow:0px 0px 8px #3498db;
  background-color:white;
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

</style>
<script>
var selImg = 0;
showCharImg();
$('.character-img').on("click",function(){
  selImg = $(this).index();
  $('.character-wrap').css('background-position','70px');
  showCharImg();
});

function showCharImg(){
  for(var i=0;i<${character.size()};i++){
    $('.character-img').eq(i).css('transform','translateX('+(-(selImg-2)*140)+'px) scale(0.9) rotateY('+(selImg-i)*40+'deg)');
    $('.character-img').eq(i).css('z-index',${character.size()}-Math.abs(selImg-i));
  }
  $('.character-img').removeClass('selected');
  $('.character-img').eq(selImg).addClass('selected');
  $('.character-img').eq(selImg).css('transform','translateX('+-(selImg-2)*140+'px) scale(1.2) rotateY(0deg)');
}

</script>
</html>