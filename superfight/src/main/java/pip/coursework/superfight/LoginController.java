package pip.coursework.superfight;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LoginController {
    @Autowired
    UserRepository repository;
    @RequestMapping(value = "/login",method = RequestMethod.POST)
    public String login(@RequestParam("login") String login,@RequestParam("password") String password){
        if(repository.findByLoginAndPassword(login,password).size()!=0){
            return "main";
        }
        else{
            return "error_login";
        }
    }
    @RequestMapping(value = "/back_from_error",method = RequestMethod.GET)
    public String back(){
        return "index";
    }
    @RequestMapping(value = "/reg",method = RequestMethod.POST)
    public String reg(@RequestParam("login") String login,@RequestParam("password") String password,@RequestParam("mail") String mail){
        repository.save(new User(login,mail,password));
        return "main";
    }
}
