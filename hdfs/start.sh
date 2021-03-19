docker service create \
        --name hadoop-master \
        --hostname hadoop-master \
        --constraint node.hostname==team15 \
        --network sparkdemo_spark-net \
        --endpoint-mode dnsrr \
        --mount type=bind,src=/home/ubuntu/project-repo/hdfs/config,dst=/config/hadoop \
        --mount type=bind,src=/data/hadoop/hdfs,dst=/tmp/hadoop-root \
        --mount type=bind,src=/data/hadoop/logs,dst=/usr/local/hadoop/logs \
        newnius/hadoop:2.7.4

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

docker service create \
        --name hadoop-node3 \
        --hostname hadoop-node3 \
        --constraint node.hostname==team15-node3 \
        --network sparkdemo_spark-net \
        --endpoint-mode dnsrr \
        --mount type=bind,src=/home/ubuntu/volume/config,dst=/config/hadoop \
        --mount type=bind,src=/home/ubuntu/volume/data/hadoop/hdfs,dst=/tmp/hadoop-root \
        --mount type=bind,src=/home/ubuntu/volume/data/hadoop/logs,dst=/usr/local/hadoop/logs \
        newnius/hadoop:2.7.4

docker service create \
        --name hadoop-node2 \
        --hostname hadoop-node2 \
        --constraint node.hostname==team15-node2 \
        --network sparkdemo_spark-net \
        --endpoint-mode dnsrr \
        --mount type=bind,src=/home/ubuntu/volume/config,dst=/config/hadoop \
        --mount type=bind,src=/home/ubuntu/volume/data/hadoop/hdfs,dst=/tmp/hadoop-root \
        --mount type=bind,src=/home/ubuntu/volume/data/hadoop/logs,dst=/usr/local/hadoop/logs \
        newnius/hadoop:2.7.4

docker service create \
        --name hadoop-node1 \
        --hostname hadoop-node1 \
        --constraint node.hostname==team15-node1 \
        --network sparkdemo_spark-net \
        --endpoint-mode dnsrr \
        --mount type=bind,src=/home/ubuntu/volume/config,dst=/config/hadoop \
        --mount type=bind,src=/home/ubuntu/volume/data/hadoop/hdfs,dst=/tmp/hadoop-root \
        --mount type=bind,src=/home/ubuntu/volume/data/hadoop/logs,dst=/usr/local/hadoop/logs \
        newnius/hadoop:2.7.4
