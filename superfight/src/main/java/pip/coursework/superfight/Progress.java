package pip.coursework.superfight;

import javax.persistence.*;

@Entity
@Table(name = "progress",schema = "public")
public class Progress {
    @EmbeddedId
    private ProgressId id;

    private long lvl;
    public Progress(){

    }
    public Progress(ProgressId id,long level){
        this.id = id;
        this.lvl = level;
    }
    public void setId(ProgressId id) {
        this.id = id;
    }

    public ProgressId getId() {
        return id;
    }

    public long getLevel() {
        return lvl;
    }

    public void setLevel(long level) {
        this.lvl = level;
    }
}
