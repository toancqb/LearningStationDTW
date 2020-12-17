package tp2.multicastudp;

import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.SocketException;
import java.io.IOException;
import java.net.InetAddress;
import java.net.MulticastSocket;
import java.net.UnknownHostException;

public class ReceiveUDP {

	private static void listenning(MulticastSocket socket) {
		byte buffer[];
		DatagramPacket packet = new DatagramPacket(new byte[256], 256);
		try {
			socket.receive(packet);
			System.out.println("packet sent by " + packet.getAddress() + ":" + packet.getPort() + " " + packet.getLength() + " hostname " + packet.getAddress().getHostName());
			buffer = packet.getData();
			System.out.println("Message: " + new String(buffer));
		} catch (IOException exc) {
			exc.printStackTrace();
		} finally {
			socket.close();
		}

	}

	public static void main(String []args) {
		MulticastSocket socket = null;
		int port = 7654;
		InetAddress ip = null;

		try {
			ip = InetAddress.getByName("224.0.0.1");
			socket = new MulticastSocket(port);
			socket.joinGroup(ip);
		} catch (IOException ske) {
			ske.printStackTrace();
		}

		listenning(socket);
		socket.close();
		System.out.println("Socket Closed");		
	}
}