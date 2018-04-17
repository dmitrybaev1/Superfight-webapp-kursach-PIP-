package pip.coursework.superfight;

import javax.persistence.*;
import java.io.Serializable;

@Embeddable
public class ProgressId implements Serializable {
    @ManyToOne
    @JoinColumn(name="id_hero",referencedColumnName = "id")
    private Hero hero;
    @ManyToOne(cascade = CascadeType.REMOVE)
    @JoinColumn(name="id_user",referencedColumnName = "id")
    private User user;

    public Hero getHero() {
        return hero;
    }

    public void setHero(Hero hero) {
        this.hero = hero;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
    public ProgressId(){

    }
    public ProgressId(Hero hero,User user){
        this.hero = hero;
        this.user = user;
    }
}
