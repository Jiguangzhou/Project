package com.kaishengit.test;

import org.junit.Test;

public class GetAgeTestCase {


    @Test
    public void getAge() {

        String num = "372922199405121737";

        String regex = "[0-9]{17}[0-9(x|X)]";
        if (num.matches(regex)) {

            String birthday = num.substring(6, 14);
            System.out.println(birthday);
        } else {
            throw new RuntimeException("身份证格式错误！");

        }
    }

    @Test
    public void testStr() {
        String str = "A.B.C.D";
        String string = "";
        String[] strings = str.split("\\.");
        for (int i = strings.length-1; i >= 0; i--) {
            if (i==0){
                string += strings[i];
            }else {
                string += strings[i]+".";
            }
        }
        System.out.println(string);
    }
}
