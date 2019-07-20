package com.web.icook.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import forum.listener.StompConnectEvent;
import forum.listener.StompDisconnectEvent;


@Configuration
public class WebSocketHandlerConfig {

	@Bean
	public StompConnectEvent webSocketConnectHandler() {
		
		return new StompConnectEvent();
	}
	
	@Bean
	public StompDisconnectEvent webSocketDisconnectHandler() {
		return new StompDisconnectEvent();
	}
}
