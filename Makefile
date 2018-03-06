kservice = minikube --namespace node-test service
kforce_apply = kubectl apply --force=true -f k8s

build:
	docker build -t node-all:v1 .

clean:
	git clean -dfx

deploy:
	$(kforce_apply)/namespace.yaml
	$(kforce_apply)/x/deploy.yaml
	$(kforce_apply)/x/service.yaml
	$(kforce_apply)/y/deploy.yaml
	$(kforce_apply)/y/service.yaml
	$(kforce_apply)/z/deploy.yaml
	$(kforce_apply)/z/service.yaml

url:
	$(kservice) node-all-x --url
	$(kservice) node-all-y --url
	$(kservice) node-all-z --url
