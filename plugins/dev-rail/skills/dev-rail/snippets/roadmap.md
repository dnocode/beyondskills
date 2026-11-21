## Roadmap e log

- `docs/roadmap.md` guarda avanti: solo lavoro non finito. Sezioni in ordine: **In progress** (max 3 voci), **TODO**, **Idee** (non ancora valutate). Limite 150 righe: oltre, si propone di archiviare.
- `docs/log/AAAA-MM.md` guarda indietro: una riga per voce chiusa, solo append, un file per mese.
- Una voce vive in un solo file: quando si chiude passa dalla roadmap al log, non si copia.
- Voce: `- [stato] **Titolo** (chi, AAAA-MM-GG): cosa e perché. Rimando: percorso.md. MARCATORE`. Stati: `[ ]` `[~]` `[-]`. Marcatori: **DECIDE <chi>**, **DA APPROFONDIRE**, **BLOCCATO DA: <x>**.
- Date assolute. Le decisioni si scrivono nella voce, non solo in chat.
- La chiusura di un ramo (`finishing-a-development-branch` di superpowers, dopo un piano eseguito) **comprende** l'aggiornamento del log: prima di proporre unione o PR, le voci chiuse vanno dalla roadmap al log, ciò che è emerso va in Idee, e l'utente vede le righe scritte. Senza questo passo la chiusura non è finita. Lo fa la sessione che ha fatto il lavoro.
- Per qualunque richiesta su roadmap, log, bug da annotare, «a che punto siamo» o esplorazioni, usa la skill `dev-rail`, senza che l'utente debba ripeterlo.
- Nella roadmap non si aggiunge nessuna voce che l'utente non abbia chiesto: si propone la riga e si aspetta il via.
