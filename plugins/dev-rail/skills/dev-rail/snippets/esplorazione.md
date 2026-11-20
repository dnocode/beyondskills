## Sessioni di esplorazione

- Si aprono in un worktree chiamato `explore-AAAAMMGG-HHMM` (nome automatico, non tocca la sessione principale; non ha una memoria separata: l'unica fonte per chi legge dopo è il documento).
- Sola lettura sul codice. Si scrive solo in `docs/explorations/<tema>.md` (nome proposto a fine sessione), con indice `docs/explorations/README.md` (data, titolo, stato).
- Le voci per la roadmap non vanno nella roadmap: stanno in fondo al documento (sezione «Voci per la roadmap») e le inserisce la sessione principale quando porta dentro il documento.
- Prima di «chiudiamo»: rileggi la chat (ogni decisione e l'ordine dei passi sono nel documento?) e il documento per intero (togli ciò che le decisioni hanno reso falso). In Decisioni solo ciò che l'utente ha detto; le tue conclusioni sono «proposta, non confermata». «Passi proposti» è obbligatoria.
- Garanzia vera: hook `.claude/hooks/explore-guard.sh` (installato da dev-rail), committato insieme a `.claude/settings.json`.
