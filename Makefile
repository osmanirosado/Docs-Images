# Definitions Makefile

# Build an image using Dockerfile
docs-build:
# 	--tag=""   
# 	Repository names (and optionally with tags) to be applied to the resulting
# 	image in case of success. Refer to docker-tag(1) for more information
# 	about valid tag names.
	docker build --tag $(image) .

# Create the container
docs-create:
# 	--name string      Assign a name to the container
# 	--publish list     Publish a container's port(s) to the host
# 	--restart string   Restart policy to apply when a container exits (docs "no")
# 	--restart unless-stopped
# 	Always restart the container regardless of the exit status, but 
# 	do not start it on daemon startup if the container has been put to a
# 	stopped state before.
	docker create --name $(container) --publish $(port_map) \
		--restart unless-stopped \
		$(image)

# Remove the container
docs-rm:
	docker rm $(container)

# Start the container
docs-start:
	docker start $(container)

# Stop the container
docs-stop:
	docker stop $(container)

# Save the image to a file
docs-save:
	docker save $(image) -o $(tarfile)

# Load the image from a file
docs-load:
	docker load -i $(tarfile)

# Show container logs
docs-logs:
#	-f, --follow[=false]  Follow log output
	docker logs --follow $(container)

# Pull the image
docs-pull:
	docker pull $(image)
