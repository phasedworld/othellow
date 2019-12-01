package parkjieun.othellow.game.websocket;

import java.util.HashMap;

import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;
import parkjieun.othellow.game.domain.Room;

@Component
public class MyHandler extends TextWebSocketHandler{
	HashMap<String,Room> rooms = new HashMap<String, Room>();
	int matrix[][] = {
			{0,0,0,0,0,0,0,0},
			{0,0,0,0,0,0,0,0},
			{0,0,0,0,0,0,0,0},
			{0,0,0,2,1,0,0,0},
			{0,0,0,1,2,0,0,0},
			{0,0,0,0,0,0,0,0},
			{0,0,0,0,0,0,0,0},
			{0,0,0,0,0,0,0,0}
	};
	
	@Override
	protected void handleTextMessage(WebSocketSession session,
			TextMessage message) throws Exception {
		//메시지의 유형 [roomNo]:[action]:[value]:...
		String[] received = message.getPayload().split(":");
		if(received[0]!=null&&received[1].equals("enter")){
			//1. action> enter
			Room thisRoom = rooms.get(received[0]);
			if(thisRoom==null){
				//새 방이 없으면, 새 방을 생성 후 흑돌 유저로 지정
				thisRoom = new Room(session,received[2]);
				rooms.put(received[0], thisRoom);
				session.sendMessage(new TextMessage("side:black"));
			}else{
				//이미 만들어진 방에 들어가는 경우, 백돌 유저로 지정
				thisRoom.setWhiteUser(session);
				thisRoom.setWhiteNick(received[2]);
				rooms.put(received[0], thisRoom);
				session.sendMessage(new TextMessage("side:white"));
			}
			//해당 room의 키를 가진 전부에게 방장의 닉네임을 메시지로 보냄
			thisRoom.getBlackUser().sendMessage(new TextMessage("enter:blackNick:"+thisRoom.getBlackNick()));
			if(thisRoom.getWhiteUser()!=null){
				thisRoom.getWhiteUser().sendMessage(new TextMessage("enter:blackNick:"+thisRoom.getBlackNick()));
				
			}
		}
		else if(received[0]!=null&&received[1].equals("ready")){
			//2. action> ready(백돌 유저의 게임 레디로 게임을 시작)
			//방 번호를 가져와 기본 배열을 세팅
			Room thisRoom = rooms.get(received[0]);
			thisRoom.setMatrix(matrix);
			//'ready' 메시지를 보낸 백돌 유저의 아이디와 게임 시작을 알림
			thisRoom.getBlackUser().sendMessage(new TextMessage("enter:whiteNick:"+thisRoom.getWhiteNick()));
			thisRoom.getWhiteUser().sendMessage(new TextMessage("enter:whiteNick:"+thisRoom.getWhiteNick()));
			thisRoom.getBlackUser().sendMessage(new TextMessage("start"));
			thisRoom.getWhiteUser().sendMessage(new TextMessage("start"));
			
		}
		else if(received[0]!=null&&received[1].equals("black")){
			//black의 턴 넘김 메시지 받음 ex) 3:black:41
			int idx = Integer.parseInt(received[2]);
			int x = (idx-1)/8; int y = (idx-1)%8;
			Room thisRoom = rooms.get(received[0]);
			matrix = thisRoom.getMatrix();
			//전부 뒤집은 후에 새 돌 삽입
			flipStone(matrix, x, y, "black");
			matrix[x][y] = 1;
			thisRoom.setMatrix(matrix);
			//현재 배열 프린트
			thisRoom.getBlackUser().sendMessage(new TextMessage(boardRecord(matrix)));
			thisRoom.getWhiteUser().sendMessage(new TextMessage(boardRecord(matrix)));
			//black, white의 행동 가능 여부 계산 ->black,white 행동불가시 게임종료, white 행동불가시 black턴, white 행동가능시 white턴
			String turnOverMsg = getClickable(matrix, "white",0);
			thisRoom.getBlackUser().sendMessage(new TextMessage(turnOverMsg));
			thisRoom.getWhiteUser().sendMessage(new TextMessage(turnOverMsg));
		}
		else if(received[0]!=null&&received[1].equals("white")){
			//white의 턴 넘김 메시지 받음 ex) 3:white:41
			int idx = Integer.parseInt(received[2]);
			int x = (idx-1)/8; int y = (idx-1)%8;
			Room thisRoom = rooms.get(received[0]);
			matrix = thisRoom.getMatrix();
			//전부 뒤집은 후에 새 돌 삽입
			flipStone(matrix, x, y, "white");
			matrix[x][y] = 2;
			thisRoom.setMatrix(matrix);
			//현재 배열 프린트
			thisRoom.getBlackUser().sendMessage(new TextMessage(boardRecord(matrix)));
			thisRoom.getWhiteUser().sendMessage(new TextMessage(boardRecord(matrix)));
			//black, white의 행동 가능 여부 계산 ->black,white 행동불가시 게임종료, black 행동불가시 white턴, black 행동가능시 black턴
			String turnOverMsg = getClickable(matrix, "black",0);
			thisRoom.getBlackUser().sendMessage(new TextMessage(turnOverMsg));
			thisRoom.getWhiteUser().sendMessage(new TextMessage(turnOverMsg));
		}
	}

