import org.eclipse.jetty.server.Server;
import org.eclipse.jetty.webapp.WebAppContext;
public class GihOtClient {
    public static void main(String[] args) {
        Server server = new Server(8880);
        WebAppContext webapp = new WebAppContext();

        webapp.setDescriptor("src/main/webapp/WEB-INF/web.xml");
        webapp.setResourceBase("src/main/webapp");
        webapp.setContextPath("/");
        server.setHandler(webapp);

        try {
            server.start();
            server.join();

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }
}
