<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>오델로W</title>
<meta charset="utf-8">
<style>
@font-face{
  font-family:'Ddukkubi';
  src:url('../resources/font/Ddukkubi.ttf');
}

@font-face{
  font-family:'NotoSansBold';
  src:url('../resources/font/NotoSansBold.otf');
}

@font-face{
  font-family:'YoonGothic';
  src:url('../resources/font/YoonGothic.otf');
}

body{
  margin:0 auto;
  font-family:'YoonGothic';
  background: url("");
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

</style>
</head>
<body>
<div class="shadow">

  <div id="room_container">
    <ul>
      <li class="room-wrapper started" onClick="location.href='02.html';">
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

      <li class="room-wrapper" onClick="location.href='02.html';">
        <div class="room-header">
          <div class="room_status">02</div>
          <div class="room_status">스겜</div>
        </div>

        <div class="room-body">
          <div class="room_status">Waiting...</div>
          <div class="room_status">1/2</div>
        </div>
      </li>
    </ul>

	  </div><!-- room_wrapper shadow -->
	  <div class="button_wrap">
	    <button type="submit" id=findBtn >방만들기 </button>
	    <button type="button" id="cancelBtn" onclick="history.go(-1);">나가기</button>
	  </div>
</div><!-- end shadow -->
</body>

</html>
