
# Documentation url
base_url=https://docs.python.org/3.6/archives
# Documentation package
file=python-3.6.8-docs-html.tar.bz2

# Image tag
image=python-docs:latest
# Container name
container=python-docs
# File to store the image
tarfile=python-docs-image.tar

port_map=8082:80

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
