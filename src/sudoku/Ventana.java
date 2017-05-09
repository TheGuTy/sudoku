package sudoku;

import java.awt.Color;

import javax.swing.JFrame;
import javax.swing.JOptionPane;
import javax.swing.SwingUtilities;

import org.jpl7.Query;

public class Ventana extends JFrame {

	public Ventana() {
		
		super("Sudoku");
		
		cargarLogica();
	}
	
	private void cargarLogica() {
		
		String consulta = "consult('logicasudoku.pl')";
		Query cargarLogica = new Query(consulta);
		
		if (!cargarLogica.hasSolution()) {
			JOptionPane.showMessageDialog(null, "Error al cargar la lógica del sudoku");
		} 
	}

	public static void main(String[] args) {		
		
		SwingUtilities.invokeLater(new Runnable() {
			public void run() {
				Ventana inst = new Ventana();
				inst.setSize(470,600);
				inst.setResizable(false);
				inst.setBackground(Color.BLACK);
				inst.setLocationRelativeTo(null);
				inst.setVisible(true);
			}
		});

	}

}
