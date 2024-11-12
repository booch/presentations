slides: slides.html

setup:
	mise -y install
	brew install --quiet marp-cli
	brew upgrade --quiet marp-cli

dev:
	marp --config=marp.yml --watch --browser=firefox slides.md -o slides.html

html: slides

all: thumbnail slides pdf

pdf: slides.pdf

thumbnail: og-image.png

.PHONY: slides dev setup html all pdf

slides.html: slides.md slides.css
	marp --config=marp.yml slides.md -o slides.html

slides.pdf: slides.md slides.css
	marp --config=marp.yml --pdf --preview slides.md -o slides.pdf

og-image.png: slides.md slides.css
	marp  --config=marp.yml --image=png slides.md -o og-image.png --allow-local-files
    # - generate slide-show with `--og-image=`
    # - or add `image: og-image.png` to marp.yml
