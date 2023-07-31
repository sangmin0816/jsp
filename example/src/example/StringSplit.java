package example;

import java.util.Arrays;
public class StringSplit {
    public static void main(String[] args) {
        String chunjae = "오세훈/오태훈/이은영/서광/이소윤/신예은-백준철-신승원/구예진-한선/박진관-박나연";
        String[] stArr = chunjae.split("/|-"); //
        System.out.println(Arrays.toString(stArr));
    }
}