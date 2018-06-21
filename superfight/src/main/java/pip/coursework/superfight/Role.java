package pip.coursework.superfight;

import javax.persistence.*;

@Entity
@Table(name = "role",schema = "public")
public class Role {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE,generator = "roleseq")
    @SequenceGenerator(name = "roleseq",sequenceName = "role_id_seq")
    private long id;
    private String role;
    public Role(){}
    public Role(long id,String role){
        this.id = id;
        this.role = role;
    }
    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }
}
