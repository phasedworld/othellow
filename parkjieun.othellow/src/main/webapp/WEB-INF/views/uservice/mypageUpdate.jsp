<%@page import="parkjieun.othellow.user.domain.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
   User user = (User) session.getAttribute("user");
%>

<!DOCTYPE html>
<html>
<head>
<title>오델로W</title>
<meta charset=UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1'>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
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

header {
   width: 1200px;
   margin: 0 auto;
   height: 200px;
   background-size: cover;
   background-position: center;
   background-image: url('../img/headerImg.png');
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
<style>
.container {
   width: 800px;
   height: 1200px;
   margin: 0 auto;
   font-family: 'YoonGothic';
}

a {
   font-size: 20px;
   color: black;
   text-decoration: none;
   font-family: 'YoonGothic';
}

.menu_div {
   display: flex;
   justify-content: space-around;
   align-items: center;
   height: 150px;
}

.menu {
   width: 300px;
   height: 40px;
   text-align: center;
   padding-top: 20px;
}

.line1 {
   height: 4px;
   background: #ddd;
   width: 100%;
   margin-top: 20px;
   transition: 0.3s;
}

.menu:hover .line1 {
   background: #c0c962;
}

.line2 {
   height: 4px;
   background: black;
   width: 100%;
}

#out_infomation {
   display: flex;
   align-items: center;
}

.mypage {
   width: 800px;
   height: 450px;
   display: flex;
   flex-direction: column;
}

.mypage_list {
   width: 100% line-height:1.5;
   font-size: 14px;
   border: collapse;
   table-layout: fixed;
}

.mypage_list tr {
   display: table-row;
}

.mypage_list th {
   font-weight: normal;
   vertical-align: top;
}

.mypage_list th, td {
   height: auto;
   padding: 15px 0;
   box-sizing: border-box;
   border-top: 1px solid #f1f1f1;
   border-bottom: none;
   font-size: 14px;
   text-align: left;
}

.btn_box1 {
   display: flex;
   height: 40px;
   width: 280px;
   align-items: center;
   justify-content: space-around;
}

.btn_box2 {
   display: flex;
   height: 40px;
   width: 200px;
   align-items: center;
   justify-content: space-around;
   padding: 20px 0 0 0;
}

.n-btn {
   margin: -5px 0;
   width: 100px;
   text-align: center;
   border: 1px solid #e5e5e5;
   background-color: #ffffff;
   color: #000000;
   height: 32px;
   line-height: 33px;
   cursor: pointer;
}

.n-btn2 {
   margin: -5px 0;
   width: 70px;
   text-align: center;
   color: #000000;
   height: 32px;
   line-height: 33px;
   border: 1px solid #e5e5e5;
   cursor: pointer;
}

.n-btn:hover {
   border: 2px solid #c0c962;
}

.n-btn2:hover {
   border: 2px solid #c0c962;
}

.submit_btn {
   background: #c0c962;
   color: #ffffff;
   margin: -5px 0;
   width: 70px;
   text-align: center;
   height: 32px;
   line-height: 33px;
   border: 1px solid #e5e5e5;
   cursor: pointer;
}

.mypage_Img {
   border: 3px solid #f1f1f1;
   width: 100px;
   height: 100px;
   text-align: center;
   display: flex;
   background-image: url('../img/${imageLink}');
   background-size: contain;
   background-position: center;
   background-repeat: no-repeat;
}

#char {
   align-items: center;
   margin: auto;
}

.pp {
   margin-top: 5px;
   font-style: normal;
   border-top: 1px solid gray;
}

.pp p {
   margin: auto;
   padding-top: 15px;
   font-size: 14px;
}

.input {
   padding: 5px 0 5px 0;
}

.input input {
   height: 27px;
}

.confirm-input input {
   height: 27px;
}

.input_txt {
   width: 180px;
}

.n-input {
   width: 100%;
}

#input-box_email {
   width: 250px;
}

#change-email-area p {
   color: #ccc;
}

#show-modal.open {
   display: block;
}

#show-modal {
   display: none;
   position: fixed;
   left: 0;
   top: 0;
   width: 100%;
   height: 100%;
   background-color: rgba(0, 0, 0, 0.5);
   opacity: 1;
}

#modal-content {
   position: absolute;
   top: 50%;
   left: 50%;
   transform: translate(-50%, -50%);
   background-color: white;
   padding: 1rem 1.5rem;
   width: 600px; height : 550px;
   border-radius: 0.5rem;
   height: 550px;
}

