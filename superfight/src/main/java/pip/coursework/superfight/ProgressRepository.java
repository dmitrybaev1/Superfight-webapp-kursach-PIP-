package pip.coursework.superfight;

import org.springframework.data.repository.CrudRepository;

public interface ProgressRepository extends CrudRepository<Progress,Long> {
    Progress findById(ProgressId id);
}
