package org.example.config;

import org.aeonbits.owner.Config;


@Config.LoadPolicy(Config.LoadType.MERGE)
@Config.Sources({"system:properties", "system:env", "file:${user.dir}/src/test/resources/config.properties"})
public interface ConfigReader extends Config {
    
    @Key("URL")
    String URL();
    
    @Key("Username")
    String USERNAME();
    
    @Key("PASSWORD")
    String PASSWORD();
    
    @Key("DriverClassName")
    String DRIVER_CLASS_NAME();
    
    
}
