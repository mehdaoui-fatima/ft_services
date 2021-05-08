kubectl delete -f ./srcs/mysql.yaml
kubectl delete -f ./srcs/ftps.yaml
kubectl delete -f ./srcs/nginx.yaml
kubectl delete -f ./srcs/phpmyadmin.yaml
kubectl delete -f ./srcs/wordpress.yaml
kubectl delete -f ./srcs/grafana.yaml
kubectl delete -f ./srcs/influxdb.yaml

sleep 3

docker rmi -f mysql
docker rmi -f ftps
docker rmi -f nginx
docker rmi -f phpmyadmin
docker rmi -f wordpress
docker rmi -f grafana
docker rmi -f influxdb

sleep 5
docker rmi -f $(docker images -f "dangling=true" -q)