	@Override
	public void afterConnectionEstablished(WebSocketSession session)
			throws Exception {
		session.sendMessage(new TextMessage("안녕 성공적으로 서버와 연결되었어!"));
		System.out.println("연결됨");
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session,
			CloseStatus status) throws Exception {
		//탈주, 방 퇴장 처리
		System.out.println("연결 끊김");
	}
	
	public String boardRecord(int[][] matrix){
		//백흑 양쪽으로 board:black:1:4:7,... white:3,8,...등을 보낸다.
		String black = "black";
		String white = ":white";
		for(int i=0;i<8;i++){
			for(int j=0;j<8;j++){
				if(matrix[i][j]==1){
					black = black+":"+(i*8+j);
				}else if(matrix[i][j]==2){
					white = white+":"+(i*8+j);
				}
			}
		}
		return black+white;
	}
	
	public void flipStone(int[][] matrix, int x, int y, String side){
		if(side.equals("black")){
			
			//left-top
			int counter=0; //뒤집을 개수를 세어준다! 모든 플립작업 전 필요
			int tempX; int tempY;
			if(x>1&&y>1){
				tempX = x; tempY= y;
				while(tempX-1>=0&&tempY-1>=0&&counter!=-1){
					switch(matrix[tempX-1][tempY-1]){
					case 0: counter=-1; break;
					case 1: if(counter==0) counter =-1;
							else{
								for(int k=1;k<=counter;k++){
									matrix[x-k][y-k] = 1;
								} counter=-1; break;
							}
					case 2: counter++; break;
					}
					tempX--; tempY--;
				}
			}
			
			//right-top
			counter=0; //뒤집을 개수를 세어준다! 모든 플립작업 전 필요
			if(x>1&&y<6){
				tempX = x; tempY= y;
				while(tempX-1>=0&&tempY+1<8&&counter!=-1){
					switch(matrix[tempX-1][tempY+1]){
					case 0: counter=-1; break;
					case 1: if(counter==0) counter =-1;
							else{
								for(int k=1;k<=counter;k++){
									matrix[x-k][y+k] = 1;
								} counter=-1; break;
							}
					case 2: counter++; break;
					}
					tempX--; tempY++;
				}
			}
			
			//right-bottom
			counter=0; //뒤집을 개수를 세어준다! 모든 플립작업 전 필요
			if(x<6&&y<6){
				tempX = x; tempY= y;
				while(tempX+1<8&&tempY+1<8&&counter!=-1){
					switch(matrix[tempX+1][tempY+1]){
					case 0: counter=-1; break;
					case 1: if(counter==0) counter =-1;
							else{
								for(int k=1;k<=counter;k++){
									matrix[x+k][y+k] = 1;
								} counter=-1; break;
							}
					case 2: counter++; break;
					}
					tempX++; tempY++;
				}
			}

			//left-bottom
			counter=0; //뒤집을 개수를 세어준다! 모든 플립작업 전 필요
			if(x<6&&y>1){
				tempX = x; tempY= y;
				while(tempX+1<8&&tempY-1>=0&&counter!=-1){
					switch(matrix[tempX+1][tempY-1]){
					case 0: counter=-1; break;
					case 1: if(counter==0) counter =-1;
							else{
								for(int k=1;k<=counter;k++){
									matrix[x+k][y-k] = 1;
								} counter=-1; break;
							}
					case 2: counter++; break;
					}
					tempX++; tempY--;
				}
			}
			
			//left
			counter=0;
			if(y>1){
				tempY= y;
				while(tempY-1>=0&&counter!=-1){
					switch(matrix[x][tempY-1]){
					case 0: counter=-1; break;
					case 1: if(counter==0) counter =-1;
							else{
								for(int k=1;k<=counter;k++){
									matrix[x][y-k] = 1;
								} counter=-1; break;
							}
					case 2: counter++; break;
					}
					tempY--;
				}
			}
			
			//right
			counter=0;
			if(y<6){
				tempY= y;
				while(tempY+1<8&&counter!=-1){
					switch(matrix[x][tempY+1]){
					case 0: counter=-1; break;
					case 1: if(counter==0) counter =-1;
							else{
								for(int k=1;k<=counter;k++){
									matrix[x][y+k] = 1;
								} counter=-1; break;
							}
					case 2: counter++; break;
					}
					tempY++;
				}
			}
			//top
			counter=0;
			if(x>1){
				tempX= x;
				while(tempX-1>=0&&counter!=-1){
					switch(matrix[tempX-1][y]){
					case 0: counter=-1; break;
					case 1: if(counter==0) counter =-1;
							else{
								for(int k=1;k<=counter;k++){
									matrix[x-k][y] = 1;
								} counter=-1; break;
							}
					case 2: counter++; break;
					}
					tempX--;
				}
			}
			//bottom
			counter=0;
			if(x<6){
				tempX= x;
				while(tempX+1<8&&counter!=-1){
					switch(matrix[tempX+1][y]){
					case 0: counter=-1; break;
					case 1: if(counter==0) counter =-1;
							else{
								for(int k=1;k<=counter;k++){
									matrix[x+k][y] = 1;
								} counter=-1; break;
							}
					case 2: counter++; break;
					}
					tempX++;
				}
			}
			
		}else if(side.equals("white")){
			
			//left-top
			int counter=0; //뒤집을 개수를 세어준다! 모든 플립작업 전 필요
			int tempX; int tempY;
			if(x>1&&y>1){
				tempX = x; tempY= y;
				while(tempX-1>=0&&tempY-1>=0&&counter!=-1){
					switch(matrix[tempX-1][tempY-1]){
					case 0: counter=-1; break;
					case 2: if(counter==0) counter =-1;
							else{
								for(int k=1;k<=counter;k++){
									matrix[x-k][y-k] = 2;
								} counter=-1; break;
							}
					case 1: counter++; break;
					}
					tempX--; tempY--;
				}
			}
			
			//right-top
			counter=0; //뒤집을 개수를 세어준다! 모든 플립작업 전 필요
			if(x>1&&y<6){
				tempX = x; tempY= y;
				while(tempX-1>=0&&tempY+1<8&&counter!=-1){
					switch(matrix[tempX-1][tempY+1]){
					case 0: counter=-1; break;
					case 2: if(counter==0) counter =-1;
							else{
								for(int k=1;k<=counter;k++){
									matrix[x-k][y+k] = 2;
								} counter=-1; break;
							}
					case 1: counter++; break;
					}
					tempX--; tempY++;
				}
			}
			
			//right-bottom
			counter=0; //뒤집을 개수를 세어준다! 모든 플립작업 전 필요
			if(x<6&&y<6){
				tempX = x; tempY= y;
				while(tempX+1<8&&tempY+1<8&&counter!=-1){
					switch(matrix[tempX+1][tempY+1]){
					case 0: counter=-1; break;
					case 2: if(counter==0) counter =-1;
							else{
								for(int k=1;k<=counter;k++){
									matrix[x+k][y+k] = 2;
								} counter=-1; break;
							}
					case 1: counter++; break;
					}
					tempX++; tempY++;
				}
			}

			//left-bottom
			counter=0; //뒤집을 개수를 세어준다! 모든 플립작업 전 필요
			if(x<6&&y>1){
				tempX = x; tempY= y;
				while(tempX+1<8&&tempY-1>=0&&counter!=-1){
					switch(matrix[tempX+1][tempY-1]){
					case 0: counter=-1; break;
					case 2: if(counter==0) counter =-1;
							else{
								for(int k=1;k<=counter;k++){
									matrix[x+k][y-k] = 2;
								} counter=-1; break;
							}
					case 1: counter++; break;
					}
					tempX++; tempY--;
				}
			}
			
			//left
			counter=0;
			if(y>1){
				tempY= y;
				while(tempY-1>=0&&counter!=-1){
					switch(matrix[x][tempY-1]){
					case 0: counter=-1; break;
					case 2: if(counter==0) counter =-1;
							else{
								for(int k=1;k<=counter;k++){
									matrix[x][y-k] = 2;
								} counter=-1; break;
							}
					case 1: counter++; break;
					}
					tempY--;
				}
			}
			
			//right
			counter=0;
			if(y<6){
				tempY= y;
				while(tempY+1<8&&counter!=-1){
					switch(matrix[x][tempY+1]){
					case 0: counter=-1; break;
					case 2: if(counter==0) counter =-1;
							else{
								for(int k=1;k<=counter;k++){
									matrix[x][y+k] = 2;
								} counter=-1; break;
							}
					case 1: counter++; break;
					}
					tempY++;
				}
			}
			//top
			counter=0;
			if(x>1){
				tempX= x;
				while(tempX-1>=0&&counter!=-1){
					switch(matrix[tempX-1][y]){
					case 0: counter=-1; break;
					case 2: if(counter==0) counter =-1;
							else{
								for(int k=1;k<=counter;k++){
									matrix[x-k][y] = 2;
								} counter=-1; break;
							}
					case 1: counter++; break;
					}
					tempX--;
				}
			}
			//bottom
			counter=0;
			if(x<6){
				tempX= x;
				while(tempX+1<8&&counter!=-1){
					switch(matrix[tempX+1][y]){
					case 0: counter=-1; break;
					case 2: if(counter==0) counter =-1;
							else{
								for(int k=1;k<=counter;k++){
									matrix[x+k][y] = 2;
								} counter=-1; break;
							}
					case 1: counter++; break;
					}
					tempX++;
				}
			}
		}
	}//flipStone() end

	
	public String getClickable(int[][] matrix, String side, int endCnt){
		String clickableMsg="clickable";
		//클릭 가능 위치 계산
		int counter=0;
		int tempX; int tempY;
		int clickable[][] = {
				{0,0,0,0,0,0,0,0},
				{0,0,0,0,0,0,0,0},
				{0,0,0,0,0,0,0,0},
				{0,0,0,0,0,0,0,0},
				{0,0,0,0,0,0,0,0},
				{0,0,0,0,0,0,0,0},
				{0,0,0,0,0,0,0,0},
				{0,0,0,0,0,0,0,0}
		};
		
		
		if(side.equals("black")){
			clickableMsg = clickableMsg+":black";
			//left-top
			for(int m=0;m<8;m++){
				for(int n=0;n<8;n++){
					tempX = m; tempY= n;
					if(matrix[tempX][tempY]==0){
						while(tempX-1>=0&&tempY-1>=0&&counter!=-1){
							switch(matrix[tempX-1][tempY-1]){
							case 0: counter =-1;
									break;
							case 1:
								if(counter==0){
									counter=-1;
									break;
								}
								else{
									clickable[m][n]=1;
									clickableMsg = clickableMsg+":"+(m*8+n);
									counter=-1;
									break;
								}
							case 2:
								counter=1;
								break;
							}
							tempX--; tempY--;
						}//end while()
					}
					counter=0;
				}
			}
			//right-top
			for(int m=0;m<8;m++){
				for(int n=0;n<8;n++){
					tempX = m; tempY= n;
					if(matrix[tempX][tempY]==0){
						while(tempX-1>=0&&tempY+1<8&&counter!=-1){
							switch(matrix[tempX-1][tempY+1]){
							case 0: counter =-1;
									break;
							case 1:
								if(counter==0){
									counter=-1;
									break;
								}
								else{
									clickable[m][n]=1;
									clickableMsg = clickableMsg+":"+(m*8+n);
									counter=-1;
									break;
								}
							case 2:
								counter=1;
								break;
							}
							tempX--; tempY++;
						}//end while()
					}
					counter=0;
				}
			}
			//right-bottom
			for(int m=0;m<8;m++){
				for(int n=0;n<8;n++){
					tempX = m; tempY= n;
					if(matrix[tempX][tempY]==0){
						while(tempX+1<8&&tempY+1<8&&counter!=-1){
							switch(matrix[tempX+1][tempY+1]){
							case 0: counter =-1;
									break;
							case 1:
								if(counter==0){
									counter=-1;
									break;
								}
								else{
									clickable[m][n]=1;
									clickableMsg = clickableMsg+":"+(m*8+n);
									counter=-1;
									break;
								}
							case 2:
								counter=1;
								break;
							}
							tempX++; tempY++;
						}//end while()
					}
					counter=0;
				}
			}
			//left-bottom
			for(int m=0;m<8;m++){
				for(int n=0;n<8;n++){
					tempX = m; tempY= n;
					if(matrix[tempX][tempY]==0){
						while(tempX+1<8&&tempY-1>=0&&counter!=-1){
							switch(matrix[tempX+1][tempY-1]){
							case 0: counter =-1;
									break;
							case 1:
								if(counter==0){
									counter=-1;
									break;
								}
								else{
									clickable[m][n]=1;
									clickableMsg = clickableMsg+":"+(m*8+n);
									counter=-1;
									break;
								}
							case 2:
								counter=1;
								break;
							}
							tempX++; tempY--;
						}//end while()
					}
					counter=0;
				}
			}
			
			//left
			for(int m=0;m<8;m++){
				for(int n=0;n<8;n++){
					tempX = m; tempY= n;
					if(matrix[tempX][tempY]==0){
						while(tempY-1>=0&&counter!=-1){
							switch(matrix[tempX][tempY-1]){
							case 0: counter =-1;
									break;
							case 1:
								if(counter==0){
									counter=-1;
									break;
								}
								else{
									clickable[m][n]=1;
									clickableMsg = clickableMsg+":"+(m*8+n);
									counter=-1;
									break;
								}
							case 2:
								counter=1;
								break;
							}
							tempY--;
						}//end while()
					}
					counter=0;
				}
			}
			//top
			for(int m=0;m<8;m++){
				for(int n=0;n<8;n++){
					tempX = m; tempY= n;
					if(matrix[tempX][tempY]==0){
						while(tempX-1>=0&&counter!=-1){
							switch(matrix[tempX-1][tempY]){
							case 0: counter =-1;
									break;
							case 1:
								if(counter==0){
									counter=-1;
									break;
								}
								else{
									clickable[m][n]=1;
									clickableMsg = clickableMsg+":"+(m*8+n);
									counter=-1;
									break;
								}
							case 2:
								counter=1;
								break;
							}
							tempX--;
						}//end while()
					}
					counter=0;
				}
			}
			//right
			for(int m=0;m<8;m++){
				for(int n=0;n<8;n++){
					tempX = m; tempY= n;
					if(matrix[tempX][tempY]==0){
						while(tempY+1<8&&counter!=-1){
							switch(matrix[tempX][tempY+1]){
							case 0: counter =-1;
									break;
							case 1:
								if(counter==0){
									counter=-1;
									break;
								}
								else{
									clickable[m][n]=1;
									clickableMsg = clickableMsg+":"+(m*8+n);
									counter=-1;
									break;
								}
							case 2:
								counter=1;
								break;
							}
							tempY++;
						}//end while()
					}
					counter=0;
				}
			}
			//bottom
			for(int m=0;m<8;m++){
				for(int n=0;n<8;n++){
					tempX = m; tempY= n;
					if(matrix[tempX][tempY]==0){
						while(tempX+1<8&&counter!=-1){
							switch(matrix[tempX+1][tempY]){
							case 0: counter =-1;
									break;
							case 1:
								if(counter==0){
									counter=-1;
									break;
								}
								else{
									clickable[m][n]=1;
									clickableMsg = clickableMsg+":"+(m*8+n);
									counter=-1;
									break;
								}
							case 2:
								counter=1;
								break;
							}
							tempX++;
						}//end while()
					}
					counter=0;
				}
			}
			//클릭할 것이 없으면 게임 종료 여부 판정함
			if(clickableMsg.equals("clickable:black")){
				if(endCnt==1){
					clickableMsg = "gameend";
				}else{
					clickableMsg = getClickable(matrix, "white", 1);
				}
				/*String otherSide = getClickable(matrix,"white");
				if(otherSide.equals("clickable:white")){
					clickableMsg = "gameend";
				}else{
					clickableMsg = otherSide;
				}*/
			}
		}else if(side.equals("white")){
			clickableMsg = clickableMsg+":white";
			//left-top
			for(int m=0;m<8;m++){
				for(int n=0;n<8;n++){
					tempX = m; tempY= n;
					if(matrix[tempX][tempY]==0){
						while(tempX-1>=0&&tempY-1>=0&&counter!=-1){
							switch(matrix[tempX-1][tempY-1]){
							case 0: counter =-1;
									break;
							case 2:
								if(counter==0){
									counter=-1;
									break;
								}
								else{
									clickable[m][n]=1;
									clickableMsg = clickableMsg+":"+(m*8+n);
									counter=-1;
									break;
								}
							case 1:
								counter=1;
								break;
							}
							tempX--; tempY--;
						}//end while()
					}
					counter=0;
				}
			}
			//right-top
			for(int m=0;m<8;m++){
				for(int n=0;n<8;n++){
					tempX = m; tempY= n;
					if(matrix[tempX][tempY]==0){
						while(tempX-1>=0&&tempY+1<8&&counter!=-1){
							switch(matrix[tempX-1][tempY+1]){
							case 0: counter =-1;
									break;
							case 2:
								if(counter==0){
									counter=-1;
									break;
								}
								else{
									clickable[m][n]=1;
									clickableMsg = clickableMsg+":"+(m*8+n);
									counter=-1;
									break;
								}
							case 1:
								counter=1;
								break;
							}
							tempX--; tempY++;
						}//end while()
					}
					counter=0;
				}
			}
			//right-bottom
			for(int m=0;m<8;m++){
				for(int n=0;n<8;n++){
					tempX = m; tempY= n;
					if(matrix[tempX][tempY]==0){
						while(tempX+1<8&&tempY+1<8&&counter!=-1){
							switch(matrix[tempX+1][tempY+1]){
							case 0: counter =-1;
									break;
							case 2:
								if(counter==0){
									counter=-1;
									break;
								}
								else{
									clickable[m][n]=1;
									clickableMsg = clickableMsg+":"+(m*8+n);
									counter=-1;
									break;
								}
							case 1:
								counter=1;
								break;
							}
							tempX++; tempY++;
						}//end while()
					}
					counter=0;
				}
			}
			//left-bottom
			for(int m=0;m<8;m++){
				for(int n=0;n<8;n++){
					tempX = m; tempY= n;
					if(matrix[tempX][tempY]==0){
						while(tempX+1<8&&tempY-1>=0&&counter!=-1){
							switch(matrix[tempX+1][tempY-1]){
							case 0: counter =-1;
									break;
							case 2:
								if(counter==0){
									counter=-1;
									break;
								}
								else{
									clickable[m][n]=1;
									clickableMsg = clickableMsg+":"+(m*8+n);
									counter=-1;
									break;
								}
							case 1:
								counter=1;
								break;
							}
							tempX++; tempY--;
						}//end while()
					}
					counter=0;
				}
			}
			
			//left
			for(int m=0;m<8;m++){
				for(int n=0;n<8;n++){
					tempX = m; tempY= n;
					if(matrix[tempX][tempY]==0){
						while(tempY-1>=0&&counter!=-1){
							switch(matrix[tempX][tempY-1]){
							case 0: counter =-1;
									break;
							case 2:
								if(counter==0){
									counter=-1;
									break;
								}
								else{
									clickable[m][n]=1;
									clickableMsg = clickableMsg+":"+(m*8+n);
									counter=-1;
									break;
								}
							case 1:
								counter=1;
								break;
							}
							tempY--;
						}//end while()
					}
					counter=0;
				}
			}
			//top
			for(int m=0;m<8;m++){
				for(int n=0;n<8;n++){
					tempX = m; tempY= n;
					if(matrix[tempX][tempY]==0){
						while(tempX-1>=0&&counter!=-1){
							switch(matrix[tempX-1][tempY]){
							case 0: counter =-1;
									break;
							case 2:
								if(counter==0){
									counter=-1;
									break;
								}
								else{
									clickable[m][n]=1;
									clickableMsg = clickableMsg+":"+(m*8+n);
									counter=-1;
									break;
								}
							case 1:
								counter=1;
								break;
							}
							tempX--;
						}//end while()
					}
					counter=0;
				}
			}
			//right
			for(int m=0;m<8;m++){
				for(int n=0;n<8;n++){
					tempX = m; tempY= n;
					if(matrix[tempX][tempY]==0){
						while(tempY+1<8&&counter!=-1){
							switch(matrix[tempX][tempY+1]){
							case 0: counter =-1;
									break;
							case 2:
								if(counter==0){
									counter=-1;
									break;
								}
								else{
									clickable[m][n]=1;
									clickableMsg = clickableMsg+":"+(m*8+n);
									counter=-1;
									break;
								}
							case 1:
								counter=1;
								break;
							}
							tempY++;
						}//end while()
					}
					counter=0;
				}
			}
			//bottom
			for(int m=0;m<8;m++){
				for(int n=0;n<8;n++){
					tempX = m; tempY= n;
					if(matrix[tempX][tempY]==0){
						while(tempX+1<8&&counter!=-1){
							switch(matrix[tempX+1][tempY]){
							case 0: counter =-1;
									break;
							case 2:
								if(counter==0){
									counter=-1;
									break;
								}
								else{
									clickable[m][n]=1;
									clickableMsg = clickableMsg+":"+(m*8+n);
									counter=-1;
									break;
								}
							case 1:
								counter=1;
								break;
							}
							tempX++;
						}//end while()
					}
					counter=0;
				}
			}
			if(clickableMsg.equals("clickable:white")){
				if(endCnt==1){
					clickableMsg = "gameend";
				}else{
					clickableMsg = getClickable(matrix, "black", 1);
				}
			}
		}
		return clickableMsg;
	}
}
