.PHONY: all clean

TW := node_modules/.bin/tiddlywiki
SOURCES := $(shell find wiki/ src/)

all: out/index.html

clean:
	rm -rf node_modules
	rm -rf out

node_modules:
	npm install

wiki/plugins/project-thing: wiki/plugins
	ln -s ../../src ./wiki/plugins/project-thing

wiki/plugins:
	mkdir -p wiki/plugins

out/index.html: out node_modules $(SOURCES) wiki/plugins/project-thing
	@$(TW) --version
	@$(TW) ./wiki/ --build index

out:
	mkdir -p out

serve:
	$(TW) wiki/ --listen port=9999
