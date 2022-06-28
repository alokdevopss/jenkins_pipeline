# # base image
# FROM openjdk:11

# # define spark and hadoop versions
# ENV SPARK_VERSION=2.4.7
# ENV HADOOP_VERSION=3.3.1

# # download and install hadoop
# # RUN mkdir -p /opt && \
# #     cd /opt && \
# #     curl http://archive.apache.org/dist/hadoop/common/hadoop-${HADOOP_VERSION}/hadoop-${HADOOP_VERSION}.tar.gz | \
# #         tar -zx hadoop-${HADOOP_VERSION}/lib/native && \
# #     ln -s hadoop-${HADOOP_VERSION} hadoop && \
# #     echo Hadoop ${HADOOP_VERSION} native libraries installed in /opt/hadoop/lib/native

# # download and install spark
# RUN mkdir -p /opt && \
#     cd /opt && \
#     curl http://archive.apache.org/dist/spark/spark-${SPARK_VERSION}/spark-${SPARK_VERSION}-bin-hadoop2.7.tgz | \
#         tar -zx && \
#     ln -s spark-${SPARK_VERSION}-bin-hadoop2.7 spark && \
#     echo Spark ${SPARK_VERSION} installed in /opt

# # add scripts and update spark default config
# ADD common.sh spark-master spark-worker /
# ADD spark-defaults.conf /opt/spark/conf/spark-defaults.conf
# ENV PATH $PATH:/opt/spark/bin



# FROM node:12-alpine
# RUN apk add --no-cache python2 g++ make
# WORKDIR /app
# COPY . .
# RUN yarn install --production
# CMD ["node", "src/index.js"]
# EXPOSE 3000


FROM node:gallium-bullseye
WORKDIR /usr/src/app
COPY . .
RUN npm install
CMD ["npm", "start"]

