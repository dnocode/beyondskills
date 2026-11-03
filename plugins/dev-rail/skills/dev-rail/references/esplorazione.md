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
- Tieni appunti aggiornati in chat: **Capito**, **Problemi** (con evidenza), **Idee**, **Decisioni**, **Domande aperte**.

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

1. **Come funziona oggi**: componenti, tabelle e stati, sequenza delle chiamate, il caso reale seguito, con riferimenti a file e riga.
2. **Cosa non va o si può migliorare**: ogni punto con evidenza e gravità.
3. **Passi proposti**: in ordine, con la dimensione di ciascuno, scritti in modo che una sessione di sviluppo possa trasformarli in progetto e piano.
4. **Domande aperte.**
5. **Voci per la roadmap.**

Aggiorna l'indice `docs/explorations/README.md` (una riga: data, titolo, stato). Committa solo documentazione, nel ramo del worktree, e non fare push se l'utente non lo chiede.

## Chiusura

Riepilogo breve in chat: percorsi scritti, voci proposte per la roadmap, cosa resta da decidere. Non ripetere il contenuto dei documenti.
