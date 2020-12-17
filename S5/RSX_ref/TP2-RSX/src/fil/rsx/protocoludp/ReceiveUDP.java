package fil.rsx.protocoludp;
import java.io.IOException;
import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.SocketException;

public class ReceiveUDP {
	public static void main(String[] args){
		DatagramSocket s = null;
		DatagramPacket p;
		try {
			s = new DatagramSocket(Integer.parseInt(args[0]));
		} catch (SocketException e1) {
			e1.printStackTrace();
		}
		p = new DatagramPacket(new byte[512], 512);
		try {
			s.receive(p);
			System.out.println("package sent by " + p.getAddress() + ":" + p.getPort() + " " + p.getLength() + " hostname " + p.getAddress().getHostName());
			byte array[] = p .getData();
			System.out.println("Message: " + new String(array));
		} catch (IOException e) {
			e.printStackTrace();
		}
		finally {
			System.out.println("Close");
		}
	}

}
