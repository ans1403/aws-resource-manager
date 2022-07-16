# Import Environment Variables

include .env


# Make Config

MAKEFLAGS += --no-print-directory


# Docker Constants

IMAGE       := hashicorp/terraform:1.1.9
WORKING_DIR := /usr/local/aws-resource-manager
ENV_FILE    := ./.env


# Commands

.PHONY: init
init:
	@ docker run --rm -it --platform linux/x86_64 \
		-w ${WORKING_DIR} \
		-v ${CURDIR}:${WORKING_DIR} \
		${IMAGE} init \
			-get=true \
			-backend=true \
			-backend-config='access_key=${AWS_ACCESS_KEY}' \
			-backend-config='secret_key=${AWS_SECRET_ACCESS_KEY}' \
			-backend-config='region=${S3_REGION}' \
			-backend-config='bucket=${S3_TFSTATE_BUCKET}' \
			-backend-config='key=${S3_TFSTATE_KEY}'

.PHONY: plan
plan:
	@ docker run --rm -it --platform linux/x86_64 \
		-w ${WORKING_DIR} \
		-v ${CURDIR}:${WORKING_DIR} \
		--env-file ${ENV_FILE} \
		${IMAGE} plan

.PHONY: apply
apply:
	@ docker run --rm -it --platform linux/x86_64 \
		-w ${WORKING_DIR} \
		-v ${CURDIR}:${WORKING_DIR} \
		--env-file ${ENV_FILE} \
		${IMAGE} apply

.PHONY: destroy
destroy:
	@ docker run --rm -it --platform linux/x86_64 \
		-w ${WORKING_DIR} \
		-v ${CURDIR}:${WORKING_DIR} \
		--env-file ${ENV_FILE} \
		${IMAGE} destroy
