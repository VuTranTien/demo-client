package vn.gihot.client;

import java.util.Scanner;

import io.netty.bootstrap.Bootstrap;
import io.netty.channel.Channel;
import io.netty.channel.ChannelFuture;
import io.netty.channel.ChannelInitializer;
import io.netty.channel.ChannelPipeline;
import io.netty.channel.EventLoopGroup;
import io.netty.channel.nio.NioEventLoopGroup;
import io.netty.channel.socket.SocketChannel;
import io.netty.channel.socket.nio.NioSocketChannel;
import io.netty.handler.codec.string.StringDecoder;
import io.netty.handler.codec.string.StringEncoder;
import io.netty.util.CharsetUtil;
import org.json.JSONArray;
import org.json.JSONObject;

public class ChatClient {
    public static String token = "";
    public static JSONArray listRoom = new JSONArray();
    public static boolean isValidToken = false;
    private String IP;
    private int port;
    public String getIP() {
        return IP;
    }
    public void setIP(String iP) {
        IP = iP;
    }
    public int getPort() {
        return port;
    }
    public void setPort(int port) {
        this.port = port;
    }
    public ChatClient(String iP, int port) {
        IP = iP;
        this.port = port;
    }
    public void run() {
        EventLoopGroup group=new NioEventLoopGroup();
        Channel channel=null;
        try {
            Bootstrap bootstrap=new Bootstrap();
            bootstrap.group(group)
                    .channel(NioSocketChannel.class)
                    .handler(new ChannelInitializer<SocketChannel>() {

                        @Override
                        protected void initChannel(SocketChannel ch) throws Exception {
                            ChannelPipeline pipeline=ch.pipeline();
                            //decoding
                            pipeline.addLast("decoder",new StringDecoder(CharsetUtil.UTF_8));
                            //encoding
                            pipeline.addLast("encoder",new StringEncoder(CharsetUtil.UTF_8));
                            pipeline.addLast(new ChatClientHandler());
                        }

                    });
            ChannelFuture future=bootstrap.connect(IP, port);
            future.sync();
            channel=future.channel();
            Scanner scanner=new Scanner(System.in);
            JSONObject jsonObject = new JSONObject();
            System.out.println("Type anything to connect to room...");
            //TODO check connection
            if(scanner.hasNext()){

                jsonObject.put("msg_id","login");
                jsonObject.put("email","admin@gmail.com");
                jsonObject.put("token",token);
                jsonObject.put("key","key");

                channel.writeAndFlush(jsonObject.toString());
                Thread.sleep(1000l);
                if(!ChatClient.isValidToken){
                    channel.disconnect();
                    System.out.println("You are not logined");
                }
                else {
                    System.out.println("You are in room now");
                }
                jsonObject.remove("email");
                jsonObject.remove("token");
                jsonObject.remove("key");

            }



            jsonObject.put("msg_id","normal");


            scanner.nextLine();
            while(scanner.hasNext()) {
                String text=scanner.nextLine();
                jsonObject.put("msg",text);

                channel.writeAndFlush(jsonObject.toString());
            }
            jsonObject = null;

        } catch (InterruptedException e) {
            e.printStackTrace();
        }finally {
            group.shutdownGracefully();

            if(channel != null) {
                try {
                    channel.closeFuture().sync();
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
            }

        }
    }
    private void requireConnect(Channel channel){


    }
}