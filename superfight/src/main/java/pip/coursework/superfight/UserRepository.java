package pip.coursework.superfight;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

import static javafx.scene.input.KeyCode.T;

public interface UserRepository extends CrudRepository<User,Long> {
    List<User> findByLogin(String login);
    List<User> findByMail(String mail);
    List<User> findByLoginAndPassword(String login,String password);

}
