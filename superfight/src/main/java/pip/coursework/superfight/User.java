package pip.coursework.superfight;

import javax.persistence.*;

@Entity
@Table(name = "user",schema = "public")
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE,generator = "seq")
    @SequenceGenerator(name = "seq",sequenceName = "seq")
    private long id;
    private String login;
    private String mail;
    private String password;
    public User(String login,String mail,String password){
        this.login = login;
        this.mail = mail;
        this.password = password;
    }
}
