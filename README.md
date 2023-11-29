# QuadronicaTest

Test app per colloquio Quadronica

### Caratteristiche Tecniche

- **Piattaforma**: iOS
- **Linguaggio di Programmazione**: Swift
- **UI Framework**: UIKit
- **Minima Versione Supportata**: iOS 14
- **Ambiente di Sviluppo**: Xcode 15

### Architettura

- **Modello Architetturale**: MVC (Model-View-Controller)
  - **Model**: Gestisce i dati e la logica dell'applicazione.
  - **View**: Interfaccia utente, presenta i dati e invia le interazioni dell'utente al controller.
  - **Controller**: Funziona come un intermediario tra il modello e la vista, gestendo il flusso di dati.
- **Singleton Pattern**: Utilizzato per gestire l'array dei calciatori in maniera centralizzata attraverso la classe `PlayersData`. Questo pattern assicura che esista una singola istanza condivisa in tutta l'app, facilitando l'accesso e la manipolazione dei dati dei calciatori in modo consistente e thread-safe.

### Dipendenze Esterne

- **RealmSwift**: Utilizzato per la gestione del database locale. Scelto per la sua facilità di utilizzo e prestazioni elevate.

### Network Layer

- **URLSession**: Utilizzato per gestire le richieste di rete.

### Gestione delle Immagini

- **Caching delle Immagini**: Implementato per ottimizzare le prestazioni e ridurre l'uso della rete.