#close-button {
   float: right;
   width: 1.5rem;
   line-height: 1.5rem;
   text-align: center;
   cursor: pointer;
   border-radius: 0.25rem;
   background-color: lightgray;
}

.character-wrap {
   display: flex;
   justify-content: space-around;
   height: 330px;
   padding: 0px 0 30px 0;
}

.character-img {
   background: #eee;
   width: 255px;
   height: 300px;
   z-index: 1;
   cursor: pointer;
}

.character-img.selected {
   box-shadow: 0px 0px 8px #3498db;
   background-color: white;
}

#picture_select_txt {
   text-align: center;
}

#pic_submit {
   cursor:pointer;
   margin: 0 auto;
   width: 150px;
   height: 50px;
   border-radius: 0.5rem;
   background: #c0c962;
}

#userPic_input {
   width: 100%;
   height: 100px;
   display: flex;
   align-items: center;
}

.confirmmsg.success {
   color: #06a545;
}

.confirmmsg.failed {
   color: #e74c3c;
}

.confirmmsg {
   margin: 10px 0 0 10px;
   width: 300px;
}

.confirm-input {
   padding: 5px 0 5px 0;
   display: flex;
   align-items: center;
}

.pic_select_btn {
   font-size: 80px;
   display: flex;
   justify-content: space-around;
   align-items: center;
   color: #3498db;
   cursor: pointer;
}

.picture-box {
   position: absolute;
   left: 50%;
   transform: translateX(-50%);
}

.character-wrap li {
   list-style: none;
}
#back_bt:hover{
   opacity: 0.5;
}
#next_bt:hover{
   opacity: 0.5;
}
#change-passwd-area.open {display: block;}
#change-passwd-area {display: none;}
#passwd-area.exit {display: none;}
#passwd-btn.exit {display: none;}

#change-nickname-area.open {display: block;}
#change-nickname-area {display: none;}
#nickname-area.exit {display: none;}
#nickname-btn.exit {display: none;}

#change-email-area.open {display: block;}
#change-email-area {display: none;}
#email-area.exit {display: none;}
#email-btn.exit {display: none;}

#add-pic-area.open {display: block;}
#add-pic-area {display: none;}
#pic-btn.exit {display: none;}

</style>
</head>
<script>
   function pic_upload_btn() {
      document.getElementById('show-modal').classList.toggle('open');
      load();
      document.getElementById('characterForm').reset();
   }
   function pic_change_btn_click() {
      document.getElementById('add-pic-area').classList.toggle('open');
      document.getElementById('pic-btn').classList.toggle('exit');
   }
   function passwd_change_btn_click() {
      //div를 display: none으로 , innerHtml를 display:none취소
      document.getElementById('change-passwd-area').classList.toggle('open');
      document.getElementById('passwd-area').classList.toggle('exit');
      document.getElementById('passwd-btn').classList.toggle('exit');
      document.getElementById('passwordForm').reset();
      $('#pwre-msg1').text(''); 
      $('#pwre-msg2').text('');
   }
   function nickname_change_btn_click() {
      //div를 display: none으로 , innerHtml를 display:none취소
      document.getElementById('change-nickname-area').classList.toggle('open');
      document.getElementById('nickname-area').classList.toggle('exit');
      document.getElementById('nickname-btn').classList.toggle('exit');
      document.getElementById("nicknameForm").reset();
      $('#nickname-msg').text('');
   }
   function email_change_btn_click() {
      //div를 display: none으로 , innerHtml를 display:none취소
      document.getElementById('change-email-area').classList.toggle('open');
      document.getElementById('email-area').classList.toggle('exit');
      document.getElementById('email-btn').classList.toggle('exit');
      document.getElementById("emailForm").reset();
      $('#email-msg').text('');
   }
   
