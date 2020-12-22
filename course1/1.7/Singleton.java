import java.util.List;

class Singleton {

    private static Singleton singleton;
    private static int count;

    private Singleton() {}

    public static Integer getInstance() {
        count = count+1;
        if (count <= 990) {
            return 1;
        }
        return 2;
    }
}