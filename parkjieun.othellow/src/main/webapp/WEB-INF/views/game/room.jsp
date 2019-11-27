<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
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
  src:url('../font/Ddukkubi.ttf');
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
  width:700px;
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
.scoreboard{
  width:130px;
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
	sock.send("${roomNo}:enter");
	
}

// 메시지 전송

function sendMessage() {

       sock.send("안녕, 나는 새로운 세션!");

}


// 서버로부터 메시지를 받았을 때

function onMessage(msg) {

    var data = msg.data;
	console.log(data);
       //$("#data").append(data + "<br/>");

}



// 서버와 연결을 끊었을 때

function onClose(evt) {

       $("#data").append("연결 끊김");

}
      </script>
</head>
<body>
<div id="topnav">
  <div class="username black">지은짱짱걸</div>
  <div class="scoreboard">1 : 0</div>
  <div class="username white">냠냠이!</div>
</div>
<input type="text" value="${roomNo}">
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

	<div class="cell invisible clickable" id="20">
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

	<div class="cell invisible clickable" id="27">
	    <div class="side white"></div>
	    <div class="inner white"></div>
	    <div class="cellpanel"></div>
	    <div class="inner black"></div>
	    <div class="side black"></div>
  	</div>

	<div class="cell" id="28">
	    <div class="side white"></div>
	    <div class="inner white"></div>
	    <div class="cellpanel"></div>
	    <div class="inner black"></div>
	    <div class="side black"></div>
  	</div>

	<div class="cell reverse" id="29">
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

	<div class="cell reverse" id="36">
	    <div class="side white"></div>
	    <div class="inner white"></div>
	    <div class="cellpanel"></div>
	    <div class="inner black"></div>
	    <div class="side black"></div>
  	</div>

	<div class="cell" id="37">
	    <div class="side white"></div>
	    <div class="inner white"></div>
	    <div class="cellpanel"></div>
	    <div class="inner black"></div>
	    <div class="side black"></div>
  	</div>

	<div class="cell invisible  clickable" id="38">
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

	<div class="cell invisible clickable" id="45">
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
    <button type="button" id="cancelBtn" onclick="location.href='../main_02.html';">나가기</button>
  </div>
</body>
</html>
