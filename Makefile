start: node_modules
	npm start

node_modules: package.json
	npm install

clean:
	rm -rf .bundle.js node_modules

.PHONY: clean
