export DOCKER_NODE_TAG=12-slim

define local-dev
	docker run \
		--rm \
		--interactive \
		--tty \
		--name node \
		--hostname node \
		--user `id --user`:`id --group` \
		--publish 8080:8080 \
		--mount type=bind,source=${PWD}/app/,target=/home/node/app/ \
		--workdir /home/node/app/ \
		node:${DOCKER_NODE_TAG} $1
endef

.PHONY: bash
bash:
	$(call local-dev, bash)

.PHONY: start
start:
	$(call local-dev, npm start)
