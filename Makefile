MDS := $(filter-out README.md, $(wildcard *.md))
PDFS := $(MDS:.md=.pdf)

all: $(PDFS)

clean:
	rm *.tex *.aux *.log *.out

%.tex: %.md
	pandoc -so $@ $< --template=./template.latex

%.pdf: %.tex
	pdflatex $<

.PHONY: all
