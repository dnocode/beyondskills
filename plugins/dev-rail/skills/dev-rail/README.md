# dev-rail

Il binario del flusso di sviluppo: una convenzione corta sopra superpowers per sapere sempre **cosa resta e cosa è fatto**.

## Cosa risolve

Nata dalle difficoltà reali di un flusso di sviluppo basato su superpowers:

| Difficoltà | Verdetto | Cosa fa dev-rail |
|---|---|---|
| Roadmap condivisa e registro del fatto | limite di superpowers | `docs/roadmap.md` (In progress / TODO / Idee, max 150 righe) + log mensile in `docs/log/` |
| Esplorazione che intacca la sessione principale | limite parziale | worktree `explore-*` creato in automatico + hook che vieta le scritture fuori da `docs/explorations/` |

Una voce vive in un solo file: quando si chiude passa dalla roadmap al log. Così non nascono due elenchi da tenere allineati, come succede quando roadmap e registro dello stato crescono in parallelo.

## Quando attivarla

Quando apri o chiudi un ramo, quando aggiorni la roadmap, quando apri una sessione di esplorazione.

## Come usarla

1. Installa la cartella come skill (o copia `SKILL.md` all'inizio della conversazione).
2. Nel progetto di lavoro di' «inserisci lo snippet roadmap / esplorazione» (o «metti dev-rail nel CLAUDE.md» per tutti): la skill li scrive nel `CLAUDE.md` tra marcatori, senza duplicare se li chiedi due volte.
3. Per l'hook dell'esplorazione di' «metti l'hook» (o «metti dev-rail» per snippet e hook insieme): la skill copia `explore-guard.sh` in `.claude/hooks/` del progetto e aggiunge il blocco a `.claude/settings.json`, senza toccare le impostazioni esistenti. Ti mostra la differenza e aspetta il tuo via. Poi **committa** i due file, altrimenti il worktree e i collaboratori non li hanno.

   Cosa viene aggiunto a `.claude/settings.json` (se vuoi farlo a mano):
   ```json
   { "hooks": { "PreToolUse": [ { "matcher": "Write|Edit|NotebookEdit",
       "hooks": [ { "type": "command",
         "command": "bash \"$CLAUDE_PROJECT_DIR/.claude/hooks/explore-guard.sh\"" } ] } ] } }
   ```
4. Da quel momento basta aprire una sessione nel progetto e dire «esploriamo»: la skill crea il worktree `explore-AAAAMMGG-HHMM`, l'hook si attiva da solo, e a fine sessione propone il nome del documento e lo committa. Nella sessione principale dici «importa le esplorazioni» (te lo propone anche lei quando chiudi un ramo): porta dentro i documenti, propone le voci per la roadmap e, con il tuo via, le inserisce.

## Limiti noti

- L'hook blocca Write, Edit e NotebookEdit, **non** le scritture via shell (`>`, `sed -i`). Per quelle servono permessi sul Bash.
- La memoria separata del worktree è dedotta dalle cartelle in `~/.claude/projects/`, non provata con una scrittura.
- Non include la «mappa del codice» prima del piano: scelta esplicita, si aggiunge solo se serve.

## File

- `SKILL.md`: le istruzioni per l'AI.
- `snippets/`: blocchi da inserire nel `CLAUDE.md` (`roadmap.md`, `esplorazione.md`).
- `hooks/explore-guard.sh`: l'hook di isolamento.
- `hooks/test-explore-guard.sh`: verifica minima dell'hook (`bash hooks/test-explore-guard.sh`).
