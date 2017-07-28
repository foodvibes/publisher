compile: install
	wt compile src/style -b "./static/style" -d "./static/media" && hugo

install:
	git submodule update --init --recursive
