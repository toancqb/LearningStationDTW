package tp2.protocoleudp;

import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.SocketException;
import java.io.IOException;

public class ReceiveUDP {

	private static void listenning(DatagramSocket socket) {
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
		DatagramSocket socket = null;
		int port;

		if (args.length != 1) {
			System.out.println("Usage: java ReceiveUDP.java numPort");
		} else {
			port = Integer.parseInt(args[0]);
			try {
				socket = new DatagramSocket(port);
			} catch (SocketException ske) {
				ske.printStackTrace();
			}

			listenning(socket);
			socket.close();
			System.out.println("Socket Closed");
		}
	}
}