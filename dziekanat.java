import java.util.Scanner;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.DocumentBuilder;
import org.w3c.dom.Document;
import org.w3c.dom.NodeList;
import org.w3c.dom.Node;
import org.w3c.dom.Element;
import java.io.File;

public class dziekanat {

   public static void main(String argv[]) {
 
      try {
         File inputFile = new File("dziekanat.xml");
         DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
         DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
         Document doc = dBuilder.parse(inputFile);
         doc.getDocumentElement().normalize();
         System.out.println("MENU-----------------------");
         System.out.println("1) Wyswietl Wszystkich studentow\n");
         
         Scanner scan = new Scanner(System.in);
         System.out.println("Wybierz opcję: ");
         String opcja = scan.nextLine();
         System.out.println("\n");

         
			switch (opcja) {
				case "1":
					NodeList nl = doc.getElementsByTagName("student");
					for(int i=0;i<nl.getLength(); i++){
						Node node1 = nl.item(i);
						
						if (node1.getNodeType() == Node.ELEMENT_NODE) {
							Element elem = (Element) node1;
							NodeList daneNl = elem.getChildNodes();
							for (int j=0;j<daneNl.getLength();j++){
								Node n = daneNl.item(j);
								
								if (n.getNodeType() == Node.ELEMENT_NODE) 
								System.out.print(n.getNodeName()+": ");
								System.out.print(n.getTextContent());
							
							}
						}
					}
			   
				break;
				default:
				System.out.println("Wrong Input");
			}

         
         
         
      } catch (Exception e) {
         e.printStackTrace();
      }
   }
}
