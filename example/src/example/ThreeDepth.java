package example;
public class ThreeDepth {
    public static void main(String[] args) {
        int[][][] arr3 = {{{10, 20}, {30, 40}, {10, 20}}, {{10, 20}, {30, 40}, {10, 20}}};
        for (int i = 0; i < arr3.length; i++) {//면////
            for (int j = 0; j < arr3[0].length; j++) { //줄
                for (int k = 0; k < arr3[0][0].length; k++) {
                    System.out.print(arr3[i][j][k] + "\t");
                }
                System.out.println();
            }
            System.out.println("----------------------");
        }
    }
}