package vn.gihot.action;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;
import vn.gihot.client.ChatClient;

import javax.servlet.http.HttpServletRequest;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/demo-client")
public class ClientController extends MultiActionController {
    private static String token = "";
    private ChatClient client=null;

    @RequestMapping(value = "login",method = RequestMethod.GET)
    public String login(){

        return "login";
    }
    @RequestMapping(value = "login",method = RequestMethod.POST)
    public String login(@RequestParam(value = "email", defaultValue = "") String email,@RequestParam(value = "password", defaultValue = "") String password){

        Map<String,String> map = new HashMap<String, String>();
        map.put("email",email);
        map.put("password", password);
        CallAPI call1 = new CallAPI("http://localhost:8080/center/user/login.do",map);
        String res = call1.getAPIResult(false);
        JSONObject j1 = new JSONObject(res);
        System.out.println(j1.toString());
        if(j1.getInt("ret")==0){//dang nhap thanh cong

            token = j1.getString("token");//luu lai token dang nhap
            return "redirect:list-room.do";//TODO redirect toi trang chinh

        }
        else {
            System.out.println("DANG NHAP THAT BAIIIIII");
            return "login";

        }



    }
    @RequestMapping("/list-room")
    public String loadroom(Model model){
        model.addAttribute("token",token);
        return "list-room";
    }



    public String getTokenFromFile(){
        File file = new File(System.getProperty("user.dir") + "\\src\\main\\java\\netty\\tcp\\demo2\\tmp\\test.txt");
        List<String> lst1 = new ArrayList<String>();
        try {

            BufferedReader bufferedReader = new BufferedReader(new FileReader(System.getProperty("user.dir") + "\\src\\main\\java\\netty\\tcp\\demo2\\tmp\\test.txt"));
            String line;
            while((line = bufferedReader.readLine())!= null){
                lst1.add(line);
            }
            bufferedReader.close();

            return "valid";

        } catch (IOException e) {
            return "invalid";
        }
    }


    @RequestMapping(value = "/chat",method=RequestMethod.GET)
    public String showChat(){
        //start room
//        System.out.println("HEREEEEEEEEEEEEEEEEEEE");
        return "chat";
    }
    @RequestMapping(value = "/chat",method=RequestMethod.POST)
    public String showChat2(@RequestParam(value = "id") String id, Model model){
        //start room

        model.addAttribute("room_id",id);
        return "chat";
    }

    

}
