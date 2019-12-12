<%@page import="parkjieun.othellow.user.domain.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% User user = (User) session.getAttribute("user");%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>인게임 화면</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="http://cdnjs.cloudflare.com/ajax/libs/sockjs-client/0.3.4/sockjs.min.js"></script>
<style>
@font-face{
  font-family:'Ddukkubi';
  src:url('../../font/Ddukkubi.ttf');
}
@font-face{
  font-family:'YoonGothic';
  src:url('../../font/YoonGothic.otf');
}
.readybtn{
  background:orange;
  display:inline-block;
  padding:10px;
}
.readybtn.set{
  background:red;
  color:white;
}
#gameboard{
  position: absolute;
  left:50%; top:50%;
  transform:translate(-50%,-50%);
  display:grid;
  width:600px;
  height:600px;
  grid-template-rows: 12.5% 12.5% 12.5% 12.5% 12.5% 12.5% 12.5% 12.5% ;
  grid-template-columns: 12.5% 12.5% 12.5% 12.5% 12.5% 12.5% 12.5% 12.5% ;
  border:1px solid #333;
  background:#26b899;
}
.cell.invisible .side,.cell.invisible .cellpanel, .cell.invisible .inner{
    opacity:0;
  }
.cell{
	display:flex;
  	justify-content: center;
  	align-items: center;
  	font-size:30px;
  	border:1px solid #089f90;
    opacity:1;
    position:relative;
    width:100%; height:100%;
    perspective: 500px;
    transform-style:preserve-3d;
  }
.cell.clickable{
	background:lightblue;
	cursor:pointer;
}
.side{
    position:absolute;
    width:80%; height:80%;
    border-radius:80px;
    transform-origin:50% 50%;
    transition:0.5s;
  }
.side.white{
    background:ivory;
    transform:rotateX(0deg)translateZ(10px);
  }
.side.black{
    background:#333;
    transform:rotateX(0deg)translateZ(-10px);
  }
.cell.reverse .side.white{
    transform:rotateX(180deg)translateZ(10px);
  }
.cell.reverse .side.black{
    transform:rotateX(180deg)translateZ(-10px);

}
.cellpanel{
    position:absolute;

    width:80%; height:80%;
    transform-origin:50% 50%;
    transform:rotateX(-90deg);
    transition:0.5s;
    background:linear-gradient(transparent 0%, transparent 39%,ivory 39%, ivory 50%, #333 50.1%, #333 62%, transparent 62%);
  }

.reverse .cellpanel{
    transform:rotateX(90deg);
  }

.inner{
    position:absolute;
    width:80%; height:80%;
    border-radius:80px;
    transform-origin:50% 50%;
    transition:0.5s;
  }
.inner.white{
    background:ivory;
    transform:rotateX(0deg) translateZ(1px) ;
  }
.inner.black{
    background:#333;
    transform:rotateX(0deg) translateZ(-1px) ;
  }

.cell.reverse .inner.white{
    transform:rotateX(180deg) translateZ(1px);
  }
.cell.reverse .inner.black{
    transform:rotateX(180deg) translateZ(-1px);
  }
#topnav{
  margin:0 auto;
  display:flex;
  justify-content: center;
  overflow: hidden;
  width:750px;
  padding:10px;
  padding-top:0px;
}
.username{
  padding:10px;
  width:300px;
  text-align:center;
  font-size:30px;
  font-family:'Ddukkubi';
  text-shadow:0px 0px 10px white;
  border-radius:0px 0px 30px 30px;
  transition:0.3s ease;
  box-shadow:0px 0px 5px grey;
}
.username.black{
  background:black;
  color:white;
  text-shadow:0px 0px 10px #26b899;
}
.username.white{
  background:white;
  color:black;
  text-shadow:0px 0px 10px #26b899;
}
.username.white.btn{
 cursor:pointer;
 animation:readyforuser 2.5s infinite;
}
@keyframes readyforuser{
0%{
 color:rgba(0,0,0,0.2);
}
60%{
 color:rgba(0,0,0,0.7);
}
100%{
 color:rgba(0,0,0,0.2);
}
}
.scoreboard{
  width:140px;
  padding:10px;
  text-align:center;
  font-size:27px;
  font-family:'Ddukkubi';
}
body{
  background:url("");
  background-position: center;
  background-size: cover;
  height:100%;
  margin:0 auto;
}
html{
  height:100%;
}
.button_wrap{
  position:fixed;
  bottom:0px;
  display:flex;
  justify-content: center;
  width:100%;
}

