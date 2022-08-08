.PHONY: all clean serve

TW := node_modules/.bin/tiddlywiki

all: out/index.html

clean:
	rm -rf node_modules
	rm -rf out

serve: node_modules wiki/plugins/project-thing src/plugin.info
	$(TW) wiki/ --listen port=9999

src/plugin.info: src/version.json
	./etc/setVersion.sh

node_modules:
	npm install

wiki/plugins/project-thing: wiki/plugins
	ln -s ../../src ./wiki/plugins/project-thing

wiki/plugins:
	mkdir -p wiki/plugins

out/index.html: out node_modules wiki/plugins/project-thing src/plugin.info
	$(TW) --version
	$(TW) ./wiki/ --build index

out:
	mkdir -p out

