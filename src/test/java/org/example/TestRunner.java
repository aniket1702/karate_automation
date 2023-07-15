package org.example;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import org.example.reports.CustomExtentReport;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


public class TestRunner {
    private static final Logger logger = LoggerFactory.getLogger(TestRunner.class);
    @BeforeAll
    public static void beforeAll() {
        // Disable Karate report backup folder
        System.setProperty("karate.outputDir", "target/karate-reports");
        

    }
    
    @Test
    public void karateTestRunner()
    {
        
        Results results= Runner.path("classpath:org/example/features/notes").backupReportDir(false).parallel(5);
        CustomExtentReport customExtentReport=new CustomExtentReport()
                .withKarateResult(results)
                .withReportDir(results.getReportDir())
                .withReportTitle("Karate Report Test Results");
        customExtentReport.generateExtentReport();
        Assertions.assertEquals(0,results.getFailCount());
        
        logger.info(""+results.getFeatureResults());
        
    }
}
