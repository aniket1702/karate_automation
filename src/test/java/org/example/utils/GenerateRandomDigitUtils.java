package org.example.utils;

import java.util.Random;

public class GenerateRandomDigitUtils {
    
    public String generateRandomGtinNumber()
    {
        Random random = new Random();
        String randomNum = String.format("%012d", random.nextInt(1000000000));
        System.out.println(randomNum);
        
        // Calculate the check digit
        int sum = 0;
        for (int i = 0; i < randomNum.length(); i++) {
            int digit = Character.getNumericValue(randomNum.charAt(i));
            if (i % 2 == 0) {
                sum += digit * 1;
            } else {
                sum += digit * 3;
            }
        }
        int checkDigit = (10 - (sum % 10)) % 10;
        
        // Generate the GTIN-13 number
        String gtin = randomNum + checkDigit;
        return gtin;
    }
    }
  