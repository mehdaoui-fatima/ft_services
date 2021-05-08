# minikube start 
 #eval $(minikube docker-env)
docker build -t ftps srcs/ftps
docker build -t phpmyadmin srcs/phpMyAdmin
docker build -t nginx srcs/nginx 
docker build -t wordpress srcs/wordpress
docker build -t grafana srcs/grafana
docker build -t influxdb srcs/influxdb
docker build -t mysql srcs/mysql

kubectl  apply -f srcs/ftps.yaml
kubectl  apply -f srcs/phpmyadmin.yaml
kubectl  apply -f srcs/nginx.yaml
kubectl  apply -f srcs/wordpress.yaml
kubectl  apply -f srcs/grafana.yaml
kubectl  apply -f srcs/influxdb.yaml
kubectl  apply -f srcs/mysql.yaml