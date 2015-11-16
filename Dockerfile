#
# jpodeszwik/elasticsearch Dockerfile
#
FROM rpidockers/java:1.8.0_60

# Install elasticsearch
ENV ES_CONFIG_PATH /data/config/elasticsearch.yml 
ENV ES_VERSION 1.7.1 
RUN \
  cd /tmp && \
  wget https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-$ES_VERSION.tar.gz && \
  tar xvzf elasticsearch-$ES_VERSION.tar.gz && \
  rm -f elasticsearch-$ES_VERSION.tar.gz && \
  mv /tmp/elasticsearch-$ES_VERSION /opt/elasticsearch-$ES_VERSION && \
  ln -s /opt/elasticsearch-$ES_VERSION /opt/elasticsearch

# Install plugins
#RUN \
#  cd /opt/elasticsearch/bin && \
  #./plugin install royruss#./elasticsearch-HQ && \
  #./plugin install mob#./elasticsearch-head && \
  #./plugin install karm#./elasticsearch-paramedic && \
  #./plugin install lukas-vlce#./bigdesk && \
  #./plugin install jettr#./elasticsearch-gui && \
  #./plugin install lmeneze#./elasticsearch-kopf

# Basic configuration
ENV ES_CLUSTER_NAME elasticsearch
ENV ES_NODE_MASTER true
ENV ES_NODE_DATA true  

VOLUME ["/data"]

WORKDIR /data

ADD run.sh /bin/run.sh
CMD /bin/run.sh

