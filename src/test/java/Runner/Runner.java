package Runner;

import com.intuit.karate.junit5.Karate;

public class Runner {
    @Karate.Test
    Karate run(){
        return Karate.run("src/test/java/Features")
                .tags("@put")
                .karateEnv("qa");
    }
}
