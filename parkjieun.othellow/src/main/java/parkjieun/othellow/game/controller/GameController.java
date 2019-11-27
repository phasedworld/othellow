package parkjieun.othellow.game.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class GameController {
	@RequestMapping("game/lobby")
	public String lobby(){
		return "game/lobby";
	}
	
	@RequestMapping("game/room/{roomNo}")
	public String room(@PathVariable("roomNo")String roomNo,Model model){
		model.addAttribute("roomNo", roomNo);
		return "game/room";
	}
}
