#enp0s8 and enp0s9 is a name of the interface in the host machine
#change it with the name of the interface in your host machine

sudo ip link set dev enp0s8 down
sudo ip link set dev enp0s8 name ethExt

sudo ip link set dev enp0s9 down
sudo ip link set dev enp0s9 name ethInt

#tesi-reteEsterna-1 and tesi-reteInterna-1 is a name of the container
#change it with the name of the container in your host machine

EXTNSPID=$(docker inspect --format='{{.State.Pid}}' tesi-reteEsterna-1)
INTNSPID=$(docker inspect --format='{{.State.Pid}}' tesi-reteInterna-1)

sudo ip link set ethExt netns $EXTNSPID
sudo ip link set ethInt netns $INTNSPID

docker exec -it --privileged tesi-reteEsterna-1 /sbin/ip addr add 192.168.2.5/24 dev ethExt
docker exec -it --privileged tesi-reteInterna-1 /sbin/ip addr add 192.168.3.5/24 dev ethInt

docker exec -it --privileged tesi-reteEsterna-1 /sbin/ip link set ethExt up
docker exec -it --privileged tesi-reteInterna-1 /sbin/ip link set ethInt up
