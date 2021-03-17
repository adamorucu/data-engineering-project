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
	--name hadoop-master-forwarder \
	--constraint node.hostname==team15 \
	--network sparkdemo_spark-net \
	--replicas 1 \
	--detach=true \
	--env REMOTE_HOST=hadoop-master \
	--env REMOTE_PORT=50070 \
	--env LOCAL_PORT=50070 \
	--publish mode=host,published=50070,target=50070 \
	newnius/port-forward

docker service create \
	--name hadoop-master-forwarder-jh \
	--constraint node.hostname==team15 \
	--network sparkdemo_spark-net \
	--replicas 1 \
	--detach=true \
	--env REMOTE_HOST=hadoop-master \
	--env REMOTE_PORT=19888 \
	--env LOCAL_PORT=19888 \
	--publish mode=host,published=19888,target=19888 \
	newnius/port-forward

docker service create \
	--name hadoop-node3-forwarder \
	--constraint node.hostname==team15_node3 \
	--network sparkdemo_spark-net \
	--replicas 1 \
	--detach=true \
	--env REMOTE_HOST=hadoop-node3 \
	--env REMOTE_PORT=50075 \
	--env LOCAL_PORT=50075 \
	--publish mode=host,published=50075,target=50075 \
	newnius/port-forward


docker service create \
	--name hadoop-proxy \
	--network sparkdemo_spark-net \
	--replicas 1 \
	--detach=true \
	--publish 7001:7001 \
	newnius/docker-proxy

