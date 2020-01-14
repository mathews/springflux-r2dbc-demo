package com.hrjk.fin.serveperf;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.r2dbc.repository.config.EnableR2dbcRepositories;
import org.springframework.http.codec.ServerCodecConfigurer;
import org.springframework.http.converter.json.Jackson2ObjectMapperBuilder;
import org.springframework.web.reactive.config.EnableWebFlux;
import org.springframework.web.reactive.config.WebFluxConfigurer;

@Configuration
@EnableWebFlux
@ComponentScan("com.hrjk.fin.serveperf")
@EnableR2dbcRepositories("com.hrjk.fin.serveperf.dao")
public class WebConfig implements WebFluxConfigurer {

	public WebConfig() {
	}

	@Override
    public void configureHttpMessageCodecs(ServerCodecConfigurer configurer) {
        // ...

//		Jackson2ObjectMapperBuilder.json().build();
    }
}
