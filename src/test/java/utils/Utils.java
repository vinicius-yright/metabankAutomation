package utils;


import java.util.Random;

public class Utils {

    public int randomNum() {
        Random random = new Random();
        return random.nextInt(999999);
    }
}
