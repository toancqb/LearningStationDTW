package tp2.tchat;

import java.net.InetAddress;

import tp2.app.Receiver;
import tp2.app.Sender;

public class Tchat {

	   public static void main(String[] arg) throws Exception{ 
			String nom = "a13p13";
			InetAddress groupeIP = InetAddress.getByName("224.0.0.1");
			int port = 7654; 
			Sender sender = new Sender(groupeIP, port, nom);
			Receiver receiver = new Receiver(groupeIP, port, nom);
	   }
}
