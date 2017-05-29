edit:
	killall hugo; hugo server --bind=192.168.0.14 -b 192.168.0.14 & wt watch src/style -b "./static/style" -d "./static/media"

compile: install
	wt compile src/style -b "./static/style" -d "./static/media" && hugo

install:
	git submodule update --init --recursive

local:
	hugo server --bind=192.168.0.14 -b 192.168.0.14
