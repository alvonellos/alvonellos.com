package com.alvonellos.website.model;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.*;

import javax.persistence.*;
import java.io.Serializable;
import java.time.LocalDateTime;

@Entity(name = "pageViews")
@Getter
@Setter
@JsonIgnoreProperties(ignoreUnknown = true)
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class StatisticsEntity implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "pageViewId", nullable = false)
    private Long id;

    @JsonProperty("accessed")
    private LocalDateTime accessed = LocalDateTime.now();

    @JsonProperty("userAgent")
    private String userAgent;

    @JsonProperty("method")
    private String method;

    @JsonProperty("requestURI")
    private String requestURI;

    @JsonProperty("requestProtocol")
    private String requestProtocol;

    @JsonProperty("remoteHost")
    private String remoteHost;

    @JsonProperty("remoteAddr")
    private String remoteAddr;

    @Override
    public String toString() {
        return "StatisticsEntity{" +
                "id=" + id +
                ", accessed=" + accessed +
                ", userAgent='" + userAgent + '\'' +
                ", method='" + method + '\'' +
                ", requestURI='" + requestURI + '\'' +
                ", requestProtocol='" + requestProtocol + '\'' +
                ", remoteHost='" + remoteHost + '\'' +
                ", remoteAddr='" + remoteAddr + '\'' +
                '}';
    }
}
