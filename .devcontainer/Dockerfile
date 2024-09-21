FROM ghcr.io/graalvm/graalvm-ce:ol7-java17-22.3.3
WORKDIR /opt/graalvm
RUN gu install native-image
ENTRYPOINT ["native-image"]