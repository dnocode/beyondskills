---
name: dev-rail
description: >
  Binario standard per lo sviluppo software sopra superpowers: roadmap condivisa
  (In progress / TODO / Idee), log mensile di ciò che è fatto, sessioni di esplorazione
  isolate. Usala in ogni progetto di sviluppo quando si apre o si chiude un ramo di
  lavoro, quando si aggiorna o si consulta la roadmap, o quando l'utente dice "dev-rail",
  "roadmap", "cosa abbiamo fatto", "cosa resta", "mostrami la roadmap", "mettilo in
  roadmap", "inserisci un bug", "a che punto siamo", "stato". Usala anche per le conversazioni di
  esplorazione in sola lettura: "esploriamo", "exploration talk", "vorrei capire come
  funziona", "fammi capire", "ispezioniamo". E per fermarsi e ripartire: "interrompiamo",
  "sono stanco", "continuiamo domani", "riprendi l'esplorazione".
---

# dev-rail

Superpowers resta la base (progetto, piano, esecuzione, revisione, chiusura ramo).
Questa skill copre ciò che superpowers non ha: **cosa resta da fare e cosa è fatto**.

## 1. Un posto per ogni informazione

| File | Guarda | Contiene |
|---|---|---|
| `docs/roadmap.md` | avanti | solo lavoro non finito |
| `docs/log/AAAA-MM.md` | indietro | solo lavoro finito, una riga per voce, solo append |

Una voce vive in **un solo file**. Quando si chiude **si sposta** dalla roadmap al log, non si copia.
Se i file non esistono, proponi di crearli. Le regole entrano nel `CLAUDE.md` del progetto con gli snippet (sezione 6). Una convenzione già presente in `CLAUDE.md` vince.

## 2. Roadmap

**Intestazione:** una riga di scopo e la legenda. Niente «ultimo aggiornamento» a mano: lo dice git.

**Sezioni, in quest'ordine:**
1. **In progress**: al massimo 3 voci.
2. **TODO**: deciso, non ancora iniziato.
3. **Idee**: annotate ma non ancora valutate. Prima di passare a TODO serve una decisione o un approfondimento.

**Voce:**
```
- [stato] **Titolo breve** (chi, AAAA-MM-GG): cosa e perché, in una o due frasi. Rimando: `percorso.md`. MARCATORE
```

**Stati:** `[ ]` da fare · `[~]` parziale (una frase sul gap) · `[-]` scartato (motivo in una riga, poi va al log).
**Marcatori** (in grassetto, uno per voce, in coda): **DECIDE <chi>** · **DA APPROFONDIRE** · **BLOCCATO DA: <voce o fatto>**.

**Regole**
- Una voce è una riga più il rimando; i dettagli stanno nel documento (esplorazione, spec, piano).
- Date assolute, mai «ieri».
- Le decisioni si scrivono nella voce («deciso da X, AAAA-MM-GG: …»), non solo in chat.
- **Limite 150 righe.** Oltre, proponi (mai in automatico) di archiviare, unire i duplicati, uniformare i marcatori.

## 3. Log

`docs/log/AAAA-MM.md`, una riga per voce chiusa:
```
- AAAA-MM-GG **Titolo**: esito in una frase. Ramo/commit. Provato: dal vivo | solo test | no. Decisioni: …
```
Si scrivono solo cose verificate. Un file nuovo a ogni mese: il log non cresce mai oltre un mese.

**Un bug corretto lascia sempre una traccia nel log**, anche se la correzione è di una riga:
```
- AAAA-MM-GG **Bug: sintomo breve**: causa (verificata | ipotesi). Correzione: cosa cambia. Ramo/commit. Provato: dal vivo | solo test | no. Rimando: docs/explorations/bug.md
```
Così, se il sintomo ritorna, si trova subito cosa si era capito e cosa no. Senza dati di terzi, come ovunque.

## 4. Quando si aggiorna

