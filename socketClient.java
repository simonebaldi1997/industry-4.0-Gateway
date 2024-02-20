import java.io.DataOutputStream;
import java.net.Socket;

public class socketClient {

    public static void main(String[] args) {
        String serverAddress = "192.168.2.5"; // Indirizzo del server
        int serverPort = 9090; // Porta su cui il server è in ascolto

        try (Socket socket = new Socket(serverAddress, serverPort);
             DataOutputStream out = new DataOutputStream(socket.getOutputStream())) {

            // Dati da inviare al server
            String dati = "stringa inviata dal client";

            // Invia i dati al server
            out.writeBytes(dati + '\n');
            out.flush();

            System.out.println("Dati inviati al server: " + dati);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
