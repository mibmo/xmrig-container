build:
	docker build -t xmrig:$(VERSION) --build-arg XMRIG_VERSION=$(VERSION) .
