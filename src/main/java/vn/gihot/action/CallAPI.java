package vn.gihot.action;


import netscape.javascript.JSObject;
import org.json.JSONArray;
import org.json.JSONObject;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

public class CallAPI {
    String urlString;
    Map<String, String> params;
    String token;
    String result;

    public CallAPI(String urlString, Map<String, String> params, String token) {
        this.urlString = urlString;
        this.params = params;
        this.token = token;
    }

    public CallAPI(String urlString) {
        this.urlString = urlString;
        this.params = new HashMap<String, String>();
    }

    public CallAPI(String urlString, String token) {
        this.urlString = urlString;
        this.token = token;
    }

    public CallAPI(String urlString, Map<String, String> params) {
        this.urlString = urlString;
        this.params = params;
    }

    public static String getParamsString(Map<String, String> params) {
        String result = "?";

        for (Map.Entry<String, String> entry : params.entrySet()) {
            result+=entry.getKey()+"="+entry.getValue()+"&";

        }

        return result;
    }

    public String getAPIResult(boolean useToken) {

        try {
            URL url = new URL(urlString.concat(!params.isEmpty()?getParamsString(params):""));
            HttpURLConnection con = (HttpURLConnection) url.openConnection();
            con.setRequestMethod("POST");

            con.setConnectTimeout(5000);
            con.setReadTimeout(5000);
            con.setRequestProperty("Content-Type", "application/json");
            if (useToken) {
                con.setRequestProperty("Authorization", "Bearer " + token);
            }

            con.connect();

            int status = con.getResponseCode();
            BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()));
            result = in.readLine();
            con.disconnect();

        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;

    }
}


