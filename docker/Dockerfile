# NOTICE: for distribution, we shall not include maven/git
FROM maven:3.6.3-jdk-8

# install git
RUN apt-get install -y git

# clone official Apache IoTDB git repo
WORKDIR /
RUN git clone https://github.com/apache/iotdb.git

# package iotdb distribution using specific commit id TODO 这里可以先verify再package 缓存dependency
ARG iotdb_commit_id=master
WORKDIR iotdb
RUN git checkout $iotdb_commit_id
RUN mvn clean package -DskipTests

# 把distr放到 /iotdb 下面
# 脚本替换conf/

CMD ["/bin/bash", "-c", "/iotdb/distribution/target/apache-iotdb-0.14.0-SNAPSHOT-all-bin/apache-iotdb-0.14.0-SNAPSHOT-all-bin/sbin/start-confignode.sh"]


