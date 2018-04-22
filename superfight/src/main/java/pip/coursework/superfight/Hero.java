package pip.coursework.superfight;

import javax.persistence.*;

@Entity
@Table(name="hero",schema = "public")
public class Hero {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE,generator = "herogen")
    @SequenceGenerator(name = "herogen",sequenceName = "hero_id_seq")
    private long id;
    private String name;
    private int strength;
    private int agility;
    public Hero(){

    }
    public long getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public int getStrength() {
        return strength;
    }

    public int getAgility() {
        return agility;
    }

}
