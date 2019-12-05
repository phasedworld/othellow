<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
  src:url('font/Ddukkubi.ttf');
}
@font-face{
  font-family:'NotoSansBold';
  src:url('font/NotoSansBold.otf');
}
@font-face{
  font-family:'YoonGothic';
  src:url('font/YoonGothic.otf');
}
body{
  margin:0;
  font-family:'NotoSansBold';
}
header{
  width:1200px;
  margin:0 auto;
  height:400px;
  background-position: center;
  background-size: cover;
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
  min-width:1200px;
  height:40px;
  background-image: linear-gradient(135deg, #383838 37.50%, #303030 37.50%, #303030 50%, #383838 50%, #383838 87.50%, #303030 87.50%, #303030 100%);
  background-size: 11.31px 11.31px;
}

.loginbox{
  height:170px;
  background:white;
}
.login-input{
  margin:25px;
  margin-top:20px;
  margin-bottom:0px;
  padding-left:15px;
  padding-right:15px;
  width:266px;
  height:35px;
  border-radius: 30px;
  border:2px solid #999;
  background:#eee;
  font-family:'NotoSansBold';
  font-size:18px;
  color:#555;
}
.login-input:focus{
  outline: none;
  background:white;
}
.userinfo{
  height:90px;
  padding:15px;
  padding-left:30px;
  padding-right:30px;
  display:grid;
  grid-template-columns:100px 190px;
  grid-template-rows:45% 55%;
}
.user-img{
  grid-row-start:1;
  grid-row-end:3;
  background-color:white;
  background-size:cover;
  border-radius: 15px;
}
.winlabel, .loselabel{
  font-family:'Ddukkubi';
  font-size:26px;
  color:white;
  padding:5px;
}
.user-name{
  display:flex;
  align-items: center;
  padding-left:10px;
}
.user-winlose{
  display:flex;
  align-items: center;
  padding-left:10px;
}
.winrateval{
  padding:10px;
  font-size:18px;
}
.winlabel{
  text-shadow:0px 0px 5px red;
}
.loselabel{
  text-shadow:0px 0px 5px #4078c9;
}
.infobtn-wrap{
  height:50px;
  display:flex;
  justify-content: center;
  align-items: center;
}
.infobtn{
  flex-grow:1;
  text-align: center;
  text-decoration: none;
  color:#555;
}
.loginbtn{
  height:110px;
  background:#c0c962;/* #959f2c */
  display:flex;
  justify-content: center;
  align-items: center;
  cursor:pointer;
  position:relative;
}
.loginbtn:hover .startwave{
  animation:wave 7s infinite;
}
 .loginbtn:hover .subwave{
   animation:subwave 3s infinite;
 }

@keyframes wave{
  from{
    transform: rotate(0deg);
  }
  from{
    transform: rotate(360deg);
  }
}

@keyframes subwave{
  from{
    transform: rotate(0deg);
  }
  from{
    transform: rotate(360deg);
  }
}
.gamestart{
  z-index:6;
  font-size:45px;
  font-style: italic;
  text-shadow: 0px 0px 10px #777;
  font-family:'Ddukkubi';
  color:white;
}
.startwave{
  z-index: 2;
  width:500px; height:500px;
  border-radius: 43%;
  transform-origin: 50% 48%;
  position:absolute;
  bottom:-440px;
  background: #959f2c;
  transition: 0.2s;
}
.subwave{
  z-index: 1;
  width:500px; height:500px;
  border-radius: 43%;
  transform-origin: 50% 48%;
  position:absolute;
  bottom:-420px;
  background: #e8e570;
  opacity:0.5;
  transition: 0.2s;
}
</style>
</head>
<body>
  <div class="header-wrapper">
    <header>
        <nav>
          <ul>
            <li><a href="uservice/RankList" class="nav">랭킹</a></li>
            <li class="logo" style="position:relative;"><a id="logo" href="./" style="font-size:75px; font-family:'Ddukkubi'">오델로<span id="w-word">W</span></a></li>
            <li><a href='community/list' class="nav">커뮤니티</a></li>
          </ul>
        </nav>
      </header>
  </div>

  <div class="header-divider"></div>
  <div id="container">
    <div class="today_odelW">
      <div class="today_odelW_title">#오델로 일짱 되는 방법 알고싶으신?</div>
    </div>
    <div class="today_odelW">
      <div class="today_odelW_title">#콩비바들 때문에 게임 하기 싫습니다 듀크채널만들어주세요</div>
    </div>

    <div class="community">
      <ul>
        <a href="community/03.html"><li>[공지]점검 있습니다 오늘 22시에 발닦고자세요</li></a>
        <a href="community/03.html"><li>[잡담]근데 요새 게임 밸런스 후지지않냐</li></a>
        <a href="community/03.html"><li>[잡담]흑돌충들 흑돌로만 게임돌린다매</li></a>
        <a href="community/03.html"><li>[팬아트]오늘의 오델로 보내주세요</li></a>
        <a href="community/03.html"><li>[잡담]행돼 이자식 어디사냐? 겨우이기고티배깅하네 캐시자랑좀 그만합시다</li></a>
        <a href="community/03.html"><li>[잡담]AI켜놓고 게임하는 비매좀하지맙시다</li></a>
        <a href="community/03.html"><li>[팬아트]오델로 돌 그려봤습니다</li></a>
      </ul>
    </div>
    
    <div class="mainbar">
    <%if(session.getAttribute("user")==null){%>
      <div class="loginbox">
        <form name="loginForm" id="loginForm" method="post">
        <input class="login-input" type="text" name="userId" required/>
        <input class="login-input" type="password" name="userPassword" onkeypress="enterSubmit()" required/>
      </form>
      <div class="infobtn-wrap">
        <a class="infobtn" href="user/signup">회원가입</a><a class="infobtn" href="uservice/findIdForm">아이디/비밀번호찾기</a>
      </div>
      <div class="btn loginbtn" onClick="login()">
        <span class="gamestart">로그인</span>
        <span class="startwave"></span>
        <span class="subwave"></span>
      </div>
      <%}else{%>
      <div class="loginbox">
        <div class="userinfo">
          <div class="user-img" style="background-image:url('')"></div>
          <span class="user-name"><img width=30px height=30px> ${user.userNickname}</span>
          <div class="user-winlose"><span class="winlabel">승</span><span class="winrateval">${user.userWin}</span><span class="loselabel">패</span><span class="winrateval">${user.userLose}</span></div>
        </div>
        <div class="infobtn-wrap">
          <a class="infobtn" href="user/logout">로그아웃</a><a class="infobtn" href="uservice/mypageUpdate">정보수정</a>
        </div>
      </div>
      <div class="btn loginbtn">
        <span class="gamestart" onClick="location.href='game/lobby';">게임시작</span>
        <span class="startwave"></span>
        <span class="subwave"></span>
      </div>
      <%}%>
    </div>

  </div>
</body>
<script>
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
function login(){
	//$('#loginForm').submit();
	$.ajax({
		method:"GET",
		url:"login",
		data:$('#loginForm').serialize(),
		success:function(data){
			if(data ==1 ){
				alert('잘못된 ID 또는 패스워드입니다','warning');
			}else{
				location.href="./";
			}
		}
	});
}
function enterSubmit(){
	if(event.keyCode == 13){
		login();
	}
}
</script>
<style>
  #container{
    margin:0 auto;
    width:1200px;
    display:flex;
    flex-direction: row;
    justify-content: center;
    margin-top:30px;
  }
  .today_odelW{
    width:210px;
    height:280px;
    background-image: radial-gradient( circle farthest-corner at 10% 20%,  rgba(252,150,120,1) 0%, rgba(247,108,127,1) 100.4% );
    margin-right:20px;
    cursor:pointer;
  }
  .today_odelW:hover .today_odelW_title{
    background:transparent;
    color:#333;
    transition:0.3s;
  }
  .today_odelW_title{
    font-size:19px;
    height:90px;
    background:rgba(0,0,0,0.7);
    color:white;
    padding:10px;
  }
  a{
    text-decoration:none;
  }
  .community{
    width:300px;
    margin:0px 20px;
  }
  .community ul{
    margin:0px;
    padding:0px;
    list-style:none;
    height:100%;
    display:flex;
    flex-direction:column;
  }
  .community ul a{
    flex-grow:1;
    padding:0px 10px;
    border-bottom:1px solid #ddd;
    display:flex;
    align-items: center;
    text-decoration: none;
    color:#333;
  }
  .community ul a:first-child{
    border-top:1px solid #ddd;
  }

  .community ul li:first-child{
    display:block;
    overflow:hidden;
    text-overflow: ellipsis;
    white-space:nowrap;
  }
  
  .mainbar{
    width:350px;
    height:280px;
    border-radius:10px;
    display:flex;
    flex-direction:column;
    overflow: hidden;
    background:white;
    box-shadow:0px 0px 10px grey;
  }

</style>
</html>
