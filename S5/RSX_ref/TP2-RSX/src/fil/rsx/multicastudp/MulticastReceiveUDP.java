package fil.rsx.multicastudp;
import java.io.IOException;
import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.InetAddress;
import java.net.MulticastSocket;
import java.net.SocketException;
import java.net.UnknownHostException;

public class MulticastReceiveUDP {
	public static void main(String[] args){
		MulticastSocket s = null;
		DatagramPacket p;
		try {
			s = new MulticastSocket(7654);
			s.joinGroup(InetAddress.getByName("224.0.0.1"));
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		p = new DatagramPacket(new byte[512], 512);
		try {
			s.receive(p);
			System.out.println("paquet recu de :" + p.getAddress() + p.getPort() + p.getLength() + " hostname: " + p.getAddress().getHostAddress());
			byte array[] = p .getData();
			System.out.println("Message: " + new String(array));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
