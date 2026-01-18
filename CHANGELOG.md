# Changelog

## v2026.01.0 – 2026-01-18

### Added

- macros:
  - annotations: `\aDue`, `\aDueE`, `\aTre`, `\aTreE`, `\aQuattro`, `\aQuattroE`, `\vlne`, and `\vlneE`
  - dynamics: `\ffz`, `\fzp`, and `\perd` (with editorial variants)
  - `\fC`, which forces the current clef to be printed
  - `\fivehatflat` and `\fivehatnatural`, which are similar to `\fivehat` but add the respective accidentals
  - `\hA`, which hides an accidental
  - `\markCritnote`, which prints an asterisk above the system
  - `\mvTz`, which tweaks the X-offset of a markup back to zero
  - `\setSoloText` and `\setSoloIIText`, which set and format the solo(II) text for `\partCombine`
  - `\skips`, which skips notes in lyrics
  - `\tempoTitle` and `\tempoTitleMarkup`, which format inline section titles (with tempo indication)
  - `\trillFlat`, `\trillNatural`, and `\trillSharp`, which print a trill with the respective accidental
- scheme functions:
  - `#(dotbf n)`, `#(dotbfflat n)`, `#(dotbfnatural n)`, and `#(dotbfsharp n)`, which print a dotted bass figure, including the respective accidental
- a class option `enlargefirstpage` to enlarge the first page of the critical report
- YAML metadata keys:
  - `ark`: Archival Resource Key of the edition
  - `orcid`: editor's ORCID
- a script `make_collection.py` for creating collections of works, and its documentation
- Editorial guidelines now clarify that
  - in the org part, an alto clef in fugues is transcribed as treble ottavo.
  - in the staff column of the TOE, an abbreviation like “vl” denotes all staves of the corresponding group.
  - missing tempo indications are denoted as “[no tempo]”.
- LilyPond snippets:
  - two violins colla parte with soprano and alto
  - alternative `\startDeleted` and `\stopDeleted` which use “vide” coda marks
- bash snippets:
  - rename files with sequential numbers
  - resize images to same width
  - merge images horizontally
  - reset image orientation to portrait or landscape
  - extract even pages of a PDF
  - download images via `iiif-download`
- spacing recommendations:
  - choral scores with three stanzas
  - alternative for vocal scores with two staves
  - alternative for five staves per page
- information on how to include a snippet in the TOE
- a hexlogo for EES tools
- documentation for repositories of collected works


### Changed

- improved documentation of incipits in special situations
- extended IMSLP instructions (tagging, instrument names)
- improved spacing recommendations for seven staves per page
- Stanza numbers now use the same font as lyrics.
- The asterisk for critical notes is now a red star.
- The company name in the imprint is now “Edition Esser-Skala e.U.”.
- The engrave-and-release workflow now syncs PDFs to the website server. The workflow in ees-template has been updated accordingly.


### Fixed

- `\markDaCapo` is now correctly displayed at stave breaks.
- In `add_variables.py` and `instrument_data.csv`, violas and trombones now use the correct clefs.
- The placeholder in `ly:create-toc-file` is now `G_` (necessary for compatibility with Guile 3.0).


### Removed

- `read_metadata.py`: subparsers (now only the previous `edition` functionality is supported)


## v2023.10.0 – 2023-10-06

### Added

- commands for “piano assai” (`\passai` and `\passaiE`), which are internally created by the new command `\dynScriptSuffix`
- `\fivehat`, which prints a bass figure 5 with a hat for indicating a diminished fifth
- snippets:
  - `\looseNotes`, which reverts a previous `\tightNotes`
  - alto/tenore incipits with trombones
  - incipit for voices with accompanying strings
  - tacet followed by repeated movement (e.g., Benedictus tacet – Osanna da capo)
  - unmetered notation
- README sections:
  - useful bash snippets (extract individual images from a PDF, crop a PDF)
  - instructions how to create a new EES Tools release
- utils:
  - scripts for downloading high-resolution images from SLUB (`download_from_slub.sh`) and Spitz (`download_from_spitz.sh`)
  - usage messages to all downloader scripts
  - a script for merging the first pages of several PDF files (`merge_first_pages.sh`)


### Changed

