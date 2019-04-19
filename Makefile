PLATFORM       ?= arm64v8
ALPINE-RELEASE ?= 3.9
PYTHON-VERSION ?= 3.6

IMAGE_NAME:=tdmproject/alpine-python-$(shell echo $(PYTHON-VERSION) | cut -f 1 -d '.')
IMAGE_TAG:=$(PLATFORM)-$(ALPINE-RELEASE)-$(PYTHON-VERSION)
IMAGE_TAGNAME:=$(IMAGE_NAME):$(IMAGE_TAG)

all: build

build:
	docker build --build-arg PLATFORM=$(PLATFORM) \
		--build-arg ALPINE_RELEASE=$(ALPINE-RELEASE) \
		--build-arg PYTHON_VERSION=$(PYTHON-VERSION) \
		-f docker/Dockerfile \
		-t $(IMAGE_TAGNAME) .
	docker tag $(IMAGE_TAGNAME) $(IMAGE_NAME):$(PLATFORM)-$(ALPINE-RELEASE)

push:
	docker push $(IMAGE_TAGNAME)
	docker push $(IMAGE_NAME):$(PLATFORM)-$(ALPINE-RELEASE)
