package Data;

import com.github.javafaker.Faker;

public class DataGenerator {
    public static String generateEmail(){
        //fristName.lastName@domin.com
        String firstName = generateFirstname();
        String lastName  = generateLastname();
        int randomNumber = (int) (Math.random() * 123);
        String domain = "@gmail.com";

        return firstName + "." + lastName + randomNumber + domain;
    }
    public static String generateFirstname(){
        Faker faker= new Faker();
        return faker.name().firstName();
    }
    public static String generateLastname(){
        Faker faker = new Faker();
        return faker.name().lastName();
    }


}