</script>
<script type="text/javascript">
   var nickDuplicate = 1;
   var passVerify = 1;
   var emailVerify = 1;
   var picVerify = 1;
   var alert = function(msg, type){
	   swal({
	      title:'',
	      text:msg,
	      icon:type,
	      timer:3000,
	      customClass:'sweet-size',
	      showConfirmButton:false
	   });
	}
   function passwordVerify(){
      $.ajax({
         method : "GET",
         url : "passwordVerify",
         data : {
            userId: '<%=user.getUserId()%>',
            userPassword : $('#userPassword').val()
         },
         success : function() {
            if (data == 1) {
               $('#pwre-msg1').text('비밀번호가 다릅니다');
               $('#pwre-msg1').css('color','#e74c3c');
               passVerify = 1;
            } else {
               $('#pwre-msg1').text('비밀번호가 일치합니다');
               $('#pwre-msg1').css('color','#06a545');
               passVerify = 0;
            }
         }
      });
   }
   function newPasswordConfig() {
      if($('#newPassword').val().length<8||$('#newPassword').val().length>20){
         $('#pwre-msg2').text('비밀번호는 8자 이상 20자 이하여야 합니다');
         $('#pwre-msg2').css('color','#e74c3c');
         passVerify = 1;
      }else if($('#newPassword').val()!=$('#passwordConfig').val()){
         $('#pwre-msg2').text('비밀번호가 일치하지 않습니다');
         $('#pwre-msg2').css('color','#e74c3c');
         passVerify = 1;
      }else{
         $('#pwre-msg2').text('정상 비밀번호입니다');
         $('#pwre-msg2').css('color','#06a545');
         passVerify = 0;
      }
   }
   
   function passwordUpdate() {
      if(passVerify==1){
         alert('비밀번호와 비밀번호 확인값이 다릅니다', 'error');
      }else if(passVerify==0){
         var newPw = '';
         newPw= {"userId":"<%=user.getUserId()%>",  "userPassword": $('#newPassword').val() }
         $.ajax({
            method:"GET",
            url:"passwordUpdate",
            data:newPw,
            success:function (){
               alert('비밀번호 변경확인', 'success');
               setTimeout(function(){
           		location.reload();
           		},1500);
            }
         });
      }
   }
   function nicknameVerify() {
      $.ajax({
         method : "GET",
         url : "nicknameVerify",
         data : {
            userNickname : $('#userNickname').val()
         },
         success : function(data) {
            if (data == 0) {
               $('#nickname-msg').text('사용 가능한 닉네임입니다');
               $('#nickname-msg').css('color', '#06a545');
               nickDuplicate = 0;
            } else {
               $('#nickname-msg').text('이미 존재하는 닉네임입니다');
               $('#nickname-msg').css('color', '#e74c3c');
               nickDuplicate = 1;
            }
         }
      });
   }
   function nicknameUpdate() {
      if(nickDuplicate == 1){
         alert('이미 사용중인 닉네임입니다', 'error');
      }else if(nickDuplicate == 0){
         var newNick = '';
         newNick ={"userId": "<%=user.getUserId()%>", "userNickname": $('#userNickname').val()}
         $.ajax({
            method:"GET",
            url:"nicknameUpdate",
            data:newNick,
            success:function(){
            	alert('닉네임 변경확인', 'success');
            	nickname_change_btn_click();
            	setTimeout(function(){
            		location.reload();
            		},1500);
            }
         });
      }
   }

   function sendEmail() {
      $('#email-msg').text('이메일을 보내는 중...');
      $.ajax({
         method:"GET",
         url:"../user/emailAuth",
         data:{email:$('#userEmail').val()},
         success : function() {
            $('#email-msg').text('이메일을 보냈습니다. 이메일을 확인해주세요');
            emailVerify = 1;
         },error: function(){
            $('#email-msg').text('이메일이 전송되지 않았습니다');
            emailVerify = 0;
         }
      });
   }
   function emailAuth(){
      $.ajax({
         method:"GET",
         url:"../user/emailVerify",
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
   function emailUpdate(){
      if(emailVerify == 1){
         alert('이메일 검증이 필요합니다', 'error');
      }else{
         var newMail = '';
         newMail ={"userId":"<%=user.getUserId()%>", "userEmail": $('#userEmail').val()}
         $.ajax({
            method:"GET",
            url:"emailUpdate",
            data:newMail,
            success:function(){
               alert('이메일 변경확인', 'success');
               setTimeout(function(){
           		location.reload();
           		},1500);
            }
         });
      }
   }
   
   function characterUpdate(){
         var newPic = '';
         newPic ={"userId":"<%=user.getUserId()%>", "characterNo": $('#userPic').val()}
         $.ajax({
            method:"GET",
            url:"characterUpdate",
            data:newPic,
            success:function(){
               alert('캐릭터 변경확인','success');
               setTimeout(function(){
           		location.reload();
           		},2500);
            }
         });
   }
   
</script>
<script>
var slideIndex = 0;
var chaSize = ${character.size()}; 
var chaNo = new Array();
for(var i=0;i<chaSize;i++){
<c:forEach var="cha" items="${character}">
	chaNo.push('${cha.characterNo}');
</c:forEach>
}

console.log(chaSize);	//4
console.log(chaNo[0]);	//1	
console.log(chaNo[1]);	//2
console.log(chaNo[2]);	//4
console.log(document.getElementsByClassName("character-img"))
function load(){ 
	slideIndex = <%=user.getCharacterNo()%>;
	var x = document.getElementsByClassName("character-img");	
	for(i=0; i<x.length; i++){
		x[i].style.display="none";
	}
	x[slideIndex-1].style.display="block";
	$('#userPic').val(x[slideIndex-1].id);
}

function plusDivs(n) {
   showDivs(slideIndex += n);
}
function showDivs(n) {
	var i;
	var x = document.getElementsByClassName("character-img");
	if(n>chaSize){slideIndex = 1;}
	if (n < 1) {slideIndex = chaSize;};
	for (i = 0; i <chaSize; i++) {
	   x[i].style.display = "none";
	}
	x[slideIndex-1].style.display = "block";
	
	$('#userPic').val(x[slideIndex-1].id);
}
</script>
<body onload="load();">
   <div class="header-wrapper">
      <header>
         <nav>
            <ul>
               <li><a href="../uservice/RankList" class="nav">랭킹</a></li>
               <li class="logo"><a id="logo" href="../"
                  style="font-size: 75px; font-family: 'Ddukkubi'">오델로<span
                     id="w-word">W</span></a></li>
               <li><a href='../community/list' class="nav">커뮤니티</a></li>
            </ul>
         </nav>
      </header>
   </div>
   <div class="header-divider"></div>
   <div class="container">
      <%
         if (session.getAttribute("user") == null) {
      %>
      <p>404 : 로그인이 되어 있지 않습니다.</p>
      <%
         } else {
      %>
      <div class="menu_div">
         <div class="menu">
            <a href="mypageRank">내 랭킹 조회</a>
            <div class="line1"></div>
         </div>
         <div class="menu">
            <a href="mypageUpdate">회원 정보 수정</a>
            <div class="line1"></div>
         </div>
      </div>

      <div id="out_infomation">
         <h2>기존 회원정보</h2>
      </div>
      <div class="line2"></div>
      <div class="mypage">
         <table class="mypage_list">
            <colgroup>
               <col style="width: 20%;">
               <col style="width: 60%">
               <col style="width: 20%">
            </colgroup>
            <tbody>

               <tr>
                  <th>사진</th>
                  <td>
                     <div class="mypage_Img"></div>
                     <div id="add-pic-area">
                        <p>
                           회원님을 알릴 수 있는 사진을 등록해 주세요.<br>등록된 사진은 회원님의 게시물이나 댓글에 사용됩니다.
                        </p>
                        <div class="btn_box1">
                           <div class="n-btn" onclick="pic_change_btn_click()">원래대로</div>
                           <div class="n-btn" onclick="pic_upload_btn()">사진 업로드</div>
                        </div>
                     </div>
                  </td>
                  <form id="characterForm">
                  <!-- 띄우는 창 -->
                  <div id="show-modal">
                     <div id="modal-content">
                        <span id="close-button" onclick="pic_upload_btn()">&times;</span>
                        <div id="picture_select_txt">
                           <h2>사진을 선택해 주세요</h2>
                        </div>
                        <div class="character-wrap">
                           <span onclick="plusDivs(-1)" class="pic_select_btn"
                              id="back_bt">&#10094;</span>
                           <ul>
                              <c:forEach var="cha" items="${character}">
                               <li class="picture-box">
                                    <div class="character-img"
                                       style="background-image:url(../img/${cha.imageLink});"
                                      id="${cha.characterNo}"></div>
                                 </li>
                              </c:forEach>
                              
                             
                           </ul>
                           <span onclick="plusDivs(+1)" class="pic_select_btn"
                              id="next_bt">&#10095;</span>
                        </div>
                        <div id="userPic_input">
                           <input type="submit" name="characterNo" class="n-btn2"
                              id="pic_submit" value="수정" onclick="characterUpdate()"/>
                              <input type="text" name="characterNo" id="userPic" value="${sessionScope.user.characterNo}"/>
                        </div>
                     </div>
                  </div>
				</form>
                  <td>

                     <div class="n-btn" id="pic-btn" onclick="pic_change_btn_click()">사진
                        변경</div>
                  </td>
               </tr>
               <tr>
                  <th>아이디</th>
                  <td><strong>${user.userId}</strong></td>
                  <td></td>
               </tr>
               <tr>
                  <th>비밀번호</th>
                  <td>
                     <div id="passwd-area">
                        <strong>******</strong>
                     </div>
                     <form id="passwordForm">
                        <div id="change-passwd-area">
                           <div class="input">
                              <div class="input_txt">현재 비밀번호</div>
                              <input type="password" id="userPassword" name="userPassword"
                                 onKeyup="passwordVerify()">
                              <div id="pwre-msg1" class="confirmmsg"></div>
                           </div>
                           <div class="input">
                              <div class="input_txt">신규 비밀번호</div>
                              <input type="password" id="newPassword" name="newPassword"
                                 onKeyup="newPasswordConfig()">
                           </div>
                           <div class="input">
                              <div class="input_txt">신규 비밀번호 재입력</div>
                              <input type="password" id="passwordConfig"
                                 name="passwordConfig" onKeyup="newPasswordConfig()">
                              <div id="pwre-msg2" class="confirmmsg"></div>
                           </div>
                           <div class="btn_box2">
                              <div class="n-btn2" onclick="passwd_change_btn_click()">취소</div>
                              <div class="submit_btn" onclick="passwordUpdate()">완료</div>
                           </div>
                        </div>
                     </form>
                  </td>
                  <td>
                     <div class="n-btn" id="passwd-btn"
                        onclick="passwd_change_btn_click()">비밀번호 변경</div>
                  </td>
               </tr>
               <tr>

                  <th>닉네임</th>
                  <td>
                     <div id="nickname-area">
                        <strong>${user.userNickname}</strong>
                     </div>
                     <form id="nicknameForm">
                        <div id="change-nickname-area">
                           <div class="input">
                              <input type="text" name="userNickname" id="userNickname"
                                 onchange="nicknameVerify()" placeholder="닉네임을 입력해주세요"
                                 required>
                              <div id="nickname-msg" class="confirmmsg"></div>
                           </div>
                           <div class="btn_box2">
                              <div class="n-btn2" onclick="nickname_change_btn_click()">취소</div>
                              <div class="submit_btn" onclick="nicknameUpdate()">변경</div>
                           </div>
                        </div>
                     </form>
                  </td>
                  <td><div class="n-btn" id="nickname-btn"
                        onclick="nickname_change_btn_click()">닉네임 변경</div></td>

               </tr>
               <tr>
                  <th>이메일</th>
                  <td><div id="email-area">
                        <strong>${user.userEmail}</strong>
                     </div>
                     <form id="emailForm">
                        <div id="change-email-area">
                           <p>
                              -회원님의 이메일로 이메일인증번호가 적힌 메일이 발송됩니다. <br>
                           </p>
                           <p>-아래에 인증번호를 입력하시면 인증이 완료됩니다.</p>
                           <p></p>
                           <div id="input-box_email">
                              <div class="confirm-input">
                                 <input type="text" class="n-input" name="userEmail"
                                    id="userEmail" placeholder="이메일 주소 입력" required>
                                 <div class="submit_btn" onClick="sendEmail()">인증</div>
                              </div>
                              <div class="input">
                                 <input type="email" id="email-authnum" name="email-authnum"
                                    placeholder="인증번호 5자리" onChange="emailAuth()">
                                 <div id="email-msg" class="confirmmsg">이메일 인증을 받아주세요</div>
                              </div>
                           </div>
                           <div class="btn_box2">
                              <div class="n-btn2" onclick="email_change_btn_click()">취소</div>
                              <div class="submit_btn" onclick="emailUpdate()">완료</div>
                           </div>
                        </div>
                     </form></td>
                  <td><div class="n-btn" id="email-btn"
                        onclick="email_change_btn_click()">이메일 변경</div></td>
               </tr>
            </tbody>
         </table>
         <div class="pp">
            <p>-아이디는 수정이 불가능합니다.</p>
            <p>-이메일 변경 시 반드시 인증을 거쳐야 합니다.</p>
         </div>
      </div>
      <%
         }
      %>
   </div>
</body>
</html>