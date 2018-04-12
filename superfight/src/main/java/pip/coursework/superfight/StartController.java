package pip.coursework.superfight;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class StartController {
    @RequestMapping(value = "/")
    public String welcome(){
        return "index";
    }
}
