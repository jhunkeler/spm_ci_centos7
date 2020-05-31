REGISTRY=jhunkeler
IMAGE=spm_ci_centos
TAG=$(shell git describe --tags | sed 's/\-/\./' | awk -F'-' '{ print $$1 }')
TO_UPLOAD=$(REGISTRY)/$(IMAGE):$(TAG)
TO_UPLOAD_LATEST=$(REGISTRY)/$(IMAGE):latest

all: image

image: Dockerfile
	docker build -t $(TO_UPLOAD) -t $(TO_UPLOAD_LATEST) $(shell dirname $<)

push: image
	docker push $(TO_UPLOAD)
	docker push $(TO_UPLOAD_LATEST)
