import java.io.PrintStream;
import java.net.InetAddress;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.Scanner;

public class Exo1 {
    private final ServerSocket server;
    private static int port = 2020;
    private static String host = "127.0.0.1";

    public Exo1(String ipAddress) throws Exception {
        if (ipAddress != null && !ipAddress.isEmpty()) {
            this.server = new ServerSocket(port, 10, InetAddress.getByName(host));
        } else {
            this.server = new ServerSocket(0, 1, InetAddress.getLocalHost());
        }
    }

    public static void main(String[] args) throws Exception {
        Exo1 app = new Exo1("2020");
        System.out.println("\r\nRunning Server: " +
                "Host=" + app.getSocketAddress().getHostAddress() +
                " Port=" + app.getPort());

        app.listen();
    }

    private void listen() throws Exception {
        while(true){
            Socket client = this.server.accept();
            String clientAddress = client.getInetAddress().getHostAddress();
            System.out.println("\r\nNew connection from " + clientAddress);
            PrintStream out = new PrintStream(client.getOutputStream(), true);
            out.println("Bienvenue sur mon serveur et au revoir");
            out.flush();
            client.close();
        }
    }

    public InetAddress getSocketAddress() {
        return this.server.getInetAddress();
    }

    public int getPort() {
        return this.server.getLocalPort();
    }
}