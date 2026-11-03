# Regole della conversazione di esplorazione

Una conversazione per **capire**, non per costruire. Il tema nasce dalle domande. Il risultato è conoscenza che resta (documenti) e, quando lo decide l'utente, passi di lavoro.

## Regole ferme

1. **Sola lettura.** Non modificare il codice, non creare rami di lavoro, non fare push né rilasci, non toccare file condivisi (roadmap, piani, `CLAUDE.md`). Codice e dati si leggono; i database di produzione solo con query di lettura, mai segreti, mai copiati.
2. **Dati di terzi fuori dai documenti.** Clienti e persone diventano «cliente A», «cliente B»; numeri di telefono, indirizzi ed email non si scrivono. Vale per ciò che si salva, non per ciò che si dice in chat. Se il `CLAUDE.md` del progetto ha una regola più severa, vince.
3. **Non confondere con il lavoro in corso.** Si lavora nel worktree dell'esplorazione: non si cambia ramo della cartella principale e non si toccano i file delle altre sessioni.

## Durante la conversazione

- Rispondi leggendo il codice e citando **file e riga**. Distingui sempre **verificato** (visto nel codice o nei dati), **ipotesi** (dedotto) e **non verificato**.
- Per spiegare un meccanismo segui **un caso reale da cima a fondo**: chi agisce, cosa cambia nelle tabelle e negli stati, quali chiamate avvengono e in che ordine. Scene concrete, un passo alla volta; se l'utente dice di non aver capito, rifai la scena con altri esempi, non ripetere la spiegazione.
- Le obiezioni si affrontano di petto: se l'utente ha ragione, dillo e correggi la spiegazione.
- Tieni appunti aggiornati: **Capito**, **Problemi** (con evidenza), **Idee**, **Decisioni**, **Domande aperte**.
- **Salva man mano, non solo alla fine.** Dopo ogni decisione dell'utente e dopo ogni blocco di lavoro compiuto, crea o aggiorna il documento in `docs/explorations/` (nome provvisorio, per esempio `bozza-AAAAMMGG-HHMM.md`; a fine sessione lo rinomini col tema, dopo il via dell'utente). Gli appunti solo in chat si perdono quando la conversazione viene compattata o chiusa. Le decisioni si scrivono nel documento subito, con la data.

## Esplorare un bug

Capire la causa di un bug è un uso normale dell'esplorazione: si legge codice, log e dati, anche di produzione, e si scrive la diagnosi. **La correzione no**: parte dopo, in una sessione di lavoro, su un ramo suo creato da `main` (mai sul ramo che l'utente ha aperto nella cartella principale).

- **Dati di produzione**: solo `SELECT`, mirate (poche colonne, `LIMIT`). Se il sistema dei permessi blocca la lettura, non aggirarlo: di' all'utente cosa vuoi leggere e perché, e aspetta il suo via. Nel documento e in chat: dei numeri e dei nomi solo le ultime quattro cifre o «cliente A».
- **Documento del bug** (al posto di «Come funziona oggi» e «Cosa non va»): **Sintomo** (cosa fa, cosa dovrebbe fare, dove si è visto), **Cronologia** (ora per ora, solo ciò che è verificato), **Causa** (verificata / ipotesi / non verificata), **Cosa non ho verificato**, **Correzione proposta** (con test che oggi fallirebbe), **Difetti collaterali** (sono voci a parte).
- Se la causa non è verificata, dillo anche nel titolo della voce per la roadmap, e proponi come verificarla dopo il rilascio (per esempio un log che oggi manca).
- Un difetto che non è la causa di questo bug va in una voce propria (di solito Idee), non dentro la correzione.

## Non perdere l'esplorazione

Il worktree e il ramo `explore-*` non si rimuovono, né da te né con `ExitWorktree` in modalità remove, finché la sessione principale non ha importato il documento e l'utente non dice di toglierli. Se il worktree manca ma i commit esistono (`git reflog`, `git fsck --lost-found`), prima di tutto dagli un ramo (`git branch explore/<tema> <commit>`) e avvisa l'utente.

## Smistamento (mai automatico)

Quando l'utente dice «chiudiamo» o «salva», o dopo un blocco di lavoro compiuto, proponi: «finora: N cose capite, N problemi, N idee: le smisto?». Per ogni elemento proponi una destinazione e **aspetta la conferma**:

| Destinazione | Quando |
|---|---|
| **Solo documento** | È capito come funziona e basta. Nessun cambiamento voluto. |
| **Voce per la roadmap** | Tre condizioni insieme: c'è qualcosa da cambiare, c'è la prova (file, riga, dati), l'utente lo vuole. |
| **Da approfondire** | C'è un problema ma la soluzione non è chiara: marcatore DA APPROFONDIRE. |
| **Scartato** | Curiosità risolta o ipotesi sbagliata. |

Le voci per la roadmap non si scrivono nella roadmap: vanno in fondo al documento, sezione «Voci per la roadmap», una riga con titolo e rimando (mai la descrizione). Le inserisce la sessione principale.

## Il documento

`docs/explorations/<tema-breve>.md` (o dove dice il `CLAUDE.md` del progetto), con intestazione (data, area, stato: aperta o smistata) e:

1. **Decisioni** (in cima): ciò che l'utente ha deciso, con data, e ciò che ha escluso (perimetro, cose fuori, vincoli). È la parte che non deve mai andare persa.
2. **Come funziona oggi**: componenti, tabelle e stati, sequenza delle chiamate, il caso reale seguito, con riferimenti a file e riga.
3. **Cosa non va o si può migliorare**: ogni punto con evidenza e gravità.
4. **Passi proposti**: in ordine, con la dimensione di ciascuno, scritti in modo che una sessione di sviluppo possa trasformarli in progetto e piano.
5. **Domande aperte.**
6. **Voci per la roadmap.**

La roadmap riceve solo righe di rimando a questo documento: nessun dettaglio si perde, perché il dettaglio sta qui.

Aggiorna l'indice `docs/explorations/README.md` (una riga: data, titolo, stato). Committa solo documentazione, nel ramo del worktree, e non fare push se l'utente non lo chiede.

## Chiusura

Riepilogo breve in chat: percorsi scritti, voci proposte per la roadmap, cosa resta da decidere. Non ripetere il contenuto dei documenti.
