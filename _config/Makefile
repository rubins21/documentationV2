all:
	npm i docusaurus-lunr-search  --save
	npm run swizzle docusaurus-lunr-search SearchBar -- --eject --danger
	npm run build
	cp docs/_config/htmlinject.lua build
	chmod +x build/htmlinject.lua
	cp docs/_config/ins.txt build
	cd build && ./htmlinject.lua
	cp docs/_config/favicon.ico build/img/favicon.ico
	cp docs/_config/fmadio-logo.png build/img/fmadio-logo.png
 
