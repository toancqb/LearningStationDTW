package fil.rsx.tchat;

import java.net.InetAddress;

import fil.rsx.model.Receiver;
import fil.rsx.model.Sender;

public class TChat {

	   public static void main(String[] arg) throws Exception{ 
			String nom = "a12p12";
			InetAddress groupeIP = InetAddress.getByName("224.0.0.1");
			int port = 7654; 
			Sender sender = new Sender(groupeIP, port, nom);
			Receiver receiver = new Receiver(groupeIP, port, nom);
	   }

}