#cancelBtn{
display:inline-block;
background: #ccc;
width:400px;
padding:17px 30px;
font-size:19px;
border:2px solid #ccc;
border-radius:10px;
color:white;
cursor:pointer;
transition:0.3s;
box-shadow:0px 0px 15px black;
margin:0px 10px;
}

#cancelBtn:hover{
  background: #aaa;
  border:2px solid #aaa;
}

/*modal css*/

#make-room-modal{
  display:none;
  background:white;
  position:absolute;
  left:50%; top:50%;
  transform:translate(-50%,-50%);
  z-index:99;
  padding:40px 80px;
  border-radius:10px;
  border:2px solid #999;
  font-family:'YoonGothic';
}
#room-label{
  text-align: center;
  font-size:28px;
}
#totalscore{
  font-size:75px;
  width:350px;
  padding-top:25px;
  text-align: center;
}
.exit-label{
  margin:0 auto;
  text-align: center;
  background:#333;
  color:white;
  width:120px;
  padding:5px;
  margin-top:20px;
  font-size:18px;
  cursor:pointer;
}
.modal-shadow{
  width:100%; height:100%;
  background:rgba(0,0,0,0.3);
  position:absolute;
  z-index:33;
  display:none;
}
.modal-exit{
  position:absolute;
  right:20px;
  top:20px;
  cursor:pointer;
}
#make-room-modal.show, .modal-shadow.show{
  display:block;
}
.character{
  position:absolute;
  left:5%;
  bottom:0px;
  width:420px;
  height:500px;
  opacity:0.5;
  background-position:center;
  background-size:contain;
  background-repeat:no-repeat;
}
.character.black{
  transform:scaleX(-1);
}
.character.white{
  left:auto;
  right:5%;
}
</style>
<script>
window.onload = function(){
  $('.clickable').on('click',function(){
    $('.clickable').toggleClass('invisible');
    $('.clickable').toggleClass('reverse');
  });
}
</script>
<script type = "text/javascript">
//웹소켓을 지정한 url로 연결한다.

var sock = new SockJS("<c:url value="/gamesocket"/>");

sock.onopen = onOpen;
sock.onmessage = onMessage;
sock.onclose = onClose;


function onOpen(){
	sock.send("${roomNo}:enter:<%=user.getUserNickname()%>");
}

