package example;
public class Gugudan {
    public static void main(String[] args) {
        for(int i=1;i<=9;i++){
            for(int j=2;j<=9;j++){
                System.out.printf("%dx%d=%2d\t", j, i, j*i);
            }
            System.out.println(); }
    }
}