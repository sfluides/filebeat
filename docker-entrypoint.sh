#!/bin/sh
set -e

#replace value with key-placeholder in /filebeat.yml
  setConfiguration() {
    KEY=$1
    VALUE=$2
    sed -i "s/{{$KEY}}/$VALUE/g" /filebeat.yml
  }
#set LOGSTASH_HOST from environment variable
#ex.: -e LOGSTASH_HOST=localhost
setConfiguration "LOGSTASH_HOST" $LOGSTASH_HOST
exec "$@"