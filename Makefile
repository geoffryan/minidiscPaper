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
	zip -r toArxiv arxiv

apj: .FORCE
	mkdir -p apj
	pdflatex cover_apj.tex
	cp -f cover_apj.pdf apj/
	cp $(TEX) $(DOC).bbl $(INC) apj/
	#cp -f readme_apj.txt apj/
	#cp figs/*.pdf apj/
	#cp referee_response.txt apj/
	cp figs/domain.pdf apj/f1.pdf
	cp figs/q011_m3_mdot.pdf apj/f2.pdf
	cp figs/q011_m3_sig_0000.pdf apj/f3.pdf
	cp figs/q011_m3_sig_0050.pdf apj/f4.pdf
	cp figs/q011_m3_sig_0200.pdf apj/f5.pdf
	cp figs/q011_m3_sig_0500.pdf apj/f6.pdf
	cp figs/q011_m3_sig_1300.pdf apj/f7.pdf
	cp figs/q011_m3_sig_2800.pdf apj/f8.pdf
	cp figs/mdot_all.pdf apj/f9.pdf
	cp figs/tacc.pdf apj/f10.pdf
	cp figs/q011_all_tanq_mach.pdf apj/f11.pdf
	cp figs/q011_m3_diss_r.pdf apj/f12.pdf
	cp figs/q011_m3_alpha_r.pdf apj/f13.pdf
	cp figs/q011_m2_torque_r.pdf apj/f14.pdf
	cp figs/q011_m3_torque_r.pdf apj/f15.pdf
	cp figs/q011_m4_torque_r.pdf apj/f16.pdf
	cp figs/q011_m3_im.pdf apj/f17.pdf
	cp figs/q011_spec_all.pdf apj/f18.pdf
	cp figs/q011_bc_hr_comp.pdf apj/f19.pdf
	sed -i '' "s:figs/domain.pdf:f1.pdf:g" apj/minidisc_paper.tex
	sed -i '' "s:figs/q011_m3_mdot.pdf:f2.pdf:g" apj/minidisc_paper.tex
	sed -i '' "s:figs/q011_m3_sig_0000.pdf:f3.pdf:g" apj/minidisc_paper.tex
	sed -i '' "s:figs/q011_m3_sig_0050.pdf:f4.pdf:g" apj/minidisc_paper.tex
	sed -i '' "s:figs/q011_m3_sig_0200.pdf:f5.pdf:g" apj/minidisc_paper.tex
	sed -i '' "s:figs/q011_m3_sig_0500.pdf:f6.pdf:g" apj/minidisc_paper.tex
	sed -i '' "s:figs/q011_m3_sig_1300.pdf:f7.pdf:g" apj/minidisc_paper.tex
	sed -i '' "s:figs/q011_m3_sig_2800.pdf:f8.pdf:g" apj/minidisc_paper.tex
	sed -i '' "s:figs/mdot_all.pdf:f9.pdf:g" apj/minidisc_paper.tex
	sed -i '' "s:figs/tacc.pdf:f10.pdf:g" apj/minidisc_paper.tex
	sed -i '' "s:figs/q011_all_tanq_mach.pdf:f11.pdf:g" apj/minidisc_paper.tex
	sed -i '' "s:figs/q011_m3_diss_r.pdf:f12.pdf:g" apj/minidisc_paper.tex
	sed -i '' "s:figs/q011_m3_alpha_r.pdf:f13.pdf:g" apj/minidisc_paper.tex
	sed -i '' "s:figs/q011_m2_torque_r.pdf:f14.pdf:g" apj/minidisc_paper.tex
	sed -i '' "s:figs/q011_m3_torque_r.pdf:f15.pdf:g" apj/minidisc_paper.tex
	sed -i '' "s:figs/q011_m4_torque_r.pdf:f16.pdf:g" apj/minidisc_paper.tex
	sed -i '' "s:figs/q011_m3_im.pdf:f17.pdf:g" apj/minidisc_paper.tex
	sed -i '' "s:figs/q011_spec_all.pdf:f18.pdf:g" apj/minidisc_paper.tex
	sed -i '' "s:figs/q011_bc_hr_comp.pdf:f19.pdf:g" apj/minidisc_paper.tex
	tar -zcvf toApj.tar.gz apj

clean:
	rm -f $(PDF)
	rm -f *.aux *.lof *.log *.lot *.synctex.gz
	rm -f *.toc
	rm -f *.bbl
	rm -rf apj/
	rm -rf arxiv/
	rm -f toApj.tar.gz
	rm -f toArxiv.zip

.FORCE:
