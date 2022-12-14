package features;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.Test;

class ExamplesTest {

    @Test
    void testParallel() {
        Runner.Builder testBuilder = Runner.path("classpath:features");
        testBuilder.tags("@MetaBank");
        Results results = testBuilder.parallel(1);
    }
}
