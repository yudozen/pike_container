MAKEFILE_DIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

include ${MAKEFILE_DIR}.env

PIKE := docker run --rm \
	-v .:/terraform \
	${IMAGE_NAME}

echo:
	echo "Makefile dir=${MAKEFILE_DIR}"

pike_build:
	docker build \
		--build-arg ORIGINAL_IMAGE_NAME=${ORIGINAL_IMAGE_NAME} \
		-t ${IMAGE_NAME} \
		-f ${MAKEFILE_DIR}Dockerfile ${MAKEFILE_DIR}

pike_version:
	${PIKE} --version

pike_sh:
	docker run --rm -it -v .:/terraform --entrypoint sh ${IMAGE_NAME}
