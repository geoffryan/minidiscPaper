DOC = minidisc_paper
BIB = minidisc_sources.bib
INC = 

TEX = $(DOC).tex
PDF = $(DOC).pdf

default: paper

all: paper apj arxiv

paper: $(PDF)

$(PDF): $(TEX) $(BIB) $(INC)
	pdflatex $(TEX)
	bibtex $(DOC)
	pdflatex $(TEX)
	pdflatex $(TEX)
	open $(PDF)

arxiv: .FORCE
	mkdir -p arxiv
	mkdir -p arxiv/figs
	cp $(TEX) $(DOC).bbl $(INC) arxiv/
	cp figs/*.pdf arxiv/figs/
	cp *.sty arxiv/
	zip -r toArxiv arxiv

apj: .FORCE
	mkdir -p apj
	pdflatex cover_apj.tex
	cp cover_apj.pdf apj/
	cp $(TEX) $(DOC).bbl $(INC) apj/
	cp readme_apj.txt apj/
	cp figs/*.pdf apj/
	#cp referee_response.txt apj/
	#cp figs/data_trim.pdf apj/f1.pdf
	#cp figs/discrepancies.pdf apj/f2.pdf
	#cp figs/110422A_corner.pdf apj/f3a.pdf
	#cp figs/110422A_lightcurve.pdf apj/f3b.pdf
	#cp figs/distribution_Th0.pdf apj/f4a.pdf
	#cp figs/distribution_cut_Th0.pdf apj/f4b.pdf
	#cp figs/distribution_ThObs.pdf apj/f5a.pdf
	#cp figs/distribution_cut_ThObs.pdf apj/f5b.pdf
	#cp figs/distribution_p.pdf apj/f6a.pdf
	#cp figs/distribution_cut_p.pdf apj/f6b.pdf
	#cp referee_response.txt apj/
	#sed -i '' "s:figs/data_trim.pdf:f1.pdf:g" apj/scalefit_paper.tex
	#sed -i '' "s:figs/discrepancies.pdf:f2.pdf:g" apj/scalefit_paper.tex
	#sed -i '' 's:figs/110422A_corner.pdf:f3a.pdf:g' apj/scalefit_paper.tex
	#sed -i '' 's:figs/110422A_lightcurve.pdf:f3b.pdf:g' apj/scalefit_paper.tex
	#sed -i '' 's:figs/distribution_Th0.pdf:f4a.pdf:g' apj/scalefit_paper.tex
	#sed -i '' 's:figs/distribution_cut_Th0.pdf:f4b.pdf:g' apj/scalefit_paper.tex
	#sed -i '' 's:figs/distribution_ThObs.pdf:f5a.pdf:g' apj/scalefit_paper.tex
	#sed -i '' 's:figs/distribution_cut_ThObs.pdf:f5b.pdf:g' apj/scalefit_paper.tex
	#sed -i '' 's:figs/distribution_p.pdf:f6a.pdf:g' apj/scalefit_paper.tex
	#sed -i '' 's:figs/distribution_cut_p.pdf:f6b.pdf:g' apj/scalefit_paper.tex
	tar -zcvf toApj.tar.gz apj

clean:
	rm -f $(PDF)
	rm -f *.aux *.lof *.log *.lot *.synctex.gz
	rm -f *.toc
	rm -f *.bbl
	rm -rf apj/
	rm -rf arxiv/
	rm -f toApj.tar.gz

.FORCE:
