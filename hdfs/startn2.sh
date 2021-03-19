docker service create \
        --name hadoop-node4 \
        --hostname hadoop-node4 \
        --constraint node.hostname==team15-node4 \
        --network sparkdemo_spark-net \
        --endpoint-mode dnsrr \
        --mount type=bind,src=/home/ubuntu/volume/config,dst=/config/hadoop \
        --mount type=bind,src=/home/ubuntu/volume/data/hadoop/hdfs,dst=/tmp/hadoop-root \
        --mount type=bind,src=/home/ubuntu/volume/data/hadoop/logs,dst=/usr/local/hadoop/logs \
        newnius/hadoop:2.7.4
