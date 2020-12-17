import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.InetAddress;
import java.net.Socket;
import java.util.Scanner;

public class ClientTCP {
    private final Socket socket;
    private final Scanner scanner;

    private ClientTCP(InetAddress serverAddress, int serverPort) throws Exception {
        this.socket = new Socket(serverAddress, serverPort);
        this.scanner = new Scanner(System.in);
    }

    public static void main(String[] args) throws Exception {
        ClientTCP client = new ClientTCP(
                InetAddress.getByName(args[0]),
                Integer.parseInt(args[1]));

        System.out.println("\r\nConnected to Server: " + client.socket.getInetAddress());
        client.start();
    }

    private void start() throws IOException {
        String input;

        while (true) {
            //create input stream attached to socket
            BufferedReader inFromServer = new BufferedReader(new InputStreamReader (socket.getInputStream()));
            //read line from server
            String res = inFromServer.readLine(); // if connection closes on server end, this throws java.net.SocketException

            System.out.println(res);

            input = scanner.nextLine();
            PrintWriter out = new PrintWriter(this.socket.getOutputStream(), true);
            out.println(input);
            out.flush();
        }

    }
}