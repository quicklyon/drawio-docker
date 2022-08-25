FROM tomcat:9.0.65-jre11

LABEL maintainer "zhouyueqiu zhouyueqiu@easycorp.ltd"

ENV OS_ARCH="amd64" \
    OS_NAME="ubuntu-22.04" \
    HOME_PAGE="https://www.diagrams.net/"

COPY ubuntu/prebuildfs /

ENV TZ=Asia/Shanghai \
    DEBIAN_FRONTEND=noninteractive

ARG IS_CHINA="true"
ENV MIRROR=${IS_CHINA}

RUN install_packages curl wget zip unzip s6 pwgen

# Install drawio
ARG VERSION
ENV APP_VER=${VERSION}
ENV EASYSOFT_APP_NAME="drawio $APP_VER"

RUN mkdir -p $CATALINA_HOME/webapps/draw \
    && curl -sLk -o /tmp/draw.war https://github.com/jgraph/drawio/releases/download/v${APP_VER}/draw.war \
    && unzip /tmp/draw.war -d $CATALINA_HOME/webapps/draw \
    && rm -rf /tmp/draw.war

# Copy drawio config files
COPY ubuntu/rootfs /

# Copy drawio source code
WORKDIR $CATALINA_HOME

EXPOSE 8080

ENTRYPOINT ["/usr/bin/entrypoint.sh"]