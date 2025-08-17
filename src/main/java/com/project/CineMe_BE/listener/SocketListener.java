package com.project.CineMe_BE.listener;

import com.corundumstudio.socketio.AckRequest;
import com.corundumstudio.socketio.SocketIOClient;
import com.corundumstudio.socketio.SocketIOServer;
import com.corundumstudio.socketio.listener.ConnectListener;
import com.corundumstudio.socketio.listener.DataListener;
import com.corundumstudio.socketio.listener.DisconnectListener;
import com.project.CineMe_BE.service.SeatService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.aspectj.bridge.Message;
import org.springframework.stereotype.Component;

import java.util.UUID;

@Slf4j
@Component
public class SocketListener {
    private final SocketIOServer server;


    public SocketListener(SocketIOServer server, SeatService seatService) {
        this.server = server;
        server.addConnectListener(onConnected());
        server.addDisconnectListener(onDisconnected());
    }


     private ConnectListener onConnected() {
         return (client) -> {
             String showtime = client.getHandshakeData().getSingleUrlParam("showtime");
             if (showtime != null && !showtime.trim().isEmpty()) {
                 log.info("Showtime ID: {}", showtime);
                 client.joinRoom(showtime);
             } else {
                 log.warn("Client[{}] connected without valid showtime parameter", client.getSessionId());
                 client.disconnect();
             }
             log.info("Socket ID[{}]  Connected to socket", client.getSessionId().toString());
         };
     }


    private DisconnectListener onDisconnected() {
        return client -> {
            log.info("Client[{}] - Disconnected from socket", client.getSessionId().toString());
        };
    }



}
