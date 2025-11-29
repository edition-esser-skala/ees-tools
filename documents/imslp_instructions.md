# How to submit scores to IMSLP

## Uploading new scores

Generally, follow the official instructions on

- [composition lists](https://imslp.org/wiki/Composer_Composition_Lists_Manual_of_Style)
- [genres](https://imslp.org/wiki/IMSLP:Tagging)
- [work pages](https://imslp.org/wiki/IMSLP:Score_submission_guide/Layout_of_Work_Pages).

For large-scale sacred works with typically many players per instrument (e.g., masses), divide the full score (incl. engraving files) and parts between two tabs “Score” and “Parts”. For chamber music-like works (e.g, motets), put all of these files on a single tab “Score and Parts”.

Submit vocal scores as “Other” and manually change the header to
```
===Vocal Scores===
```

Template for work metadata:
```
|Language=Latin
|Piece Style=Baroque
|Manuscript Sources={{RISMc|212006126|Mss full score (D-Dl, Mus.2973-D-26)}}
|Instrumentation=soprano, alto, tenor, bass, mixed chorus (SATB), orchestra
|InstrDetail=2 flutes, 2 oboes, 2 horns, 2 trumpets, timpani, strings, continuo
|Tags=masses ; sop alt ten bass ch orch ; la
```

Instrument names:
- strings in plural and with roman numerals (e.g, Violins I, Violins II, Violas, Cellos/Basses)
- solo instruments on top, labelled like “Violin (solo)”
- other instruments singular and with arabic numerals (e.g., Oboe 1, Trombone 2 ...)
- parts with several instruments in a grand staff: separate numbers with slashes (e.g., Horn 1/2 (B♭), Trumpet 1/2 (C)/Timpani)
- do not write key changes in the timpani

**Never upload more than ten works per day**, since otherwise the IMSLP admins will have a hard time in keeping up with reviewing! 


## Updating scores

When uploading the new file, add a note like
```
update to v2.0.0
```

Mark a superseded score for deletion by editing its page and inserting a note like
```
{{Delete|in v2.0.0, trumpets+timpani and horns have been split into two separate files}}
```

Do not change an existing tab division, since it likely has been reviewed by an admin.
