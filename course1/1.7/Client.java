import java.util.ArrayList;
import java.util.List;

class Client extends Thread {
    private int id = 0;
    Client (int id) {
        this.id = id;
    }
    public void run(List<Integer> list) {
        // System.out.println(new Single().getNumber());
        int i = Singleton.getInstance();
        System.out.println(i);
        System.out.println(this.id);
        
    }
}