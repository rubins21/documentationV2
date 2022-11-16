# Install Node.js on ubuntu

```
cd ~
curl -sL https://deb.nodesource.com/setup_18.x -o /tmp/nodesource_setup.sh

sudo bash /tmp/nodesource_setup.sh

sudo apt install nodejs

node -v
```

# Install Docusaurus

```
npx create-docusaurus@latest fmadio-doc classic

npm i docusaurus-lunr-search  --save

```

git clone git@github.com:fmadio/documentationV2.git
rm docs
mv documentationV2 docs
cp docs/_config/docusaurus.config.js
cp docs/_config/static/index.html
del src/pages/index.js

# Congifure Docusaurus

```
npm run swizzle docusaurus-lunr-search SearchBar -- --eject --danger

npm run build

npx http-server ./build
```




