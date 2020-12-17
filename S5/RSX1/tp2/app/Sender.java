package tp2.app;

import java.io.ByteArrayOutputStream;
import java.io.DataOutputStream;
import java.net.DatagramPacket;
import java.net.InetAddress;
import java.net.MulticastSocket;
import java.util.Scanner;

public class Sender extends Thread{
	InetAddress  groupeIP;
	int port;
	MulticastSocket socket;
	String nom;

	public Sender(InetAddress groupeIP, int port, String nom) throws Exception {
		this.groupeIP = groupeIP;
		this.port = port;
		this.nom = nom;
		socket = new MulticastSocket();
		socket.setTimeToLive(15);
		start();
	}

	public void run() {
		Scanner sc;
		try {
			sc = new Scanner(System.in);
			while(true) {
				System.out.println("Enter something :");
				String texte = sc.nextLine();
				send(texte);
				System.out.println("Sent");
			}
		}
		catch (Exception exc) {
			System.out.println("Error");
		}
	} 

	private void send(String texte) throws Exception {
		byte[] contenuMessage;
		DatagramPacket message;

		ByteArrayOutputStream sortie = new ByteArrayOutputStream(); 
		texte = nom + " : " + texte ;
		(new DataOutputStream(sortie)).writeUTF(texte); 
		contenuMessage = sortie.toByteArray();
		message = new DatagramPacket(contenuMessage, contenuMessage.length, groupeIP, port);
		socket.send(message);
	}
}
