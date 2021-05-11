package WEBSOCEKTLO;
import javax.websocket.CloseReason;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;
import java.io.IOException;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;
import java.util.logging.Level;
import java.util.logging.Logger;

@ServerEndpoint("/toServiceLocation")
public class WebSocketLocationDemo {

    private static Set<Session> peers = Collections.synchronizedSet(new HashSet<Session>());
    String role = null;
    String email = null;

    @OnOpen
    public void onOpen(Session session) {
        peers.add(session);
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getEmail() {
        return this.email;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    @OnMessage
    public void onMessage(String txt, Session session) throws IOException {

        System.out.println(txt);
        DateTime d = new DateTime();
        String cdate = d.getDate();
        String ctime = d.getTime();

        String[] splited = txt.split("\\s+");

        String role = splited[0];

        if (role.equalsIgnoreCase("Client")) {
            String client = splited[1];
            String district = splited[7];
            String state = splited[8];
            DateTime dtClient = new DateTime();
            String date = dtClient.getDate();
            String time = dtClient.getTime();
            DeliveryLogModel dl = new DeliveryLogModel(); 
            dl.storeLog(client, date, time, district, state);
            ServiceAvailable available = new ServiceAvailable();

            String emailService = available.getEmail(splited[2], splited[3]);

            if (emailService == null){
                
                for (Session peer : peers) {
                    if (peer.isOpen()) {
                        peer.getBasicRemote().sendText("Client " + splited[1] + " " + "Unfortunate to say you service boy is not available.Please try after some time...");
                    }
                }
                
            } else {
                String str = "Service" + " " + emailService + " " + splited[1] + " " + splited[2] + " " + splited[3] + " " + date + " " + time + " " + splited[6] + " " + splited[4] + " " + splited[5];
                for (Session peer : peers) {
                    if (peer.isOpen()) {
                        peer.getBasicRemote().sendText(str);
                    }
                }
            }
        } else if (role.equalsIgnoreCase("Service")) {
            this.setRole("Service");
            this.setEmail(splited[1]);
            StoreLocation str = new StoreLocation();
            str.storeLocation(splited[2], splited[3], splited[1]);
        } else if (role.equals("ServiceI")) {
            StoreLocation st = new StoreLocation();
            st.setDeliveryStatus(splited[2], splited[3], splited[4]);
            String message = "ClientI " + splited[2] + " " + splited[3] + " " + splited[4];
            for (Session peer : peers) {
                if (peer.isOpen()) {
                    peer.getBasicRemote().sendText(message);
                }
            }
        } else if (role.equals("ServiceRI")) {
            if (splited[5].equals("yes")) {
                ServiceAvailable available = new ServiceAvailable();
                available.storeClient(splited[2] , splited[6] , splited[7] , splited[3] , splited[4] , splited[8] , splited[9] , splited[10]);
                available.storeService(splited[2] , splited[1] , splited[3] , splited[4]);
                String message = "Client " + splited[2] + " Be ready " + splited[1] + " is coming";
                for (Session peer : peers) {
                    if (peer.isOpen()) {
                        peer.getBasicRemote().sendText(message);
                    }
                }
            } else if (splited[5].equals("no")) {
                String message = "ClientRR " + splited[2] + " Unfortunate to say no delivery boy available";
                for (Session peer : peers) {
                    if (peer.isOpen()) {
                        peer.getBasicRemote().sendText(message);
                    }
                }
            }
        }

    }

    @OnError
    public void onError(Session session, Throwable error) {
        Logger.getLogger(WebSocketLocationDemo.class.getName()).log(Level.SEVERE, null, error.getMessage());
    }

    @OnClose
    public void onClose(CloseReason reason, Session session) {
        DateTime d = new DateTime();
        String cdate = d.getDate();
        String ctime = d.getTime();
        if (this.getRole().equalsIgnoreCase("Service")) {
            StoreLocation str = new StoreLocation();
            str.setStatus(this.email);
        }
        peers.remove(session);
    }

}
