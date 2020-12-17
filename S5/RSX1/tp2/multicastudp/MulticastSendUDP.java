package tp2.multicastudp;

import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.SocketException;
import java.net.UnknownHostException;
import java.net.InetAddress;
import java.io.IOException;
import java.net.MulticastSocket;

public class SendUDP {

	public static void main(String[] args) {
		DatagramPacket packet;
		MulticastSocket socket = null;
		InetAddress ip = null;
		int port = 7654;
		byte buffer[];

		
		try {
			ip = InetAddress.getByName("224.0.0.1");
		} catch (UnknownHostException hex) {
			hex.printStackTrace();
		}

		buffer = "I dont know who you are, but i know your ip address".getBytes();
		packet = new DatagramPacket(buffer, buffer.length, ip, port);
			
		try {
			socket = new MulticastSocket();
		} catch (IOException ske) {
			ske.printStackTrace();
		}

		try {
			socket.send(packet);
		} catch (IOException exp) {
			exp.printStackTrace();
		} finally {
			socket.close();
			System.out.println("Socket Closed");
		}			
	}
}