- The title page now displays the editor of a piece. It may be set via the new optional key `editor` in `metadata.yaml` and the LaTeX macro `\editor`, and is accessible via `\MetadataEditor`.
- The copyright information now contains the place of publication and the statement that Edition Esser-Skala is a Selbstverlag according to the Gewerbeordnung.
- `\org`, `\vlc`, `\bassi`, `\senzaOrg`, and `\colOrg` (as well as their corresponding editorial variants) now conform to the used abbreviations (e.g., `\org` prints “org” instead of “Org.”).
- `ees-tools` now uses LilyPond v2.24.2 and TinyTeX v2023.10.
- In the EES template, `manuscript` may now also be a symlink and still be ignored by git.


### Fixed

- `\eesCommentaryAfterToe` now may contain arbitrary contents. Previously, it did not support a range of commands, such as `\section` or `\clearpage`.
- The start of the bass figure extender after `\l` has been improved so that it aligns correctly with the bass note above.
- `option-instrument-name-lower` in `score_settings/four_staves.ly`, which previously generated an error
- various pylint problems in `parse_logs.py`, `read_metadata.py`, and `utils/add_variables.py`



## v2023.02.0 – 2023-02-14

### Added

- a make target `final/midi`, which creates a MIDI archive `midi_collection.zip` containing all MIDI files in folder `midi`
- inclusion of `ees_articulate.ly` in `ees-template`


### Changed

- The make target `final/scores` now also generates the MIDI archive.
- The GitHub Actions workflow now also includes the MIDI archive in the release.


## v2022.12.0 – 2023-01-14

### Breaking changes

None, but you may
- remove `#(define option-init-toc #t)` from `definitions.ly`
- replace `\l` by `_` if no extenders are printed


### Added

- TODO list
- changelog
- `documents/imslp_instructions.md`, which describes how to submit scores to IMSLP
- a folder `utils` with the following scripts:
  - `add_variables.py` (moved here)
  - `download_from_manuscriptorium.sh`: obtains high-resolution images from Manuscriptorium
  - `split_image.sh`: splits double-sided PDFs
- `ees_articulate.ly`, a customized MIDI articulation script
- support for `chords` instrument in `add_variables.py`
- in front matter: EES Tools version used for typesetting (available via `\MetadataEESToolsVersion`)
- in front matter: QR code pointing to the URL of the score PDF (pgf macros, available via `\MetadataQRCode`)
- new commands:
  - `\conSord`, `\conSordE`, `\senzaSord`, and `\senzaSordE` for “con/senza sordino” markup
  - `\markTimeSig` for adding a time signature mark
  - `\tacet` for indicating movements where an instrument pauses
  - `\whOn` and `\whOff` for producing white (void) notation
- snippets:
  - add a tie to the last note (`\extendLV`)
  - add a time signature mark (`\markTimeSig`)
  - adjust overall horizontal spacing (`\tightNotes`)
  - define a multirow short instrument name
  - incipits for solo voice and strings
  - mark deleted parts of a score by gaps across the staves (`\startDeleted` and `\stopDeleted`)
  - show only the numerator of the time signature
- the `zip` command to the `ees-tools` DOcker image
- an argument to customize the QR code base URL (`-q`, `--qr-base-url`) to `parse_metadata.py`


### Changed

- Markdown documents (e.g., editorial guidelines) are now stored in a folder `documents`.
- The table of spacing recommendations now also contains default values.
- `\partCombine` in the template now combines up to a tenth by default.
- `ees-tools` now uses LilyPond v2.24.0, TinyTeX v2022.12, and Python v3.11.
- `parse_metadata.py` now uses strictyaml instead of PyYAML.


### Fixed

- `add_variables` now adds a bass figure variable for instruments `bc`, `bc_realized`, and `fond`.
- `add_variables` now includes `\twofourtime` and `\twotwotime` for time signatures 2/4 and 2/2, respectively.
- Horizontal spacing between choir staff and its instrument name has been improved.
- Custom right-aligned marks are now invisible at the beginning of a line.


### Removed

- the `option-init-toc` Scheme variable, since there was no use case for setting it to false
- the customized bass figure function `new-format-bass-figure`, since LilyPond 2.24.0 greatly improved typesetting of bass figures


## v2022.01.0 – 2021-12-30

### Added

- initial release