// 메시지 전송
function sendMessage() {
       sock.send("안녕, 나는 새로운 세션!");
}
// 서버로부터 메시지를 받았을 때
function onMessage(msg) {

    var data = msg.data;
	console.log(data);
    //데이터의 종류에 따라 컨트롤
    var message = data.split(":");
    //서버에서 보내는 데이터 타입 [action]:[label]:[value]
    if(message[0]=='enter'){
    	if(message[1]=='blackNick'){
    		$("#blackNick").val(message[2]);
    		$("#blackName").text(message[2]);
    	}else if(message[1]=='whiteNick'){
    		$('#whiteName').removeClass('btn');
    		$("#whiteNick").val(message[2]);
    		$("#whiteName").text(message[2]);
    	}
    }else if(message[0]=='side'){
    	$('#mySide').val(message[1]);
    	if($('#mySide').val()=='white'){
    		//white유저일 때, 화이트 네임 박스가 시각적, 실질적으로 ready 버튼이 된다.
    		$('#whiteName').text('클릭해서 게임 시작');
    		$('#whiteName').bind('click',function(){
    			sock.send("${roomNo}:ready");
    			$('#whiteName').unbind();
    		});
    	}
    }else if(message[0]=='start'){
    	//게임 시작시, (4,4),(4,5),(5,4),(5,5)에 돌을 두고 black 유저에게 클릭할 곳(턴)을 준다.
    	$('#28').removeClass('invisible');
    	$('#29').removeClass('invisible');
    	$('#36').removeClass('invisible');
    	$('#37').removeClass('invisible');
    	$('#29').addClass('reverse');
    	$('#36').addClass('reverse');
    	$('.scoreboard').text("2:2");
    	if($('#mySide').val()=='black'){
    		$('#20').addClass('clickable');
        	$('#27').addClass('clickable');
        	$('#38').addClass('clickable');
        	$('#45').addClass('clickable');
        	$('.clickable').off().on('click',function(){
        		dropStone($(this).attr('id'));
    		});
    	}
    	sock.send("${roomNo}:"+"character:"+$('#mySide').val()+":<%=user.getCharacterNo()%>");
    }else if(message[0]=='black'){
    	var idx = 1;
    	var blackScore = 0; var whiteScore = 0;
    	while(message[idx]!='white'){
    		$('#gameboard').children().eq(message[idx]).addClass('reverse');
			$('#gameboard').children().eq(message[idx]).removeClass('invisible');
			idx++;
			blackScore ++;
		}
    	idx++;
    	while(message[idx]!=null){
    		$('#gameboard').children().eq(message[idx]).removeClass('reverse');
			$('#gameboard').children().eq(message[idx]).removeClass('invisible');
			idx++;
			whiteScore ++;
    	}
    	$('.scoreboard').text(blackScore+":"+whiteScore);
    }else if(message[0]=='clickable'){
    	if(message[1]==$('#mySide').val()){
    		for(var i=2;i<message.length;i++){
    			$('#gameboard').children().eq(message[i]).addClass('clickable');
    		}
    		$('.clickable').off().on('click',function(){
        		dropStone($(this).attr('id'));
    		});
    	}else{
    		$('.clickable').off();
    	}
    	if(message[1]=="black"){
    		//블랙 캐릭터이미지 업
    		$('.character').css('opacity','0.5');
    		$('.character.black').css('opacity','1');
    	}else if(message[1]=="white"){
    		//화이트 캐릭터이미지 업
    		$('.character').css('opacity','0.5');
    		$('.character.white').css('opacity','1');
    	}
    }else if(message[0]=='gameend'){
    	var resultLabel = "";
    	if(message[1]==message[2]){
    		resultLabel = "DRAW!";
    	}else if(Number(message[1])>Number(message[2])){
    		resultLabel = "BLACK WIN!";
    	}else{
    		resultLabel = "WHITE WIN!";
    	}
    	$('#room-label').text(resultLabel);
    	$('#totalscore').text(message[1]+":"+message[2]);
    	$('#make-room-modal').addClass('show');
    	$('.modal-shadow').addClass('show');
    }else if(message[0]=='runaway'){
    	$('#room-label').text('상대 탈주!');
    	$('#totalscore').text('부전승');
    	$('#make-room-modal').addClass('show');
    	$('.modal-shadow').addClass('show');
    }else if(message[0]=='character'){
    	if(message[1]=='black'){
    		$('.character.black').css('background-image','url(../../img/'+message[2]+')');
    	}else if(message[1]=='white'){
    		$('.character.white').css('background-image','url(../../img/'+message[2]+')');
    	}
    }
}
// 서버와 연결을 끊었을 때
function onClose(evt) {
       console.log("웹소켓 서버와의 연결 끊김");
}

