package pip.coursework.superfight;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.logging.Logger;

@Controller
public class AuthController {
    CustomUserDetails user;
    Hero superman;
    Hero batman;
    Hero spiderman;
    Hero hulk;
    @Autowired
    UserRepository userRepository;
    @Autowired
    ProgressRepository progressRepository;
    @Autowired
    HeroRepository heroRepository;
    @Autowired
    BattleRepository battleRepository;
    @Autowired
    HttpSession session;
    private static Logger log = Logger.getLogger(AuthController.class.getName());
    @RequestMapping(value = "/main")
    public ModelAndView afterLogin(Authentication authentication){
        ModelAndView modelAndView = new ModelAndView();
        user = (CustomUserDetails) authentication.getPrincipal();
        modelAndView.addObject("user",user.getUsername());
        //modelAndView.addObject("eff","strrr");
        modelAndView = getAttrs(modelAndView);
        session.setAttribute("user",user.getUsername());
        modelAndView.setViewName("main");
        return modelAndView;
    }
    @RequestMapping(value = "/back_from_error",method = RequestMethod.GET)
    public String back(){
        return "login";
    }
    @RequestMapping(value = "/reg",method = RequestMethod.POST)
    public ModelAndView reg(@RequestParam("login") String login, @RequestParam("password") String password, @RequestParam("mail") String mail){
        ModelAndView modelAndView = new ModelAndView();
        User user = new User(login,mail,password,1);
        session.setAttribute("user",user);
        userRepository.save(user);
        superman = heroRepository.findByName("Superman");
        batman = heroRepository.findByName("Batman");
        spiderman = heroRepository.findByName("Spiderman");
        hulk = heroRepository.findByName("Hulk");
        ProgressId pid1 = new ProgressId(superman,user);
        Progress progress1 = new Progress(pid1,1);
        progressRepository.save(progress1);
        ProgressId pid2 = new ProgressId(batman,user);
        Progress progress2 = new Progress(pid2,1);
        progressRepository.save(progress2);
        ProgressId pid3 = new ProgressId(spiderman,user);
        Progress progress3 = new Progress(pid3,1);
        progressRepository.save(progress3);
        ProgressId pid4 = new ProgressId(hulk,user);
        Progress progress4 = new Progress(pid4,1);
        progressRepository.save(progress4);
       // modelAndView = getAttrs(modelAndView);
        modelAndView.addObject("user",user.getUsername());
        modelAndView.setViewName("login");
        //отправить сообщение с поздравлением о регистрации
        MailSender.send("Добро пожаловать," +user.getUsername()+ "!","Спасибо, что зарегистрировались в Superfight! Прокачивайте героев и сокрушайте врагов!",user.getMail());
        return modelAndView;
    }
    @RequestMapping(value = "/testcreate",method = RequestMethod.POST)
    @ResponseBody
    public String testcreate(@RequestParam("login")String login,@RequestParam("password")String password,@RequestParam("mail")String mail){
        //user = new User(login,mail,password);
        userRepository.save(user);
        return "success";
    }
    @RequestMapping(value = "/testdelete",method = RequestMethod.POST)
    @ResponseBody
    public String testdelete(){
        userRepository.delete(user);
        return "success";
    }
    @RequestMapping(value = "/testupdate",method = RequestMethod.POST)
    @ResponseBody
    public String testupdate(){
        User usr = userRepository.findByUsernameAndPassword(user.getUsername(),user.getPassword());
        usr.setUsername("updatedLogin");
        userRepository.save(usr);
        return "new login is "+usr.getUsername();
    }
    @RequestMapping(value = "/testselect",method = RequestMethod.POST)
    @ResponseBody
    public String testselect(@RequestParam("login")String login){
        User usr = userRepository.findByUsername(login);
        return usr.getMail();
    }
    @RequestMapping(value = "/remove",method = RequestMethod.POST)
    public String remove(){
        userRepository.delete(userRepository.findByUsername(user.getUsername()));
        return "login";
    }
    public ModelAndView getAttrs(ModelAndView modelAndView){
        long countwin,countlose,lvl,countloseall=0,countwinall=0;
        ProgressId progressId;
        User usr = userRepository.findByUsername(user.getUsername());
        superman = heroRepository.findByName("Superman");
        batman = heroRepository.findByName("Batman");
        spiderman = heroRepository.findByName("Spiderman");
        hulk = heroRepository.findByName("Hulk");
        //SUPERMAN
        countwin = battleRepository.countByUserIdAndHeroIdAndResult(usr,superman,"w");
        modelAndView.addObject("supermanwins",countwin);
        countlose = battleRepository.countByUserIdAndHeroIdAndResult(usr,superman,"l");
        modelAndView.addObject("supermanloses",countlose);
        progressId = new ProgressId(superman,usr);
        lvl = progressRepository.findById(progressId).getLevel();
        modelAndView.addObject("supermanlvl",lvl);
        countwinall+=countwin;
        countloseall+=countlose;
        //BATMAN
        countwin = battleRepository.countByUserIdAndHeroIdAndResult(usr,batman,"w");
        modelAndView.addObject("batmanwins",countwin);
        countlose = battleRepository.countByUserIdAndHeroIdAndResult(usr,batman,"l");
        modelAndView.addObject("batmanloses",countlose);
        progressId = new ProgressId(batman,usr);
        lvl = progressRepository.findById(progressId).getLevel();
        modelAndView.addObject("batmanlvl",lvl);
        countwinall+=countwin;
        countloseall+=countlose;
        //SPIDERMAN
        countwin = battleRepository.countByUserIdAndHeroIdAndResult(usr,spiderman,"w");
        modelAndView.addObject("spidermanwins",countwin);
        countlose = battleRepository.countByUserIdAndHeroIdAndResult(usr,spiderman,"l");
        modelAndView.addObject("spidermanloses",countlose);
        progressId = new ProgressId(spiderman,usr);
        lvl = progressRepository.findById(progressId).getLevel();
        modelAndView.addObject("spidermanlvl",lvl);
        countwinall+=countwin;
        countloseall+=countlose;
        //HULK
        countwin = battleRepository.countByUserIdAndHeroIdAndResult(usr,hulk,"w");
        modelAndView.addObject("hulkwins",countwin);
        countlose = battleRepository.countByUserIdAndHeroIdAndResult(usr,hulk,"l");
        modelAndView.addObject("hulkloses",countlose);
        progressId = new ProgressId(hulk,usr);
        lvl = progressRepository.findById(progressId).getLevel();
        modelAndView.addObject("hulklvl",lvl);
        countwinall+=countwin;
        countloseall+=countlose;
        long countall = countwinall+countloseall;
        modelAndView.addObject("countwin",countwinall);
        modelAndView.addObject("countlose",countloseall);
        modelAndView.addObject("count",countall);
        return modelAndView;
    }
}
