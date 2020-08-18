package vn.gihot.client;

import io.netty.channel.Channel;
import io.netty.channel.ChannelHandlerContext;
import io.netty.channel.SimpleChannelInboundHandler;
import netty.tcp.demo2.init.MessageObject;
import org.json.JSONArray;
import org.json.JSONObject;

import java.util.Queue;

public class ChatClientHandler extends SimpleChannelInboundHandler<String>{
    private String message;
    public String getMessage() {
        return message;
    }

	// Read the message broadcast by the server
    @Override
    protected void channelRead0(ChannelHandlerContext ctx, String msg) throws Exception {
        JSONObject jsonObject = new JSONObject(msg.split("\n")[0]);

//        System.out.println(jsonObject.toString());
        if(jsonObject.getString("msg_id").equals("login") ){
            ChatClient.isValidToken = true ? jsonObject.getInt("res")==0:false;
        }
        if(jsonObject.getString("msg_id").equals("normal") ){
            System.out.println(jsonObject.getString("msg_from")+" : "+jsonObject.getString("msg"));
        }
        if(jsonObject.getString("msg_id").equals("load_msg")){
            JSONArray jsonArray1 = new JSONArray(jsonObject.getString("list_msg").split("\n")[0]);
//            System.out.println(jsonArray1.toString());
            for(Object j : jsonArray1){
                JSONObject j1 = new JSONObject(j.toString());
                System.out.println(j1.getString("msg_from")+" : "+j1.getString("msg"));
//                System.out.println(j1.toString());
            }
        }


    }
    @Override
    public void channelInactive(ChannelHandlerContext ctx) throws Exception {
        Channel inChannel=ctx.channel();

    }

}
