.PHONY: all

all: node_modules wiki/plugins/project-thing
	npm run wiki

node_modules:
	npm install

wiki/plugins/project-thing: wiki/plugins
	ln -s ../../src ./wiki/plugins/project-thing

wiki/plugins:
	mkdir -p wiki/plugins
