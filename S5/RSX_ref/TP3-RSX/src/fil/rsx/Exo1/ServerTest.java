import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.InetAddress;
import java.net.ServerSocket;
import java.net.Socket;
import java.net.UnknownHostException;
import java.io.PrintWriter;
import java.net.SocketException;

public class ServerTest {
    private static int port = 2020;
    private static String host = "127.0.0.1";
    private static ServerSocket server = null;
    private static String msg = " Bienvenue sur mon serveur et au revoir ";
    private static int fin = 2;

    public static void main( String[] args) throws Throwable {

        try{
            ServerSocket server = new ServerSocket(port, 10, InetAddress.getByName(host));
            while(true){
                Socket client = server.accept();
                System.out.println( client); // port du client
                System.out.println( client.getPort()); // port du client
                System.out.println( client.getLocalPort()); // port du serveur

                PrintWriter writer = new PrintWriter( client.getOutputStream(), true);

                writer.write(msg);
                //writer.write("\n");

                // Now close the stream
                // using close() method
                writer.flush();
                //writer.close();
                client.close();


                //server.close();
            }
        }

        // si la connexion entre les sockets est interrompue, mais pas par nous
        catch( SocketException e){
            System.err.println(e.getMessage());
        }

        // si pb de port ou si on veut fermer la socket server alors qu'elle n'existe pas ou est déjà fermée
        catch (IOException e) {
            e.printStackTrace();
            server = null;
        }

    }
}