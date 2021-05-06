minikube start 
eval $(minikube docker-env)
docker build -t ftps srcs/ftps
docker build -t phpmyadmin srcs/phpMyAdmin
docker build -t nginx srcs/nginx 
docker build -t wordpress srcs/wordpress
docker build -t myngx srcs/nginx

kubectl  apply -f srcs/ftps.yaml
kubectl exec -it grafana-587c568576-7wjnb -- /bin/sh 
