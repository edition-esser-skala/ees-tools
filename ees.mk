.RECIPEPREFIX = >
.DEFAULT_GOAL = info
LILYPOND = lilypond -ddelete-intermediate-files -dno-point-and-click --include=$(EES_TOOLS_PATH)/
notes = $(shell find notes -name '*.ly' | sed -E 's#notes/(.*)\.ly#\1#g' | tr '\n' ' ')
scores = $(shell find scores -name '*.ly' | sed -E 's#scores/(.*)\.ly#\1#g' | tr '\n' ' ')

# dependencies of scores

## individual scores (e.g., 'make full_score')
$(scores): %: tmp/%.pdf
$(scores:%=tmp/%.pdf): tmp/%.pdf: scores/%.ly \
                                  $(notes:%=notes/%.ly) \
                                  definitions.ly
>mkdir -p tmp
>$(LILYPOND) -dlog-file=$(basename $@).ly -o tmp '$(realpath $<)'
>cat $(basename $@).ly.log

## all scores ('make scores')
.PHONY: scores
scores: $(scores)


# dependencies of final scores (i.e., front matter + notes)

## MIDI archive
.PHONY: final/midi
final/midi:
>mkdir -p final
>if [ -d midi ]; then zip -j final/midi_collection.zip midi/*; fi


## individual final scores (e.g., 'make final/full_score')
$(scores:%=final/%): %: %.pdf
$(scores:%=final/%.pdf): final/%.pdf: front_matter/critical_report.tex \
                                      tmp/%.pdf \
                                      metadata.yaml \
                                      CHANGELOG.md
>python $(EES_TOOLS_PATH)/read_metadata.py edition -c tag -t $*
>latexmk -cd \
>        -lualatex \
>        -outdir=../final \
>        -jobname=$* \
>        front_matter/critical_report.tex
> cp final/$*.log tmp/$*.tex.log
>latexmk -c \
>        -outdir=final \
>        -jobname=$* \
>        front_matter/critical_report.tex

## all final scores (`make final/scores')
.PHONY: final/scores
final/scores: final/midi $(scores:%=final/%)
>python $(EES_TOOLS_PATH)/parse_logs.py | tee tmp/_logs.txt

# info
space := $(subst ,, )
sep := ", "
info:
>@color=`tput setaf 6; tput bold`; \
>reset=`tput sgr0`; \
>echo "Specify one of the following $${color}targets$${reset} to create:"; \
>echo "* $${color}$(subst $(space),$(sep),$(scores))$${reset}: individual scores (LilyPond output only)"; \
>echo "* $${color}scores$${reset}: all scores"; \
>echo "* $${color}$(subst $(space),$(sep),$(scores:%=final/%))$${reset}: individual final scores (LilyPond output + front matter)"; \
>echo "* $${color}final/midi$${reset}: MIDI archive"; \
>echo "* $${color}final/scores$${reset}: all final scores and the MIDI archive"; \
>echo "* $${color}info$${reset}: prints this message"