- **Chiusura di un ramo** (obbligatorio, prima dell'unione): le voci chiuse passano dalla roadmap al log; ciò che è emerso entra in **Idee** con una riga di contesto. Lo fa la sessione che ha fatto il lavoro, mai quella di esplorazione.
- **Chiusura di un bug**: la riga nel log si scrive quando la correzione è unita, non prima. Se la causa è solo un'ipotesi o la correzione non è provata dal vivo, nella roadmap resta una voce **DA APPROFONDIRE** con cosa controllare dopo il rilascio; si chiude (e si aggiorna la riga del log) quando l'esito è visto.
- **Smistamento di un'esplorazione**: la roadmap riceve righe di rimando dopo il via dell'utente.
- **Cambio di decisione**: la voce si aggiorna, con la data.
- **Nessuna voce non richiesta**: in qualunque sessione, la roadmap riceve solo le voci che l'utente ha chiesto. Se ne emerge un'altra, proponi la riga e aspetta il via.

### «Stato» («a che punto siamo», «mostrami la roadmap»)
Solo lettura. Mostra, in questo ordine, e chiedi prima di cambiare o rimuovere qualunque cosa:
1. la roadmap (In progress, TODO, Idee) in forma breve;
2. le esplorazioni da importare: `git worktree list` per i `explore-*` e `git log HEAD..<ramo>`;
3. i rami con lavoro non unito (`git branch --no-merged <base>`) e quelli già uniti da cancellare (`git branch --merged <base>`);
4. i commit locali non pubblicati (`git log @{u}..`);
5. le voci che dicono «non provato dal vivo».

## 5. Esplorazione isolata (parallela alla sessione principale)

**Un worktree si apre solo con «esploriamo» (o simili), mai con «chiudiamo», «salva», «finiamo» o «ok».** Queste parole chiudono. Se l'utente le dice:
- e questa sessione è in un worktree `explore-*`: chiudi quell'esplorazione (punti 3 e 4);
- e non è in un worktree ma ne esiste uno aperto da questa conversazione (`git worktree list`, ramo `worktree-explore-*`): chiudi quello, leggendo e scrivendo il documento con percorsi assoluti del suo worktree, senza crearne un altro;
- e non c'è nessuna esplorazione da chiudere: chiedi in una riga cosa va chiuso. Non aprire nulla.

**Interrompere** («interrompiamo», «sono stanco», «continuiamo domani», «pausa»): non è una chiusura, il documento resta una bozza. Tu:
1. Salvi tutto nel documento, anche ciò che era solo in chat. Aggiungi o aggiorna la sezione **Dove ci siamo fermati** (data; **confermato**; **da confermare**, cioè le tue proposte non ancora approvate, scritte come «proposta, non confermata»; **da fare dopo**; nome proposto per il documento).
2. Committi nel ramo del worktree, poi `ExitWorktree` con `keep`. Mai `remove`.
3. Dici all'utente il percorso del worktree, il ramo e come riprendere: «riprendi l'esplorazione <tema>».

**Riprendere** («riprendi l'esplorazione», «continua quella di ieri»): `git worktree list`, prendi i `explore-*`. Se è uno solo, entraci con `EnterWorktree` indicando il suo percorso; se sono più d'uno, mostra l'elenco (tema, data, ultimo commit) e chiedi quale. Leggi il documento, riassumi in tre righe **Dove ci siamo fermati** e riparti dal primo punto «da confermare». Non creare un worktree nuovo.

Se l'utente dice «esploriamo» ma esistono già esplorazioni interrotte, dillo in una riga («c'è già quella su X, riprendiamo quella o ne apro una nuova?») prima di aprirne un'altra.

Si apre una seconda sessione nel progetto e l'utente dice «esploriamo» (anche senza tema: nasce parlando). Tu, **senza chiedere nulla, nemmeno un nome**:
1. Crei un worktree con `EnterWorktree`, `name: explore-AAAAMMGG-HHMM` (data e ora di adesso). Il prefisso `explore-` è ciò che attiva l'hook; il resto non conta. Il worktree ha memoria e cartella proprie: la sessione principale non è toccata.
2. Esplori con le regole di `references/esplorazione.md` (leggile ora): sola lettura sul codice, appunti in chat. Salvi man mano nel documento (vedi il file): dopo ogni decisione e ogni blocco compiuto.
3. Quando l'utente dice «chiudiamo» o «salva», **proponi tu il nome** definitivo del documento dal tema emerso (`docs/explorations/<tema-breve>.md`, al posto della bozza) e rinomina dopo il suo via. Le voci per la roadmap **non** vanno nella roadmap: restano in fondo al documento, sezione «Voci per la roadmap», nel formato di sezione 2. Due sessioni sulla stessa roadmap andrebbero in conflitto.
4. Committi il documento nel ramo del worktree, poi `ExitWorktree` con `keep`. Dici all'utente che per portarlo nel progetto basta «importa le esplorazioni» nella sessione principale. L'esplorazione non importa mai da sola: modificherebbe il progetto principale mentre vi si lavora.

**Garanzia vera:** l'hook `hooks/explore-guard.sh` rifiuta ogni Write/Edit fuori da `docs/explorations/` quando la sessione è in un worktree `explore-*`. Va installato una volta nel `.claude/settings.json` **committato** del progetto (se è solo in `settings.local.json` il worktree non lo ha). Installazione: sezione 6, «metti l'hook».

### Importare le esplorazioni (nella sessione principale)
Quando l'utente dice «importa le esplorazioni», e **proponilo tu** all'inizio di ogni chiusura ramo se ce ne sono:
1. `git worktree list`: prendi i worktree in `.claude/worktrees/explore-*`; per ciascuno i commit non ancora nel ramo corrente (`git log HEAD..<ramo-del-worktree>`).
2. Mostra l'elenco: tema, documento, numero di commit. Se il documento ha una sezione «Dove ci siamo fermati» con punti «da confermare», segnalalo: è un'esplorazione interrotta, non finita. Aspetta il via.
3. `git cherry-pick` dei commit. Toccano solo `docs/explorations/`, quindi non confliggono col lavoro in corso. Se quei percorsi hanno modifiche non committate nel progetto principale, fermati e chiedi.
4. Leggi «Voci per la roadmap» del documento e proponi le righe (di norma in **Idee**). Con il via le inserisci nella roadmap e segni il documento come «smistata».
5. Chiedi se rimuovere il worktree e il suo ramo. Non farlo senza via.

Limiti: il worktree parte dal ramo base, non dal lavoro non committato della sessione principale (impostazione `worktree.baseRef`: `head` per partire dal ramo corrente, `fresh` per la base di default); l'hook non copre le scritture via shell.

## 6. Installazione nel progetto: snippet e hook

In `snippets/` ci sono blocchi pronti, autosufficienti (valgono anche per chi non ha la skill): `roadmap.md`, `esplorazione.md`.
**«metti dev-rail»** = snippet (qui sotto) + hook (in fondo). Per i soli snippet, quando l'utente dice «inserisci lo snippet X» o «metti dev-rail nel CLAUDE.md»:
1. Leggi `CLAUDE.md` del progetto corrente (se manca, proponi di crearlo). Non toccare altri progetti.
2. Inserisci il contenuto dello snippet tra `<!-- dev-rail:X -->` e `<!-- /dev-rail:X -->`, in fondo al file. Se il blocco esiste già, sostituiscilo; non duplicare mai.
3. Se `CLAUDE.md` ha già una sezione equivalente scritta a mano, non sovrascrivere: mostra la differenza e chiedi.
4. Riepilogo di una riga: quali snippet inseriti o aggiornati.

### Hook («metti l'hook»)
1. Copia `hooks/explore-guard.sh` del plugin in `.claude/hooks/explore-guard.sh` del **progetto corrente** e rendilo eseguibile.
2. Unisci al `.claude/settings.json` del progetto (crealo se manca; **mantieni tutto ciò che c'è**) questo elemento di `hooks.PreToolUse`, solo se non c'è già un comando con `explore-guard.sh`:
```json
{ "matcher": "Write|Edit|NotebookEdit",
  "hooks": [ { "type": "command", "command": "bash \"$CLAUDE_PROJECT_DIR/.claude/hooks/explore-guard.sh\"" } ] }
```
3. Mostra la differenza prima di scrivere e aspetta il via. Ricorda all'utente che i due file vanno **committati** (non in `settings.local.json`), altrimenti il worktree non li ha e i collaboratori neppure.
4. Verifica: `jq empty .claude/settings.json` deve passare.
