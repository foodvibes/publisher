.PHONY: compile css install

compile: install css
	hugo

css:
	wt compile src/style -b "./static/style" -d "./static/media"

install:
	git submodule update --init --recursive
