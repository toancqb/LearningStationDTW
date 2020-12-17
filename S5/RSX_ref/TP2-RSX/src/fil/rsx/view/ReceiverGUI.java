package fil.rsx.view;

import java.awt.Dimension;

import javax.swing.JFrame;
import javax.swing.JScrollPane;
import javax.swing.JSplitPane;
import javax.swing.JTextArea;
import javax.swing.JTextField;

public class ReceiverGUI extends JFrame {
	private JTextField textField = new JTextField("Please enter the message");
	private JTextArea textArea = new JTextArea();
	private JSplitPane splitPane;
	
	public ReceiverGUI() {
		super();
		this.setSize(new Dimension(400,600));
		this.setLocationRelativeTo(null);
		initContent();
		this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		this.setVisible(true);
	}
	
	private void initContent() {
		textArea.setEditable(false);
		splitPane = new JSplitPane(JSplitPane.VERTICAL_SPLIT,textArea,new JScrollPane(textField));
		splitPane.setDividerLocation(400);
		this.getContentPane().add(splitPane);
	}
	
	
}
