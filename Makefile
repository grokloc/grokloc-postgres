DOCKER        = docker
IMG_DEV       = grokloc/grokloc-postgres:dev
VERSION       = 0.0.1
IMG_VERSIONED = grokloc/grokloc-postgres:$(VERSION)
CONTAINER     = pg
APP_URL       = postgres://grokloc:grokloc@localhost:5432/app

.PHONY: up
up:
	$(DOCKER) run -d --name=$(CONTAINER) --env-file=./env/dev.env -p 5432:5432 $(IMG_DEV)

.PHONY: up-host
up-host:
	$(DOCKER) run -d --network=host --name=$(CONTAINER) --env-file=./env/dev.env $(IMG_DEV)

.PHONY: down
down:
	$(DOCKER) stop $(CONTAINER)
	$(DOCKER) rm $(CONTAINER)

.PHONY: docker
docker:
	$(DOCKER) build . -f Dockerfile -t $(IMG_DEV)
	$(DOCKER) tag $(IMG_DEV) $(IMG_VERSIONED)

.PHONY: docker-push
docker-push:
	$(DOCKER) push $(IMG_DEV)
	$(DOCKER) push $(IMG_VERSIONED)

.PHONY: docker-pull
docker-pull:
	$(DOCKER) pull $(IMG_DEV)
	$(DOCKER) pull $(IMG_VERSIONED)

.PHONY: psql
psql:
	psql $(APP_URL)
