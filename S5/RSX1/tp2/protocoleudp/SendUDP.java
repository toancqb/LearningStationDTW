package tp2.protocoleudp;

import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.SocketException;
import java.net.UnknownHostException;
import java.net.InetAddress;
import java.io.IOException;

public class SendUDP {

	public static void main(String[] args) {
		DatagramPacket packet;
		DatagramSocket socket = null;
		InetAddress ip = null;
		int port;
		byte buffer[];

		if (args.length != 3) {
			System.out.println("Usage: java SendUDP.java hostName numPort message");
		} else {
			try {
				ip = InetAddress.getByName(args[0]);
			} catch (UnknownHostException hex) {
				hex.printStackTrace();
			}

			port = Integer.parseInt(args[1]);
			buffer = args[2].getBytes();
			packet = new DatagramPacket(buffer, buffer.length, ip, port);
			
			try {
				socket = new DatagramSocket();
			} catch (SocketException ske) {
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
}
