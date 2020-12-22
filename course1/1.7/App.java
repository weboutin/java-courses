import java.util.ArrayList;
import java.util.List;

class App {
    public static void main(String[] args) {
        List<Client> list = new ArrayList<>();
        List<Integer> numberlist = new ArrayList<>();
        for (int i = 0; i < 1000; i++) {
            list.add(new Client(i));
        }
        for (int i = 0; i < list.size(); i++) {
            list.get(i).run(numberlist);
        }
        System.out.println(numberlist);
    }

}