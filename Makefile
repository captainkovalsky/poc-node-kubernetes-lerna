build:
	docker build -t node-all:v1 .
clean:
	git clean -dfx

deploy:
	kubectl apply --force=true -f k8s/namespace.yaml
	kubectl apply --force=true -f k8s/x/deploy.yaml
	kubectl apply --force=true -f k8s/x/service.yaml
	kubectl apply --force=true -f k8s/y/deploy.yaml
	kubectl apply --force=true -f k8s/y/service.yaml
	kubectl apply --force=true -f k8s/z/deploy.yaml
	kubectl apply --force=true -f k8s/z/service.yaml

url:
	minikube --namespace node-test service node-all-x --url
	minikube --namespace node-test service node-all-y --url
	minikube --namespace node-test service node-all-z --url
