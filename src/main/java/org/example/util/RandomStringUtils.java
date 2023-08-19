package org.example.util;

import com.github.javafaker.Faker;
import lombok.Getter;
import lombok.Setter;


@Getter
@Setter
public class RandomStringUtils
{
    
    
    private final Faker faker = new Faker();
    
    private  String name = faker.name().firstName();
    private  String email = faker.internet().emailAddress();
    private  String password = faker.internet().password();
    
    
}
