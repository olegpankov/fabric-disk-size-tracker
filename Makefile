.PHONY: env-up env-down build-tracker run-tracker

##### ENV
env-up: env-down
	@echo "Start environment ..."
	@cd fixtures && docker-compose up -d --force-recreate --build
	@sleep 5
	@cd fixtures && ./channel.sh
	@cd fixtures && ./chaincode.sh
	@echo "Environment up"

env-down:
	@echo "Stop environment ..."
	@cd fixtures && docker-compose down -v
	@echo "Environment down"

##### BUILD
build-tracker:
	@echo "Building tracker ..."
	@cd cmd/tracker && go build
	@echo "Build done"

##### RUN
run-api: build-tracker
	@echo "Starting tracker ..."
	@cd cmd/tracker && ./tracker