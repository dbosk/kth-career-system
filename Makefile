.PHONY: all
all: svar.pdf o3mini.pdf kommentar.pdf

svar.pdf: svar.tex
kommentar.pdf: kommentar.tex kommentar.bib sammanfattning.tex
o3mini.pdf: o3mini.tex

%.pdf: %.tex
	latexmk -xelatex -pdf -shell-escape $<

svar.pdf: ./KTH_logo_PMS_2757_U_Obestruket_papper_Marinbla.eps
svar.pdf: uppdrag.txt utredning.txt
svar.pdf: kommentar.pdf

uppdrag.txt: ./uppdrag-karriärsystem.pdf
utredning.txt: ./utredning-karriärsystem.pdf

kommentar.zip:
	zip -o $@ kommentar.tex kommentar.bib Makefile sammanfattning.tex  didactic.sty

%.txt:
	pdf2txt $< > $@

.PHONY: clean
clean:
	latexmk -c
	rm -f svar.pdf uppdrag.txt utredning.txt
	rm -f kommentar.pdf o3mini.pdf
