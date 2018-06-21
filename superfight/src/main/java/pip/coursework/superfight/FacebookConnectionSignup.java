package pip.coursework.superfight;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.social.connect.Connection;
import org.springframework.social.connect.ConnectionSignUp;
import org.springframework.social.connect.UserProfile;
import org.springframework.social.facebook.api.Facebook;
import org.springframework.stereotype.Service;
import pip.coursework.superfight.User;
import pip.coursework.superfight.UserRepository;

import javax.annotation.PostConstruct;
import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.util.*;

@Service
public class FacebookConnectionSignup implements ConnectionSignUp {
    @PostConstruct
    private void init() {
        try {
            String[] fieldsToMap = { "id", "about", "age_range", "birthday",
                    "context", "cover", "currency", "devices", "education",
                    "email", "favorite_athletes", "favorite_teams",
                    "first_name", "gender", "hometown", "inspirational_people",
                    "installed", "install_type", "is_verified", "languages",
                    "last_name", "link", "locale", "location", "meeting_for",
                    "middle_name", "name", "name_format", "political",
                    "quotes", "payment_pricepoints", "relationship_status",
                    "religion", "security_settings", "significant_other",
                    "sports", "test_group", "timezone", "third_party_id",
                    "updated_time", "verified", "viewer_can_send_gift",
                    "website", "work" };

            Field field = Class.forName(
                    "org.springframework.social.facebook.api.UserOperations")
                    .getDeclaredField("PROFILE_FIELDS");
            field.setAccessible(true);

            Field modifiers = field.getClass().getDeclaredField("modifiers");
            modifiers.setAccessible(true);
            modifiers.setInt(field, field.getModifiers() & ~Modifier.FINAL);
            field.set(null, fieldsToMap);

        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private ProgressRepository progressRepository;
    @Autowired
    private HeroRepository heroRepository;
    @Override
    public String execute(Connection<?> connection) {
        //UserProfile userProfile = connection.fetchUserProfile();
        Connection<Facebook> confb = (Connection<Facebook>)connection;
        Facebook fb = confb.getApi();
        String[] fields = {"id","email","name"};
        org.springframework.social.facebook.api.User userProfile = fb.fetchObject("me", org.springframework.social.facebook.api.User.class,fields);
        User user = new User(userProfile.getName()+"("+userProfile.getId()+")",userProfile.getEmail(),"-",1,true);
        userRepository.save(user);
        Hero superman = heroRepository.findByName("Superman");
        Hero batman = heroRepository.findByName("Batman");
        Hero spiderman = heroRepository.findByName("Spiderman");
        Hero hulk = heroRepository.findByName("Hulk");
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
        MailSender.send("Добро пожаловать," +user.getUsername()+ "!","Спасибо, что зарегистрировались в Superfight! Прокачивайте героев и сокрушайте врагов!",user.getMail());
        return user.getUsername();
    }

}
