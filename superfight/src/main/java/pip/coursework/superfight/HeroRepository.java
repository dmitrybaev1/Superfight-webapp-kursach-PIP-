package pip.coursework.superfight;

import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface HeroRepository extends CrudRepository<Hero , Long>{
    Hero findByName(String name);
}
