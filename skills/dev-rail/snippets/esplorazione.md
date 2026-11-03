## Sessioni di esplorazione

- Si aprono in un worktree chiamato `explore-AAAAMMGG-HHMM` (nome automatico, memoria propria, non tocca la sessione principale).
- Sola lettura sul codice. Si scrive solo in `docs/explorations/<tema>.md` (nome proposto a fine sessione), con indice `docs/explorations/README.md` (data, titolo, stato).
- Le voci per la roadmap non vanno nella roadmap: stanno in fondo al documento (sezione «Voci per la roadmap») e le inserisce la sessione principale quando porta dentro il documento.
- Garanzia vera: hook `.claude/hooks/explore-guard.sh` (installato da dev-rail), committato insieme a `.claude/settings.json`.
