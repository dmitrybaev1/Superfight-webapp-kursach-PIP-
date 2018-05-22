package pip.coursework.superfight;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.ComponentScans;

@ComponentScan({"configs","service","pip.coursework.superfight"})
@SpringBootApplication
public class SuperfightApplication {

	public static void main(String[] args) {
		SpringApplication.run(SuperfightApplication.class, args);
	}
}
