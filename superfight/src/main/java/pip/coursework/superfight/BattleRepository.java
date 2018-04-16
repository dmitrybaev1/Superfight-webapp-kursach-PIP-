package pip.coursework.superfight;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface BattleRepository extends CrudRepository<Battle , Long> {
   long countByUserIdAndHeroIdAndResult(User user,Hero hero,String result);
}
