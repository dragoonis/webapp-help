OS := $(shell uname)

preview:
ifeq ($(OS),Darwin)
	# helm chart versions
	sed -i "" -e "s/version:.*/version: $(PREVIEW_VERSION)/" Chart.yaml
	sed -i "" -e "s/version:.*/version: $(PREVIEW_VERSION)/" ../*/Chart.yaml
	sed -i "" -e "s/preview_version:.*/version: $(PREVIEW_VERSION)/" requirements.yaml
	sed -i "" -e "s/web_version:.*/version: $(PREVIEW_VERSION)/" requirements.yaml
	sed -i "" -e "s/frontend_version:.*/version: $(PREVIEW_VERSION)/" requirements.yaml

	# docker repository
	# todo - see what preview should be
	sed -i "" -e "s|repository_preview:.*|repository: $(DOCKER_REGISTRY)\/kuflink\/web|" values.yaml
	sed -i "" -e "s|repository_web:.*|repository: $(DOCKER_REGISTRY)\/kuflink\/web|" values.yaml
	sed -i "" -e "s|repository_frontend:.*|repository: $(DOCKER_REGISTRY)\/kuflink\/frontend|" values.yaml

	# image tag
	sed -i "" -e "s/tag_preview:.*/tag: $(PREVIEW_VERSION)/" values.yaml
	sed -i "" -e "s/tag_web:.*/tag: $(PREVIEW_VERSION)/" values.yaml
	sed -i "" -e "s/tag_frontend:.*/tag: $(PREVIEW_VERSION)/" values.yaml

	# update image:tags in the kuflink webapp's (api, frontend, web)
	# image tag
	sed -i "" -e "s/tag:.*/tag: $(PREVIEW_VERSION)/" ../frontend/values.yaml
	sed -i "" -e "s/tag:.*/tag: $(PREVIEW_VERSION)/" ../web/values.yaml

	# image url
	sed -i "" -e "s|repository:.*|repository: $(DOCKER_REGISTRY)\/kuflink\/web|" ../web/values.yaml
	sed -i "" -e "s|repository:.*|repository: $(DOCKER_REGISTRY)\/kuflink\/frontend|" ../frontend/values.yaml

else ifeq ($(OS),Linux)
	# helm chart versions
	sed -i -e "s/version:.*/version: $(PREVIEW_VERSION)/" Chart.yaml
	sed -i -e "s/version:.*/version: $(PREVIEW_VERSION)/" ../*/Chart.yaml
	sed -i -e "s/preview_version:.*/version: $(PREVIEW_VERSION)/" requirements.yaml
	sed -i -e "s/web_version:.*/version: $(PREVIEW_VERSION)/" requirements.yaml
	sed -i -e "s/frontend_version:.*/version: $(PREVIEW_VERSION)/" requirements.yaml

	# docker repository
	# todo - see what preview should be
	sed -i -e "s|repository_preview:.*|repository: $(DOCKER_REGISTRY)\/kuflink\/web|" values.yaml
	sed -i -e "s|repository_web:.*|repository: $(DOCKER_REGISTRY)\/kuflink\/web|" values.yaml
	sed -i -e "s|repository_frontend:.*|repository: $(DOCKER_REGISTRY)\/kuflink\/frontend|" values.yaml

	# image tag
	sed -i -e "s/tag_preview:.*/tag: $(PREVIEW_VERSION)/" values.yaml
	sed -i -e "s/tag_frontend:.*/tag: $(PREVIEW_VERSION)/" values.yaml
	sed -i -e "s/tag_web:.*/tag: $(PREVIEW_VERSION)/" values.yaml

  # update image:tags in the kuflink webapp's (api, frontend, web)
	# image tag
	sed -i -e "s/tag:.*/tag: $(PREVIEW_VERSION)/" ../frontend/values.yaml
	sed -i -e "s/tag:.*/tag: $(PREVIEW_VERSION)/" ../web/values.yaml

	# image url
	sed -i -e "s|repository:.*|repository: $(DOCKER_REGISTRY)\/kuflink\/web|" ../web/values.yaml
	sed -i -e "s|repository:.*|repository: $(DOCKER_REGISTRY)\/kuflink\/frontend|" ../frontend/values.yaml

else
	echo "platfrom $(OS) not supported to release from"
	exit -1
endif

	jx step helm build
