package pip.coursework.superfight;

import javax.persistence.*;
import java.util.Set;

@Entity
@Table(name = "user",schema = "public")
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE,generator = "seq")
    @SequenceGenerator(name = "seq",sequenceName = "seq")
    private long id;
    private String username;
    private String mail;
    private String password;
    private int active;
    @OneToMany(cascade = CascadeType.REMOVE,fetch = FetchType.EAGER)
    @JoinTable(name="user_role",joinColumns = @JoinColumn(name="user_id"),inverseJoinColumns = @JoinColumn(name="role_id"))
    private Set<Role> role;
    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String login) {
        this.username = login;
    }

    public String getMail() {
        return mail;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setActive(int active){
        this.active = active;
    }

    public int getActive() {
        return active;
    }

    public Set<Role> getRole() {
        return role;
    }

    public void setRole(Set<Role> role) {
        this.role = role;
    }

    public User(){

    }
    public User(String login,String mail,String password,int active){
        this.username = login;
        this.mail = mail;
        this.password = password;
        this.active = active;
    }
    public User(User user){
        this.active = user.getActive();
        this.mail = user.getMail();
        this.role = user.getRole();
        this.username = user.getUsername();
        this.id =  user.getId();
        this.password = user.getPassword();
    }
}
