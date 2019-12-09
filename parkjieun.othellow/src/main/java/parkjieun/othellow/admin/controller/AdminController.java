package parkjieun.othellow.admin.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.apache.catalina.authenticator.SavedRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import parkjieun.othellow.admin.domain.Character;
import parkjieun.othellow.admin.service.CharacterService;

@Controller
public class AdminController {
	@Autowired CharacterService characterService;
	
	@Value("${uploadDir}")
	private String uploadDir;
	//t6y73444444444u48hh
	
	@RequestMapping("/admin")
	public String admin(){
		return "admin/adminMain";
	}
	
	@RequestMapping(value="/uploadchar", method=RequestMethod.POST)
	@ResponseBody
	public boolean upload(Character character, MultipartFile charImg, HttpServletRequest request){
		boolean isStored = true;
		String dir = request.getSession().getServletContext().getRealPath(uploadDir);
		System.out.println("dir : "+dir);
		String fileName = charImg.getOriginalFilename();
		try {
			save(dir+"/"+fileName, charImg);
			characterService.addCharacter(character);
		} catch (IOException e) {
			isStored = false;
		}
		return isStored;
	}
	
	private void save(String fileFullName, MultipartFile uploadFile) throws IOException{
		uploadFile.transferTo(new File(fileFullName));
	}
}