function exitModal(){
	$('#make-room-modal').removeClass('show');
	$('.modal-shadow').removeClass('show');
}
</script>
<script>
function dropStone(idx){
	console.log('dropped!')
	sock.send("${roomNo}:"+$('#mySide').val()+":"+idx);
	$('.clickable').off();
	$('.cell').siblings().removeClass('clickable');
}
</script>
</head>
<body>
<div class="modal-shadow"></div>
  <div id="make-room-modal">
    <span class="modal-exit" onClick="exitModal()">&times;</span>
    <div id="room-label"></div>
    <div id="totalscore"></div>
    <div class="exit-label" onclick="location.href='../lobby';">EXIT</div>
</div>
<div id="topnav">
  <div class="username black" id="blackName"></div>
  <div class="scoreboard">0 : 0</div>
  <div class="username white btn" id="whiteName">유저 대기중...</div>
</div>
<div class="character black"></div>
<div class="character white"></div>
<input type="hidden" id="mySide" value="">
<input type="hidden" id="blackNick" value="">
<input type="hidden" id="whiteNick" value="">
  <div id="gameboard">

    <div class="cell invisible" id="1">
	    <div class="side white"></div>
	    <div class="inner white"></div>
	    <div class="cellpanel"></div>
	    <div class="inner black"></div>
	    <div class="side black"></div>
  	</div>

	<div class="cell invisible" id="2">
	    <div class="side white"></div>
	    <div class="inner white"></div>
	    <div class="cellpanel"></div>
	    <div class="inner black"></div>
	    <div class="side black"></div>
  	</div>

	<div class="cell invisible" id="3">
	    <div class="side white"></div>
	    <div class="inner white"></div>
	    <div class="cellpanel"></div>
	    <div class="inner black"></div>
	    <div class="side black"></div>
  	</div>

	<div class="cell invisible" id="4">
	    <div class="side white"></div>
	    <div class="inner white"></div>
	    <div class="cellpanel"></div>
	    <div class="inner black"></div>
	    <div class="side black"></div>
  	</div>

	<div class="cell invisible" id="5">
	    <div class="side white"></div>
	    <div class="inner white"></div>
	    <div class="cellpanel"></div>
	    <div class="inner black"></div>
	    <div class="side black"></div>
  	</div>

	<div class="cell invisible" id="6">
	    <div class="side white"></div>
	    <div class="inner white"></div>
	    <div class="cellpanel"></div>
	    <div class="inner black"></div>
	    <div class="side black"></div>
  	</div>

	<div class="cell invisible" id="7">
	    <div class="side white"></div>
	    <div class="inner white"></div>
	    <div class="cellpanel"></div>
	    <div class="inner black"></div>
	    <div class="side black"></div>
  	</div>

	<div class="cell invisible" id="8">
	    <div class="side white"></div>
	    <div class="inner white"></div>
	    <div class="cellpanel"></div>
	    <div class="inner black"></div>
	    <div class="side black"></div>
  	</div>

	<div class="cell invisible" id="9">
	    <div class="side white"></div>
	    <div class="inner white"></div>
	    <div class="cellpanel"></div>
	    <div class="inner black"></div>
	    <div class="side black"></div>
  	</div>

	<div class="cell invisible" id="10">
	    <div class="side white"></div>
	    <div class="inner white"></div>
	    <div class="cellpanel"></div>
	    <div class="inner black"></div>
	    <div class="side black"></div>
  	</div>

	<div class="cell invisible" id="11">
	    <div class="side white"></div>
	    <div class="inner white"></div>
	    <div class="cellpanel"></div>
	    <div class="inner black"></div>
	    <div class="side black"></div>
  	</div>

	<div class="cell invisible" id="12">
	    <div class="side white"></div>
	    <div class="inner white"></div>
	    <div class="cellpanel"></div>
	    <div class="inner black"></div>
	    <div class="side black"></div>
  	</div>

	<div class="cell invisible" id="13">
	    <div class="side white"></div>
	    <div class="inner white"></div>
	    <div class="cellpanel"></div>
	    <div class="inner black"></div>
	    <div class="side black"></div>
  	</div>

	<div class="cell invisible" id="14">
	    <div class="side white"></div>
	    <div class="inner white"></div>
	    <div class="cellpanel"></div>
	    <div class="inner black"></div>
	    <div class="side black"></div>
  	</div>

	<div class="cell invisible" id="15">
	    <div class="side white"></div>
	    <div class="inner white"></div>
	    <div class="cellpanel"></div>
	    <div class="inner black"></div>
	    <div class="side black"></div>
  	</div>

	<div class="cell invisible" id="16">
	    <div class="side white"></div>
	    <div class="inner white"></div>
	    <div class="cellpanel"></div>
	    <div class="inner black"></div>
	    <div class="side black"></div>
  	</div>

	<div class="cell invisible" id="17">
	    <div class="side white"></div>
	    <div class="inner white"></div>
	    <div class="cellpanel"></div>
	    <div class="inner black"></div>
	    <div class="side black"></div>
  	</div>

	<div class="cell invisible" id="18">
	    <div class="side white"></div>
	    <div class="inner white"></div>
	    <div class="cellpanel"></div>
	    <div class="inner black"></div>
	    <div class="side black"></div>
  	</div>

	<div class="cell invisible" id="19">
	    <div class="side white"></div>
	    <div class="inner white"></div>
	    <div class="cellpanel"></div>
	    <div class="inner black"></div>
	    <div class="side black"></div>
  	</div>

	<div class="cell invisible" id="20">
	    <div class="side white"></div>
	    <div class="inner white"></div>
	    <div class="cellpanel"></div>
	    <div class="inner black"></div>
	    <div class="side black"></div>
  	</div>

	<div class="cell invisible" id="21">
	    <div class="side white"></div>
	    <div class="inner white"></div>
	    <div class="cellpanel"></div>
	    <div class="inner black"></div>
	    <div class="side black"></div>
  	</div>

	<div class="cell invisible" id="22">
	    <div class="side white"></div>
	    <div class="inner white"></div>
	    <div class="cellpanel"></div>
	    <div class="inner black"></div>
	    <div class="side black"></div>
  	</div>

	<div class="cell invisible" id="23">
	    <div class="side white"></div>
	    <div class="inner white"></div>
	    <div class="cellpanel"></div>
	    <div class="inner black"></div>
	    <div class="side black"></div>
  	</div>

	<div class="cell invisible" id="24">
	    <div class="side white"></div>
	    <div class="inner white"></div>
	    <div class="cellpanel"></div>
	    <div class="inner black"></div>
	    <div class="side black"></div>
  	</div>

	<div class="cell invisible" id="25">
	    <div class="side white"></div>
	    <div class="inner white"></div>
	    <div class="cellpanel"></div>
	    <div class="inner black"></div>
	    <div class="side black"></div>
  	</div>

	<div class="cell invisible" id="26">
	    <div class="side white"></div>
	    <div class="inner white"></div>
	    <div class="cellpanel"></div>
	    <div class="inner black"></div>
	    <div class="side black"></div>
  	</div>

	<div class="cell invisible" id="27">
	    <div class="side white"></div>
	    <div class="inner white"></div>
	    <div class="cellpanel"></div>
	    <div class="inner black"></div>
	    <div class="side black"></div>
  	</div>

	<div class="cell invisible" id="28">
	    <div class="side white"></div>
	    <div class="inner white"></div>
	    <div class="cellpanel"></div>
	    <div class="inner black"></div>
	    <div class="side black"></div>
  	</div>

	<div class="cell invisible" id="29">
	    <div class="side white"></div>
	    <div class="inner white"></div>
	    <div class="cellpanel"></div>
	    <div class="inner black"></div>
	    <div class="side black"></div>
  	</div>

	<div class="cell invisible" id="30">
	    <div class="side white"></div>
	    <div class="inner white"></div>
	    <div class="cellpanel"></div>
	    <div class="inner black"></div>
	    <div class="side black"></div>
  	</div>

	<div class="cell invisible" id="31">
	    <div class="side white"></div>
	    <div class="inner white"></div>
	    <div class="cellpanel"></div>
	    <div class="inner black"></div>
	    <div class="side black"></div>
  	</div>

	<div class="cell invisible" id="32">
	    <div class="side white"></div>
	    <div class="inner white"></div>
	    <div class="cellpanel"></div>
	    <div class="inner black"></div>
	    <div class="side black"></div>
  	</div>

	<div class="cell invisible" id="33">
	    <div class="side white"></div>
	    <div class="inner white"></div>
	    <div class="cellpanel"></div>
	    <div class="inner black"></div>
	    <div class="side black"></div>
  	</div>

	<div class="cell invisible" id="34">
	    <div class="side white"></div>
	    <div class="inner white"></div>
	    <div class="cellpanel"></div>
	    <div class="inner black"></div>
	    <div class="side black"></div>
  	</div>

	<div class="cell invisible" id="35">
	    <div class="side white"></div>
	    <div class="inner white"></div>
	    <div class="cellpanel"></div>
	    <div class="inner black"></div>
	    <div class="side black"></div>
  	</div>

	<div class="cell invisible" id="36">
	    <div class="side white"></div>
	    <div class="inner white"></div>
	    <div class="cellpanel"></div>
	    <div class="inner black"></div>
	    <div class="side black"></div>
  	</div>

	<div class="cell invisible" id="37">
	    <div class="side white"></div>
	    <div class="inner white"></div>
	    <div class="cellpanel"></div>
	    <div class="inner black"></div>
	    <div class="side black"></div>
  	</div>

	<div class="cell invisible" id="38">
	    <div class="side white"></div>
	    <div class="inner white"></div>
	    <div class="cellpanel"></div>
	    <div class="inner black"></div>
	    <div class="side black"></div>
  	</div>

	<div class="cell invisible" id="39">
	    <div class="side white"></div>
	    <div class="inner white"></div>
	    <div class="cellpanel"></div>
	    <div class="inner black"></div>
	    <div class="side black"></div>
  	</div>

	<div class="cell invisible" id="40">
	    <div class="side white"></div>
	    <div class="inner white"></div>
	    <div class="cellpanel"></div>
	    <div class="inner black"></div>
	    <div class="side black"></div>
  	</div>

	<div class="cell invisible" id="41">
	    <div class="side white"></div>
	    <div class="inner white"></div>
	    <div class="cellpanel"></div>
	    <div class="inner black"></div>
	    <div class="side black"></div>
  	</div>

	<div class="cell invisible" id="42">
	    <div class="side white"></div>
	    <div class="inner white"></div>
	    <div class="cellpanel"></div>
	    <div class="inner black"></div>
	    <div class="side black"></div>
  	</div>

	<div class="cell invisible" id="43">
	    <div class="side white"></div>
	    <div class="inner white"></div>
	    <div class="cellpanel"></div>
	    <div class="inner black"></div>
	    <div class="side black"></div>
  	</div>

	<div class="cell invisible" id="44">
	    <div class="side white"></div>
	    <div class="inner white"></div>
	    <div class="cellpanel"></div>
	    <div class="inner black"></div>
	    <div class="side black"></div>
  	</div>

	<div class="cell invisible" id="45">
	    <div class="side white"></div>
	    <div class="inner white"></div>
	    <div class="cellpanel"></div>
	    <div class="inner black"></div>
	    <div class="side black"></div>
  	</div>

	<div class="cell invisible" id="46">
	    <div class="side white"></div>
	    <div class="inner white"></div>
	    <div class="cellpanel"></div>
	    <div class="inner black"></div>
	    <div class="side black"></div>
  	</div>

	<div class="cell invisible" id="47">
	    <div class="side white"></div>
	    <div class="inner white"></div>
	    <div class="cellpanel"></div>
	    <div class="inner black"></div>
	    <div class="side black"></div>
  	</div>

	<div class="cell invisible" id="48">
	    <div class="side white"></div>
	    <div class="inner white"></div>
	    <div class="cellpanel"></div>
	    <div class="inner black"></div>
	    <div class="side black"></div>
  	</div>

	<div class="cell invisible" id="49">
	    <div class="side white"></div>
	    <div class="inner white"></div>
	    <div class="cellpanel"></div>
	    <div class="inner black"></div>
	    <div class="side black"></div>
  	</div>

	<div class="cell invisible" id="50">
	    <div class="side white"></div>
	    <div class="inner white"></div>
	    <div class="cellpanel"></div>
	    <div class="inner black"></div>
	    <div class="side black"></div>
  	</div>

	<div class="cell invisible" id="51">
	    <div class="side white"></div>
	    <div class="inner white"></div>
	    <div class="cellpanel"></div>
	    <div class="inner black"></div>
	    <div class="side black"></div>
  	</div>

	<div class="cell invisible" id="52">
	    <div class="side white"></div>
	    <div class="inner white"></div>
	    <div class="cellpanel"></div>
	    <div class="inner black"></div>
	    <div class="side black"></div>
  	</div>

	<div class="cell invisible" id="53">
	    <div class="side white"></div>
	    <div class="inner white"></div>
	    <div class="cellpanel"></div>
	    <div class="inner black"></div>
	    <div class="side black"></div>
  	</div>

	<div class="cell invisible" id="54">
	    <div class="side white"></div>
	    <div class="inner white"></div>
	    <div class="cellpanel"></div>
	    <div class="inner black"></div>
	    <div class="side black"></div>
  	</div>

	<div class="cell invisible" id="55">
	    <div class="side white"></div>
	    <div class="inner white"></div>
	    <div class="cellpanel"></div>
	    <div class="inner black"></div>
	    <div class="side black"></div>
  	</div>

	<div class="cell invisible" id="56">
	    <div class="side white"></div>
	    <div class="inner white"></div>
	    <div class="cellpanel"></div>
	    <div class="inner black"></div>
	    <div class="side black"></div>
  	</div>

	<div class="cell invisible" id="57">
	    <div class="side white"></div>
	    <div class="inner white"></div>
	    <div class="cellpanel"></div>
	    <div class="inner black"></div>
	    <div class="side black"></div>
  	</div>

	<div class="cell invisible" id="58">
	    <div class="side white"></div>
	    <div class="inner white"></div>
	    <div class="cellpanel"></div>
	    <div class="inner black"></div>
	    <div class="side black"></div>
  	</div>

	<div class="cell invisible" id="59">
	    <div class="side white"></div>
	    <div class="inner white"></div>
	    <div class="cellpanel"></div>
	    <div class="inner black"></div>
	    <div class="side black"></div>
  	</div>

	<div class="cell invisible" id="60">
	    <div class="side white"></div>
	    <div class="inner white"></div>
	    <div class="cellpanel"></div>
	    <div class="inner black"></div>
	    <div class="side black"></div>
  	</div>

	<div class="cell invisible" id="61">
	    <div class="side white"></div>
	    <div class="inner white"></div>
	    <div class="cellpanel"></div>
	    <div class="inner black"></div>
	    <div class="side black"></div>
  	</div>

	<div class="cell invisible" id="62">
	    <div class="side white"></div>
	    <div class="inner white"></div>
	    <div class="cellpanel"></div>
	    <div class="inner black"></div>
	    <div class="side black"></div>
  	</div>

	<div class="cell invisible" id="63">
	    <div class="side white"></div>
	    <div class="inner white"></div>
	    <div class="cellpanel"></div>
	    <div class="inner black"></div>
	    <div class="side black"></div>
  	</div>

	<div class="cell invisible" id="64">
	    <div class="side white"></div>
	    <div class="inner white"></div>
	    <div class="cellpanel"></div>
	    <div class="inner black"></div>
	    <div class="side black"></div>
  	</div>

  </div>
  
  <div class="button_wrap">
    <button type="button" id="cancelBtn" onclick="location.href='../lobby';">나가기</button>
  </div>
</body>
</html>
