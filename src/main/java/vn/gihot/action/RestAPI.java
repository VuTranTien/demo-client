package vn.gihot.action;


import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;
import vn.gihot.client.ChatClient;

import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/restApi")
public class RestAPI extends MultiActionController {
    @RequestMapping("/login")
    public String login(@RequestParam(value = "email", defaultValue = "") String email, @RequestParam(value = "password", defaultValue = "") String password){
        Map<String,String> map = new HashMap<String, String>();
        map.put("email",email);
        map.put("password", password);
        CallAPI call1 = new CallAPI("http://localhost:8080/center/user/login.do",map);
        String res = call1.getAPIResult(false);
        JSONObject j1 = new JSONObject(res);
        j1.put("email",email);
        j1.put("key",MD5.getMd5(email+j1.getString("token")));
        return j1.toString();
    }
    @RequestMapping(value = "/room_info",method = RequestMethod.POST)
    public String getRoomInfo(@RequestParam(value = "id") String room_id){

        Map<String,String> map = new HashMap<String, String>();
        map.put("id",room_id);
        map.put("key", MD5.getMd5(room_id+"654321"));
        CallAPI call1 = new CallAPI("http://localhost:8080/center/room/info.do",map);
        String res = call1.getAPIResult(false);
        JSONObject j1 = new JSONObject(res);

        return j1.toString();
    }

    

}
