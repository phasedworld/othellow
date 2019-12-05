<%@page import="parkjieun.othellow.user.domain.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% User user = (User) session.getAttribute("user");%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>오델로W</title>
<meta charset="utf-8">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
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
  margin:0 auto;
  font-family:'YoonGothic';
  background: lightblue;
  height:100%;
}

html{
  height:100%;
}

#room_container{
  border:none;
  border-radius:50px;
  width:850px;
  padding:25px;
  height:800px;
  position:absolute;
  left:50%; top:50%;
  transform:translate(-50%,-54%);
  margin: 0 auto;
  background:rgba(255,255,255,0.6);
}

#room_container ul{
  margin:0px; padding: 0px; list-style:none;
}

#room_container ul{
  margin-top:50px;
  display:grid;
  grid-template-columns: 415px 20px 415px;
}

.room-wrapper{
  background: #91c4ff;
  height:150px;
  border: 4px solid white;
  box-shadow:5px 5px 0px #3173c1;
  border-radius:50px;
  width:415px;
  margin:0 auto;
  cursor:pointer;
  margin-bottom:20px;
}

.room-header{ /*div 방번호, 방제목 묶음*/
  background-color: rgba(255,255,255,0.3);
  display:table;
  width:80%;
  margin:0 auto;
  margin-top:20px;
  border-radius:20px;
  line-height:40px;
  padding:10px;
}

.room-header .room_status{ /*div 방번호, 방제목*/
  display:table-cell;
}

.room-header .room_status:first-child{ /*div 방번호*/
  text-align: center;
  background-color: #3173c1;
  color:white;
  border-radius:20px;
  width:100px;
}

.room-header .room_status:last-child{/*div 방제목*/
  font-family: YoonGothic;
  padding:0px 20px;
  font-size:21px;
}

.room-body{/*div 상태, 인원 묶음*/
  display:table;
  width:80%;
  margin:0 auto;
  margin-top:2px;
  padding:10px;
}

.room-body .room_status:first-child{ /*div 상태*/
  display:table-cell;
  font-family: Ddukkubi;
  font-size:20px;
  text-align: center;
  color:white;
  padding-left:20px;
  width:100px;
}

.room-body .room_status:last-child{/*div 인원 */
  text-align:right;
  padding-right:30px;

}

/*게임중일때!*/
.room-wrapper.started{
  background-color: pink;
  box-shadow:5px 5px 0px hotpink;
}

/*버튼!*/
#findBtn{
display:inline-block;
background: #3068ff;
width:400px;
padding:17px 30px;
font-size:19px;
font-weight:900px;
border:2px solid #3068ff;
border-radius:10px;
color:white;
cursor:pointer;
transition:0.3s;
box-shadow:0px 0px 15px black;
margin:0px 10px;
}

.button_wrap{
  position:fixed;
  bottom:0px;
  display:flex;
  justify-content: center;
  width:100%;
}

#findBtn:hover{
  background: #0041f0;
  border:2px solid #0041f0;
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

