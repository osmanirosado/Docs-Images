# Django source code
# https://www.djangoproject.com/download/1.11.18/tarball/

# Documentation url
base_url=https://docs.djangoproject.com/m/docs
# Documentation package
file=django-docs-1.11-en.zip

# Image tag
image=django-docs:latest
# Container name
container=django-docs
# File to store the image
tarfile=django-docs-image.tar

# Port mapping
port_map=8083:80

include ../Makefile

$(file):
	curl --output $(file) $(base_url)/$(file)

build: $(file) docs-build

create:	docs-create
rm: docs-rm

start: docs-start
stop: docs-stop

save: docs-save
load: docs-load

logs: docs-logs
