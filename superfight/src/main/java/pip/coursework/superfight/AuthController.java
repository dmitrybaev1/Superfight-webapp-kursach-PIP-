package pip.coursework.superfight;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;

@Controller
public class AuthController {
    User user;
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
    @RequestMapping(value = "/login",method = RequestMethod.POST)
    public ModelAndView login(@RequestParam("login") String login,@RequestParam("password") String password,HttpSession httpSession){
        ModelAndView modelAndView = new ModelAndView();
        user = userRepository.findByLoginAndPassword(login,password);
        if(user!=null){
            httpSession.setAttribute("user",user);
            modelAndView = getAttrs(modelAndView);
            modelAndView.setViewName("main");
            return modelAndView;
        }
        else{
            modelAndView.setViewName("error_login");
            return modelAndView;
        }
    }
    @RequestMapping(value = "/back_from_error",method = RequestMethod.GET)
    public String back(){
        return "index";
    }
    @RequestMapping(value = "/reg",method = RequestMethod.POST)
    public ModelAndView reg(HttpSession session,@RequestParam("login") String login, @RequestParam("password") String password, @RequestParam("mail") String mail){
        ModelAndView modelAndView = new ModelAndView();
        user = new User(login,mail,password);
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
        modelAndView = getAttrs(modelAndView);
        modelAndView.setViewName("main");
        return modelAndView;
    }
    @RequestMapping(value = "/quit",method = RequestMethod.POST)
    public String quit(HttpSession session){
        session.invalidate();
        return "index";
    }
    ModelAndView getAttrs(ModelAndView modelAndView){
        long countwin,countlose,lvl;
        ProgressId progressId;
        superman = heroRepository.findByName("Superman");
        batman = heroRepository.findByName("Batman");
        spiderman = heroRepository.findByName("Spiderman");
        hulk = heroRepository.findByName("Hulk");
        //SUPERMAN
        countwin = battleRepository.countByUserIdAndHeroIdAndResult(user,superman,"w");
        modelAndView.addObject("supermanwins",countwin);
        countlose = battleRepository.countByUserIdAndHeroIdAndResult(user,superman,"l");
        modelAndView.addObject("supermanloses",countlose);
        progressId = new ProgressId(superman,user);
        lvl = progressRepository.findById(progressId).getLevel();
        modelAndView.addObject("supermanlvl",lvl);
        //BATMAN
        countwin = battleRepository.countByUserIdAndHeroIdAndResult(user,batman,"w");
        modelAndView.addObject("batmanwins",countwin);
        countlose = battleRepository.countByUserIdAndHeroIdAndResult(user,batman,"l");
        modelAndView.addObject("batmanloses",countlose);
        progressId = new ProgressId(batman,user);
        lvl = progressRepository.findById(progressId).getLevel();
        modelAndView.addObject("batmanlvl",lvl);
        //SPIDERMAN
        countwin = battleRepository.countByUserIdAndHeroIdAndResult(user,spiderman,"w");
        modelAndView.addObject("spidermanwins",countwin);
        countlose = battleRepository.countByUserIdAndHeroIdAndResult(user,spiderman,"l");
        modelAndView.addObject("spidermanloses",countlose);
        progressId = new ProgressId(spiderman,user);
        lvl = progressRepository.findById(progressId).getLevel();
        modelAndView.addObject("spidermanlvl",lvl);
        //HULK
        countwin = battleRepository.countByUserIdAndHeroIdAndResult(user,hulk,"w");
        modelAndView.addObject("hulkwins",countwin);
        countlose = battleRepository.countByUserIdAndHeroIdAndResult(user,hulk,"l");
        modelAndView.addObject("hulkloses",countlose);
        progressId = new ProgressId(hulk,user);
        lvl = progressRepository.findById(progressId).getLevel();
        modelAndView.addObject("hulklvl",lvl);
        return modelAndView;
    }
}