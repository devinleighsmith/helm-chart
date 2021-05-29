help:
	@echo "Usage: make <target>\n"
	@awk 'BEGIN {FS = ":.*##"} /^[0-9a-zA-Z_-]+:.*?## / { printf "  * %-40s -%s\n", $$1, $$2 }' $(MAKEFILE_LIST)|sort

minikube-install: ## Install the Helm chart on the local minikube cluster.
minikube-install:
	helm install development mayan-edms --timeout 15m --values mayan-edms/values.yaml

minikube-upgrade: ## Upgrade the development release on the local minikube cluster.
minikube-upgrade:
	helm upgrade development mayan-edms --timeout 15m --values mayan-edms/values.yaml

minikube-uninstall: ## Uninstall the development release from the local minikube cluster.
minikube-uninstall:
	helm uninstall development
