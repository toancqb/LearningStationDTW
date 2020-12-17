package fil.rsx.model;
import java.io.IOException;
import java.net.DatagramPacket;
import java.net.InetAddress;
import java.net.MulticastSocket;
import java.net.SocketException;
import java.net.UnknownHostException;
import java.nio.charset.StandardCharsets;
import java.util.concurrent.atomic.AtomicBoolean;


public class Receiver extends Thread {

	protected InetAddress groupeIP;
	protected int port;
	protected String nom;
	protected final int MAX_LENGTH = 1024;
	protected MulticastSocket multicastSocket;
	AtomicBoolean isAlreadyIn = new AtomicBoolean(false);

	public Receiver(InetAddress groupeIP, int port, String nom){
		this.groupeIP = groupeIP;
		this.port = port;
		this.nom = nom;
		try {
			this.multicastSocket = new MulticastSocket(this.port);
		} catch (IOException e) {
			e.printStackTrace();
		}
		joinIP();
		start();
	}

	public void joinIP(){
		try {
			multicastSocket.joinGroup(groupeIP);
			System.out.println("Joining server: " + groupeIP);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public void leaveIP() {
		try {
			multicastSocket.leaveGroup(groupeIP);
			isAlreadyIn.set(true);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public void run() {
		while(!isAlreadyIn.get()) {
			try {
				DatagramPacket pack = new DatagramPacket(new byte[MAX_LENGTH],MAX_LENGTH);
				multicastSocket.receive(pack);
				//String msg = "paquet re�u de : "+ pack.getAddress() + " port "+ pack.getPort() + " taille" + pack.getLength() + " hostname " + pack.getAddress().getHostName() + ": ";
				String msg = "";
				byte array[] = pack.getData();
				System.out.println(msg + new String(array));
			} catch (SocketException e) {
			} catch (IOException e) {
			}
		}
	}

}
