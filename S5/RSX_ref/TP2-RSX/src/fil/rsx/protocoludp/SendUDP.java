package fil.rsx.protocoludp;
import java.io.IOException;
import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.InetAddress;
import java.net.SocketException;
import java.net.UnknownHostException;

public class SendUDP {
	public static void main(String[] args) {
		DatagramPacket p;
		DatagramSocket s = null;
		InetAddress dst = null;
		try {
			dst = InetAddress.getByName(args[0]);
		} catch (UnknownHostException e) {
			e.printStackTrace();
		}
		
		int port = Integer.parseInt(args[1]);
		byte array[] = args[2].getBytes();
		

		p = new DatagramPacket(array, array.length, dst, port);
		try {
			s = new DatagramSocket();
		} catch (SocketException e) {
			e.printStackTrace();
		}

		try {
			s.send(p);
		} catch (IOException e) {
			e.printStackTrace();
		}
		s.close();
	}
}
