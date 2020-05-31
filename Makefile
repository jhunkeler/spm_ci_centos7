REGISTRY=jhunkeler
IMAGE=spm_ci_centos
TAG=$(shell git describe --long)
TO_UPLOAD=$(REGISTRY)/$(IMAGE):$(TAG)

all: image

image: Dockerfile
	docker build -t $(TO_UPLOAD) $(shell dirname $<)

push: image
	docker push $(TO_UPLOAD)