#make-room-modal{
  background:white;
  position:absolute;
  left:50%; top:50%;
  transform:translate(-50%,-50%);
  z-index:99;
  padding:40px 80px;
  border-radius:10px;
  border:2px solid #999;
  display:none;
}
#make-room-modal.show, .modal-shadow.show{
  display:block;
}
#roomName{
  margin:25px;
  margin-top:20px;
  margin-bottom:0px;
  padding-left:15px;
  padding-right:15px;
  width:266px;
  height:35px;
  border-radius: 30px;
  border:2px solid #999;
  background:white;
  font-family:'NotoSansBold';
  font-size:18px;
  color:#555;
  outline: none;
}
.room-label{
  text-align: center;
  font-size:22px;
}
#make-room-btn{
  margin:0 auto;
  background:#aaa;
  width:150px;
  line-height:40px;
  text-align:center;
  border-radius:20px;
  margin-top:30px;
  cursor:pointer;
  transition:0.2s ease;
}
#make-room-btn:hover{
  background:#3068ff;
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
</style>
<script>
window.onload = function(){
  var roomName=['멋진 한 판!', '즐겨요 이기분','매너 게임 합시다','패배시 백돌살해','아무나~','내가 오델로 킹'];
  var randomSeq = Math.floor(Math.random()*(roomName.length));
  document.getElementById('roomName').value=roomName[randomSeq];
  listLobby();
}
function listLobby(){
	$.ajax({
		url:'listlobby',
		success:function(list){
			if(list.length>0){
				var roomList = [];
				$(list).each(function(idx,gameroom){
					var roomClass = "";
					var roomLabel = "Waiting...";
					if(gameroom.roomStatus==1){
						roomClass=" started";
						roomLabel = "Playing...";
					}
					roomList.push("<li class=\'room-wrapper"+roomClass+"\' onClick='joinRoom("+gameroom.roomId+")'>"
					+"<div class=\'room-header\'><span class=\'room_status\'>"+gameroom.roomId+"</span>"
					+"<div class=\'room_status\'>"+gameroom.roomName+"</div></div>"
					+"<div class=\'room-body\'><div class=\'room_status\'>"+
					roomLabel+"</div><div class=\'room_status\'>"+gameroom.roomHeadcount+"/2</div></div>"
					);
					if(idx%2==0){
						roomList.push("<li></li>");
					}
				});
				$('#lobby_wrap').html(roomList.join(''));
			}
		}
	});
}
function showModal(){
	$('#make-room-modal').addClass('show');
	$('.modal-shadow').addClass('show');
}
function exitModal(){
	$('#make-room-modal').removeClass('show');
	$('.modal-shadow').removeClass('show');
}
function makeRoom(){
	var allRoomData = {"roomName":$('#roomName').val(), "userId":"<%=user.getUserId()%>", "userSide":"black"};
	$.ajax({
		url:'makeRoom',
		data:allRoomData,
		success:function(resNo){
			location.href="./room/"+resNo;
		}
	});
}
function joinRoom(roomNo){
	var allRoomData = {"roomId":roomNo, "userId":"<%=user.getUserId()%>", "userSide":"white"};
	$.ajax({
		url:'joinRoom',
		data:allRoomData,
		success:function(){
			location.href="./room/"+roomNo;
		}
	});
}
</script>
</head>
<body>
<div class="modal-shadow"></div>
  <div id="make-room-modal">
  <span class="modal-exit" onClick="exitModal()">&times;</span>
    <div class="room-label">생성할 방 이름을 정해주세요</div>
    <input type="text" id="roomName" name="roomName" value="멋진 한 판!">
    <div id="make-room-btn" onClick="makeRoom()">입장</div>
</div>
<div class="shadow">
  <div id="room_container">
    <ul id="lobby_wrap">
    <div style="position:absolute; width:900px; left:0; top:330px; text-align:center; color:#333; font-family: YoonGothic; line-height:200%;">현재 진행중인 게임방이 없습니다.<br>새로운 방을 생성해주세요.</div>
     <!--  <li class="room-wrapper started" onClick="location.href='./room/1';">
        <div class="room-header">
          <span class="room_status">01</span>
          <div class="room_status">멋진 한 판ㅋ</div>
        </div>

        <div class="room-body">
          <div class="room_status">Playing...</div>
          <div class="room_status">2/2</div>
        </div>
      </li>
      <li></li>
      <li class="room-wrapper" onClick="location.href='./room/2';">
        <div class="room-header">
          <div class="room_status">02</div>
          <div class="room_status">스겜</div>
        </div>

        <div class="room-body">
          <div class="room_status">Waiting...</div>
          <div class="room_status">1/2</div>
        </div>
      </li> -->
    </ul>

	  </div><!-- room_wrapper shadow -->
	  <div class="button_wrap">
	    <button type="submit" id=findBtn onClick="showModal()">방만들기 </button>
	    <button type="button" id="cancelBtn" onclick="history.go(-1);">나가기</button>
	  </div>
</div><!-- end shadow -->
</body>

</html>
