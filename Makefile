.PHONY: all clean

TW := node_modules/.bin/tiddlywiki
SOURCES := $(shell find wiki/ src/)

all: out/index.html

clean:
	rm -rf node_modules
	rm -rf out

node_modules:
	npm install

out/index.html: out node_modules $(SOURCES)
	@$(TW) --version
	@$(TW) ./wiki/ --build index

out:
	mkdir -p out

serve:
	$(TW) wiki/ --listen port=9999
