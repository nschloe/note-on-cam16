# ./Makefile

# ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ###

# JComp uses pdflatex, TeXLive 2009.
LATEX:=lualatex
LATEX_OPTIONS:=-shell-escape

# ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ###

TARGET:=main

ARXIV_DIR:=arxiv

# ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ###
# 

default: main

main:
	@$(LATEX) $(LATEX_OPTIONS) $(TARGET)
	qpdf --linearize $(TARGET).pdf out.pdf

.PHONY: clean

arxiv:
	mkdir "$(ARXIV_DIR)"
	cp Makefile \
	   abstract.tex \
	   algorithm.tex \
	   conclusions.tex \
	   discretization.tex \
	   header.tex \
	   introduction.tex \
	   main.tex \
	   numerical-methods.tex \
	   numerical-results.tex \
	   main.bbl \
	   "$(ARXIV_DIR)"

clean:
	@rm -f $(TARGET)-blx.bib \
	       $(TARGET).aux \
	       $(TARGET).out \
	       $(TARGET).auxlock \
	       $(TARGET).bbl \
	       $(TARGET).blg \
	       $(TARGET).log \
	       $(TARGET).pdf \
	       $(TARGET)-figure*.pdf \
	       $(TARGET)-figure*.log \
	       $(TARGET)-figure*.dpth \
	       $(TARGET).snm \
	       $(TARGET).spl \
	       $(TARGET)-figure*.spl \
	       $(TARGET).nav
	@rm -f missfont.log \
	       x.log
	@rm -f revision.tex
	@rm -f *~
	@rm -rf "$(ARXIV_DIR)"
