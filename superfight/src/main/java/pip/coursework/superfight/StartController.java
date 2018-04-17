package pip.coursework.superfight;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
public class StartController {
    @RequestMapping(value = "/")
    public String welcome(){
        return "index";
    }
}
