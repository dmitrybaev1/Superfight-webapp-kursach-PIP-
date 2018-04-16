package pip.coursework.superfight;

import javax.persistence.*;

@Entity
@Table(name = "battle",schema = "public")
public class Battle {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE,generator = "battle_id_battle_seq")
    @SequenceGenerator(name = "battle_id_battle_seq",sequenceName = "battle_id_battle_seq")
    private long id;
    @ManyToOne
    @JoinColumn(name = "id_hero",referencedColumnName = "id")
    private Hero heroId;
    @ManyToOne
    @JoinColumn(name = "id_enemy",referencedColumnName = "id")
    private Hero enemyId;
    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "id_user",referencedColumnName = "id")
    private User userId;

    private String result;
    public Battle(){

    }
    public String getResult() {
        return result;
    }

    public void setResult(String result) {
        this.result = result;
    }

    public void setUserId(User userId) {
        this.userId = userId;
    }

    public void setHeroId(Hero heroId) {
        this.heroId = heroId;
    }

    public void setEnemyId(Hero enemyId) {
        this.enemyId = enemyId;
    }

    public User getUserId() {
        return userId;
    }

    public Hero getHeroId() {
        return heroId;
    }

    public Hero getEnemyId() {
        return enemyId;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }
}
