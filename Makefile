all: controller

controller:
	go build -o cnat-controller .

.PHONY: clean
clean:
	rm -rf cnat-controller

install-cnat-crd:
	kubectl apply -f ./artifacts/examples/crd.yaml
	kubectl apply -f ./artifacts/examples/cnat-crd.yaml

run: run-controller-with-kind

run-controller-with-kind: controller
	./cnat-controller -kubeconfig=$(HOME)/.kube/config

