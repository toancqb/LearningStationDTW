package fil.rsx.multicastudp;
import java.io.IOException;
import java.net.DatagramPacket;
import java.net.InetAddress;
import java.net.MulticastSocket;
import java.net.SocketException;
import java.net.UnknownHostException;

public class MulticastSendUDP {
	public static void main(String[] args) {
		DatagramPacket p;
		MulticastSocket s = null;
		InetAddress dst = null;
		try {
			dst = InetAddress.getByName("224.0.0.1");
		} catch (UnknownHostException e) {
			e.printStackTrace();
		}

		int port = 7654;
		byte array[] = "Hello my name is Phoenix".getBytes();

		p = new DatagramPacket(array, array.length, dst, port);
		try {
			s = new MulticastSocket();
		} catch (IOException e) {
			// TODO Auto-generated catch block
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
