package netty.tcp.demo2.init;


import org.json.JSONObject;

import java.io.Serializable;

public class MessageObject implements Serializable {

    String msg_id;
    String msg;
    String msg_from;

    public MessageObject(String msg_id, String msg, String msg_from) {
        this.msg_id = msg_id;
        this.msg = msg;
        this.msg_from = msg_from;
    }
    public MessageObject(){

    }

    public MessageObject(JSONObject jsonObject,String from){
        this.msg = jsonObject.getString("msg");
        this.msg_id = jsonObject.getString("msg_id");
        this.msg_from = from;
    }
    public String getMsg_id() {
        return msg_id;
    }

    public void setMsg_id(String msg_id) {
        this.msg_id = msg_id;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public String getMsg_from() {
        return msg_from;
    }

    public void setMsg_from(String msg_from) {
        this.msg_from = msg_from;
    }
}
