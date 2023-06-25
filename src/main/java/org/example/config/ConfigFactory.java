package org.example.config;

import org.aeonbits.owner.ConfigCache;

public final class ConfigFactory
{
    private ConfigFactory(){}
    
    public static ConfigReader getConfigProperties()
    {
        return ConfigCache.getOrCreate(ConfigReader.class);
    }
}
