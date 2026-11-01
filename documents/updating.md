# How to update scores to new EES Tools versions

## v2026.01.0 to v2026.11.0

- The new LilyPond version 2.26.0 (instead of 2.24.4) requires the following changes:
  - `timeSignatureFraction` → `timeSignature`
  - `'single-digit` → `'single-number`
  - `\medium` → `\normal-weight`
  - check separate beam subdivision functions (replace `baseMoment` by new properties)
- use the following new macros, remove any separate definitions:
  - `\brkBeam`
  - `\fermataFine`
  - `\mvD`
  - `\mvT`
  - `\pco`
- update the following files:
  - `engrave-and-release.yml`
  - `make.py` (only collections)



## v2023.10.0 to v2026.01.0

- add an ARK to `metadata.yaml`
- replace `[Tempo deest]` by `[no tempo]`
- use the following new macros, remove any separate definitions:
  - `\fC`
  - `\hA`
  - `\markCritnote`
  - `\mvTz`
  - `\skips`
  - `\setSoloText`
  - `\tempoTitleMarkup`
  - `\trillFlat`
  - `\vlne`
- update the following files:
  - `engrave-and-release.yml`
  - `make.py` (only collections)
  - `critical_report.tex` (only collections)


## v2022.01.0 to v2022.12.0

- remove `#(define option-init-toc #t)` from `definitions.ly`
- replace `\l` by `_` if no extenders are printed
