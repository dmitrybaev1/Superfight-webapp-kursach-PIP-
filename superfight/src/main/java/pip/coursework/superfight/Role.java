package pip.coursework.superfight;

import javax.persistence.*;

@Entity
@Table(name = "role",schema = "public")
public class Role {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE,generator = "roleseq")
    @SequenceGenerator(name = "roleseq",sequenceName = "role_id_seq")
    private int id;
    private String role;
    public Role(){}
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }
}
