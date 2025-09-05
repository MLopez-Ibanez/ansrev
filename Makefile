.PHONY: clean example test

example: example.tex ansrev.sty
	@$(MAKE) clean
	latexmk -pdf "example-main"
	latexmk -pdf "example-ansrev"
	latexmk -pdf "example-main-noquote"
	latexmk -pdf "example-ansrev-noquote"
	latexmk -pdf "example"
	@$(MAKE) clean

test:
	@$(MAKE) clean
	cd tests && ./run-tests

clean:
	rm -f tmp-* *.aux *.log *.out *.sta example-ansrev.pdf example-main.pdf *.fls *.bbl *.blg *.fdb_latexmk *.quo *.synctex.gz


