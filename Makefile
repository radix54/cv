.PHONY: all build en it clean

TARGET := master.tex
CV_LANG ?= en
PDFLATEX ?= pdflatex
PDFLATEX_FLAGS := -interaction=nonstopmode -halt-on-error

ifeq ($(filter $(CV_LANG),en it),)
$(error Unsupported CV_LANG '$(CV_LANG)'; choose 'en' or 'it')
endif

all: build

build:
	$(PDFLATEX) $(PDFLATEX_FLAGS) "\def\cvlang{$(CV_LANG)}\input{$(TARGET)}"
	$(PDFLATEX) $(PDFLATEX_FLAGS) "\def\cvlang{$(CV_LANG)}\input{$(TARGET)}"

en:
	$(MAKE) CV_LANG=en build

it:
	$(MAKE) CV_LANG=it build

clean:
	rm -f *.aux *.log *.out *.toc *.pdf *.fls *.fdb_latexmk
