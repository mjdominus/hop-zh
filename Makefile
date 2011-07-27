XSLTPROC=xsltproc
XSLTPROC_PARAM=\
	--stringparam html.stylesheet "style.css" \
	--stringparam section.autolabel 1 \
	--stringparam section.label.includes.component.label 1 \
	--stringparam section.autolabel.max.depth 2 \
	--nonet
XML_CATALOG_FILES=catalog.xml

.PHONY: all single chunk clean

all: single chunk

single: single.html
chunk: index.html

single.html: index.xml ch*.xml single.xsl catalog.xml
	XML_CATALOG_FILES=${XML_CATALOG_FILES} ${XSLTPROC} ${XSLTPROC_PARAM} -o $@ single.xsl $<

index.html: index.xml ch*.xml chunk.xsl catalog.xml
	XML_CATALOG_FILES=${XML_CATALOG_FILES} ${XSLTPROC} ${XSLTPROC_PARAM} -o $@ chunk.xsl $<

catalog.xml: makecatalog.pl
	perl makecatalog.pl

clean:
	rm -rf single chunk *.html catalog.xml
