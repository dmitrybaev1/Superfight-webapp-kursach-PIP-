package pip.coursework.superfight;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

import static javafx.scene.input.KeyCode.T;

public interface UserRepository extends CrudRepository<User,Long> {
    User findByLogin(String login);
    User findByMail(String mail);
    User findByLoginAndPassword(String login,String password);

}
