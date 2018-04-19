package pip.coursework.superfight;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.jws.WebParam;
import javax.servlet.http.HttpSession;

@Controller
public class FightController {
    final int coeff=5;
    @Autowired
    HeroRepository heroRepository;
    @Autowired
    BattleRepository battleRepository;
    @Autowired
    HttpSession session;
    @Autowired
    AuthController auth;
    @RequestMapping(value = "/choose",method = RequestMethod.POST)
    public String choose(){
        return "chooseheroes";
    }
    @RequestMapping(value = "/fight",method = RequestMethod.POST)
    public ModelAndView fight(@RequestParam("userhero") String userhero, @RequestParam("enemyhero") String enemyhero){
        ModelAndView modelAndView = new ModelAndView();
        long hp,damage,agility;
        switch (enemyhero) {
            case "hero1":
                modelAndView.addObject("pathToEnemy", "../images/superman.jpg");
                modelAndView.addObject("nameEnemy", "Супермен");
                Hero superman = heroRepository.findByName("Superman");
                hp = (superman.getStrength() + superman.getAgility()) * coeff;
                modelAndView.addObject("hpEnemy", hp);
                damage = superman.getStrength();
                modelAndView.addObject("damageEnemy",damage);
                agility = superman.getAgility();
                modelAndView.addObject("agilityEnemy",agility);
                session.setAttribute("enemy", superman);
                break;
            case "hero2":
                modelAndView.addObject("pathToEnemy", "../images/batman.jpg");
                modelAndView.addObject("nameEnemy", "Бэтмен");
                Hero batman = heroRepository.findByName("Batman");
                hp = (batman.getStrength() + batman.getAgility()) * coeff;
                modelAndView.addObject("hpEnemy", hp);
                damage = batman.getStrength();
                modelAndView.addObject("damageEnemy",damage);
                agility = batman.getAgility();
                modelAndView.addObject("agilityEnemy",agility);
                session.setAttribute("enemy", batman);
                break;
            case "hero3":
                modelAndView.addObject("pathToEnemy", "../images/spiderman.jpg");
                modelAndView.addObject("nameEnemy", "Человек-паук");
                Hero spiderman = heroRepository.findByName("Spiderman");
                hp = (spiderman.getStrength() + spiderman.getAgility()) * coeff;
                modelAndView.addObject("hpEnemy", hp);
                damage = spiderman.getStrength();
                modelAndView.addObject("damageEnemy",damage);
                agility = spiderman.getAgility();
                modelAndView.addObject("agilityEnemy",agility);
                session.setAttribute("enemy", spiderman);
                break;
            case "hero4":
                modelAndView.addObject("pathToEnemy", "../images/hulk.jpg");
                modelAndView.addObject("nameEnemy", "Халк");
                Hero hulk = heroRepository.findByName("Hulk");
                hp = (hulk.getStrength() + hulk.getAgility()) * coeff;
                modelAndView.addObject("hpEnemy", hp);
                damage = hulk.getStrength();
                modelAndView.addObject("damageEnemy",damage);
                agility = hulk.getAgility();
                modelAndView.addObject("agilityEnemy",agility);
                session.setAttribute("enemy", hulk);
                break;

        }
        switch (userhero){
            case "hero1":
                modelAndView.addObject("pathToHero","../images/superman.jpg");
                modelAndView.addObject("name","Супермен");
                Hero superman = heroRepository.findByName("Superman");
                hp = (superman.getStrength()+superman.getAgility())*coeff;
                modelAndView.addObject("hp",hp);
                damage = superman.getStrength();
                modelAndView.addObject("damage",damage);
                agility = superman.getAgility();
                modelAndView.addObject("agility",agility);
                session.setAttribute("hero",superman);
                break;
            case "hero2":
                modelAndView.addObject("pathToHero","../images/batman.jpg");
                modelAndView.addObject("name","Бэтмен");
                Hero batman = heroRepository.findByName("Batman");
                hp = (batman.getStrength()+batman.getAgility())*coeff;
                modelAndView.addObject("hp",hp);
                damage = batman.getStrength();
                modelAndView.addObject("damage",damage);
                agility = batman.getAgility();
                modelAndView.addObject("agility",agility);
                session.setAttribute("hero",batman);
                break;
            case "hero3":
                modelAndView.addObject("pathToHero","../images/spiderman.jpg");
                modelAndView.addObject("name","Человек-паук");
                Hero spiderman = heroRepository.findByName("Spiderman");
                hp = (spiderman.getStrength()+spiderman.getAgility())*coeff;
                modelAndView.addObject("hp",hp);
                damage = spiderman.getStrength();
                modelAndView.addObject("damage",damage);
                agility = spiderman.getAgility();
                modelAndView.addObject("agility",agility);
                session.setAttribute("hero",spiderman);
                break;
            case "hero4":
                modelAndView.addObject("pathToHero","../images/hulk.jpg");
                modelAndView.addObject("name","Халк");
                Hero hulk = heroRepository.findByName("Hulk");
                hp = (hulk.getStrength()+hulk.getAgility())*coeff;
                modelAndView.addObject("hp",hp);
                damage = hulk.getStrength();
                modelAndView.addObject("damage",damage);
                agility = hulk.getAgility();
                modelAndView.addObject("agility",agility);
                session.setAttribute("hero",hulk);
                break;
        }
        modelAndView.setViewName("fight");
        return modelAndView;
    }
    @RequestMapping(value = "/result", method = RequestMethod.POST)
    public ModelAndView result(@RequestParam("result") String result){
        ModelAndView modelAndView = new ModelAndView();
        Hero hero = (Hero)session.getAttribute("hero");
        Hero enemy = (Hero)session.getAttribute("enemy");
        User user = (User)session.getAttribute("user");
        Battle battle = new Battle(hero,enemy,user,result);
        battleRepository.save(battle);
        modelAndView = auth.getAttrs(modelAndView);
        modelAndView.addObject("user",user.getLogin());
        modelAndView.setViewName("main");
        return modelAndView;
    }
}
