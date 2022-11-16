# NOTICE: for distribution, we shall not include maven/git
FROM --platform=linux/x86_64 maven:3.6.3-jdk-8

# install git
RUN apt-get install -y git

# clone official Apache IoTDB git repo
WORKDIR /

COPY iotdb /iotdb
COPY start-confignode.sh /iotdb/start-confignode.sh
COPY start-datanode.sh /iotdb/start-datanode.sh

RUN chmod +x /iotdb/start-confignode.sh
RUN chmod +x /iotdb/start-datanode.sh

CMD ["/bin/bash", "-c", "/iotdb/sbin/start-new-server.sh"]
EXPOSE 6667