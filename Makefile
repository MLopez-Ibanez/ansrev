.PHONY: clean example

example: example.tex ansrev.sty
	@$(MAKE) clean
	latexmk -pdf "example-main.tex"
	latexmk -pdf "example.tex"
	@$(MAKE) clean

clean:
	rm -f tmp-* *.aux *.log *.out *.sta example-ansrev.pdf example-main.pdf *.fls *.bbl *.blg *.fdb_latexmk

