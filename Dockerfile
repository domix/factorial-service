FROM domix/graalvm:1.0.0-rc8 as builder

ADD ./build/ /build
RUN   cd /build && \
    native-image --no-server \
                 --class-path libs/factorial-service-0.0.6-all.jar \
           -H:ReflectionConfigurationFiles=reflect.json \
           -H:EnableURLProtocols=http \
           -H:IncludeResources="logback.xml|application.yml|META-INF/services/*.*" \
           -H:Name=factorial-service \
           -H:Class=factorial.service.Application \
           -H:+ReportUnsupportedElementsAtRuntime \
           -H:+AllowVMInspection \
           --rerun-class-initialization-at-runtime='sun.security.jca.JCAUtil$CachedSecureRandomHolder,javax.net.ssl.SSLContext' \
           --delay-class-initialization-to-runtime=io.netty.handler.codec.http.HttpObjectEncoder,io.netty.handler.codec.http.websocketx.WebSocket00FrameEncoder,io.netty.handler.ssl.util.ThreadLocalInsecureRandom

FROM debian:9.5-slim

COPY --from=builder /build/factorial-service /factorial

EXPOSE 8080

STOPSIGNAL SIGTERM

CMD ["./factorial"]
