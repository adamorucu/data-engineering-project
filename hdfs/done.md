1. updated /etc/hosts with instance names
2. added to ~/ssh/config - so that it is easier to ssh
3. run sudo ./setup.sh on master node
4. scp -r config/ team15-node3:~/volume/
5. in node3 sudo ./setup.sh in config
6. log into master container:
	- sbin/stop-yarn.sh
	- sbin/stop-dfs.sh
	- bin/hadoop namenode -format
	- sbin/start-dfs.sh
	- sbin/start-yarn.sh
