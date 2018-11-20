.PHONY: env-up env-down build-tracker run-tracker copy-fixtures

##### ENV
env-up: env-down copy-fixtures
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
run-tracker: build-tracker
	@echo "Starting tracker ..."
	@cd cmd/tracker && ./tracker

##### COPY
copy-fixtures:
	@echo "Copying fixtures ..."
	@cp -r fixtures /tmp