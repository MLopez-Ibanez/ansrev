.PHONY: clean all

all: clean example

example: example.tex ansrev.sty
	@$(MAKE) clean
	#pdflatex -file-line-error -shell-escape -interaction=nonstopmode -synctex=1  -recorder  "example.tex"
	latexmk -pdf "example-main.tex"
	latexmk -pdf "example.tex"
	@$(MAKE) clean

clean:
	rm -f tmp-* *.aux *.log *.out *.sta
