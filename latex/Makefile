# Example typsetting of articles with Elsevier's LaTeX class,
# using the pdflatex command.

# https://www.elsevier.com/authors/author-schemas/latex-instructions
# https://www.elsevier.com/authors/author-schemas/preparing-crc-journal-articles-with-latex

# Paths to our elsarticle and elsarticle-ecrc installs, to copy template files
# from
ELSARTICLE = /ad/eng/opt/tex/texmf/tex/latex/elsarticle
ECRC = /ad/eng/opt/tex/texmf/tex/latex/elsarticle-ecrc

queue ?= bme.q

all: elsevier-harv elsevier-num elsevier-ecrc
	qstat

# Template Elsevier article, Harvard-style bibliography
elsevier-harv:
	cp -u $(ELSARTICLE)/elsarticle-template-harv.tex .
	qsub -N elsevier-harv -q $(queue) -j y elsevier.sh elsarticle-template-harv.tex

# Template Elsevier article, numbered bibliography
elsevier-num:
	cp -u $(ELSARTICLE)/elsarticle-template-num.tex .
	qsub -N elsevier-num -q $(queue) -j y elsevier.sh elsarticle-template-num.tex

# Template for the "Camera-ready copy" version, for journals that use that.
# It has placeholders in the text like <this> so there are a few warnings when
# using the file as-is.
elsevier-ecrc:
	cp -u $(ECRC)/ecrc-template.tex .
	qsub -N elsevier-ecrc -q $(queue) -j y elsevier.sh ecrc-template.tex

clean:
	rm -f {elsevier-num,elsevier-harv,elsevier-ecrc}.o*
	rm -f *.{log,aux,spl}
	rm -f *.{tex,pdf}
