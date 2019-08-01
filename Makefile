.PHONY: compile css install content

compile: install css content
	hugo

css:
	wt compile src/style -b "./static/style" -d "./static/media"

install:
	git submodule update --init --recursive

content:
	./transcode.sh

