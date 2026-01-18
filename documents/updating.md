# How to update scores to new EES Tools versions

## v2023.10.0 to v2026.01.0

- add an ARK to `metadata.yaml`
- replace `[Tempo deest]` by `[no tempo]`
- use the following new macros, remove any separate definitions:
  - `\vlne`
  - `\fC`
  - `\markCritnote`
  - `\mvTz`
  - `\skips`
  - `\setSoloText`
  - `\tempoTitleMarkup`
  - `\trillFlat`
- update the following files:
  - `engrave-and-release.yml`
  - `make.py` (only collections)
  - `critical_report.tex` (only collections)

## v2022.01.0 to v2022.12.0

- remove `#(define option-init-toc #t)` from `definitions.ly`
- replace `\l` by `_` if no extenders are printed
