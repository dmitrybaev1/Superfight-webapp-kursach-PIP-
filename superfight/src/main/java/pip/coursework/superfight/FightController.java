package pip.coursework.superfight;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.jws.WebParam;

@Controller
public class FightController {
    final int coeff=5;
    @Autowired
    HeroRepository heroRepository;
    @RequestMapping(value = "/choose",method = RequestMethod.POST)
    public String choose(){
        return "chooseheroes";
    }
    @RequestMapping(value = "/fight",method = RequestMethod.POST)
    public ModelAndView fight(@RequestParam("userhero") String userhero,@RequestParam("enemyhero") String enemyhero){
        ModelAndView modelAndView = new ModelAndView();
        long hp;
        switch (enemyhero){
            case "hero1":
                modelAndView.addObject("pathToEnemy","../images/superman.jpg");
                modelAndView.addObject("nameEnemy","Супермен");
                Hero superman = heroRepository.findByName("Superman");
                hp = (superman.getStrength()+superman.getAgility())*coeff;
                modelAndView.addObject("hpEnemy",hp);
                break;
            case "hero2":
                modelAndView.addObject("pathToEnemy","../images/batman.jpg");
                modelAndView.addObject("nameEnemy","Бэтмен");
                Hero batman = heroRepository.findByName("Batman");
                hp = (batman.getStrength()+batman.getAgility())*coeff;
                modelAndView.addObject("hpEnemy",hp);
                break;
            case "hero3":
                modelAndView.addObject("pathToEnemy","../images/spiderman.jpg");
                modelAndView.addObject("nameEnemy","Человек-паук");
                Hero spiderman = heroRepository.findByName("Spiderman");
                hp = (spiderman.getStrength()+spiderman.getAgility())*coeff;
                modelAndView.addObject("hpEnemy",hp);
                break;
            case "hero4":
                modelAndView.addObject("pathToEnemy","../images/hulk.jpg");
                modelAndView.addObject("nameEnemy","Халк");
                Hero hulk = heroRepository.findByName("Hulk");
                hp = (hulk.getStrength()+hulk.getAgility())*coeff;
                modelAndView.addObject("hpEnemy",hp);
                break;
            default:
                modelAndView.setViewName("error_login");
                return modelAndView;
        }
        switch (userhero){
            case "hero1":
                modelAndView.addObject("pathToHero","../images/superman.jpg");
                modelAndView.addObject("name","Супермен");
                Hero superman = heroRepository.findByName("Superman");
                hp = (superman.getStrength()+superman.getAgility())*coeff;
                modelAndView.addObject("hp",hp);
                break;
            case "hero2":
                modelAndView.addObject("pathToHero","../images/batman.jpg");
                modelAndView.addObject("name","Бэтмен");
                Hero batman = heroRepository.findByName("Batman");
                hp = (batman.getStrength()+batman.getAgility())*coeff;
                modelAndView.addObject("hp",hp);
                break;
            case "hero3":
                modelAndView.addObject("pathToHero","../images/spiderman.jpg");
                modelAndView.addObject("name","Человек-паук");
                Hero spiderman = heroRepository.findByName("Spiderman");
                hp = (spiderman.getStrength()+spiderman.getAgility())*coeff;
                modelAndView.addObject("hp",hp);
                break;
            case "hero4":
                modelAndView.addObject("pathToHero","../images/hulk.jpg");
                modelAndView.addObject("name","Халк");
                Hero hulk = heroRepository.findByName("Hulk");
                hp = (hulk.getStrength()+hulk.getAgility())*coeff;
                modelAndView.addObject("hp",hp);
                break;
            default:
                modelAndView.setViewName("error_login");
                return modelAndView;
        }
        modelAndView.setViewName("fight");
        return modelAndView;
    }
}
