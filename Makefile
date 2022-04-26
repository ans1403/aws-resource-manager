MAKEFLAGS += --no-print-directory

.PHONY: init
init:
	@ docker-compose run --rm terraform init \
		-get=true \
		-backend=true \
		-backend-config="access_key=$(AWS_ACCESS_KEY)" \
		-backend-config="secret_key=$(AWS_SECRET_ACCESS_KEY)"

.PHONY: plan
plan:
	@ docker-compose run --rm terraform plan

.PHONY: apply
apply:
	@ docker-compose run --rm terraform apply

.PHONY: destroy
destroy:
	@ docker-compose run --rm terraform destroy
