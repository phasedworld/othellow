package parkjieun.othellow;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class Main {
	@Value("${uploadDir}")
	private String uploadDir;
	
	@RequestMapping("/")
	public String main(){
		return "main";
	}
	
	@RequestMapping(value="/headUpload", method=RequestMethod.POST)
	@ResponseBody
	public boolean uploadHead(HttpServletRequest request, MultipartFile headImg){
      boolean isStored = true;
      String dir = request.getSession().getServletContext().getRealPath(uploadDir);
      String fileName = "headerImg.png";
      try {
         save(dir+"/"+fileName, headImg);
      } catch (IOException e) {
         isStored = false;
      }
      return isStored;
   }
   
   private void save(String fileFullName, MultipartFile uploadFile) throws IOException{
	  uploadFile.transferTo(new File(fileFullName));
   }
}
