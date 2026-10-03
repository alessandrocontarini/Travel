# 🌍 Travel App

**Travel** è un'applicazione iOS sviluppata nativamente in **SwiftUI** che permette di esplorare, inserire e gestire itinerari e esperienze di viaggio (come trekking, tour in moto e percorsi in bici), sincronizzandosi in tempo reale con un database backend gestito tramite **Supabase**.

---

## 🚀 Funzionalità Principali

* **Esplorazione Interattiva**: Visualizza una lista completa delle esperienze di viaggio con dettagli su tappe, chilometri, durata, prezzi e tipologie.
* **Gestione CRUD Completa**: Inserimento di nuove esperienze e modifica di quelle esistenti tramite un modulo dinamico (`AddExperienceView`).
* **Tipologie Personalizzate**: Supporto per differenti categorie di viaggio gestite tramite un `Enum` dedicato.
* **Storage Immagini**: Caricamento e recupero sicuro delle immagini tramite il bucket di **Supabase Storage**.
* **Mappe e Link**: Integrazione con link esterni e geolocalizzazione dei punti di partenza.

---

## 🛠️ Stack Tecnologico

* **Frontend**: Swift, SwiftUI
* **Backend & Database**: Supabase (PostgreSQL, REST API, Storage)
* **Controllo Versione**: Git & GitHub

---

## 📂 Struttura del Progetto

```text
Travel/
├── Model.swift              # Modelli dati (Experience, TipologiaEnum)
├── SupabaseManager.swift    # Configurazione e client globale di Supabase
├── ContentView.swift        # Schermata principale e lista dei viaggi
├── ExperienceDetailView.swift # Schermata di dettaglio dell'esperienza
└── AddExperienceView.swift  # Modulo condiviso per Inserimento (INSERT) e Modifica (UPDATE)
```

## ⚙️ Configurazione e Avvio

* Clona il repository:
git clone [https://github.com/alessandrocontarini/Travel.git](https://github.com/alessandrocontarini/Travel.git)

* Apri il progetto in Xcode:
Assicurati di avere installato Xcode sul tuo Mac e apri il file Travel.xcodeproj.

* Configura la firma (Signing):
** Seleziona il progetto nella barra laterale di Xcode.
** Vai su Signing & Capabilities.
** Spunta Automatically manage signing e seleziona il tuo Team (puoi usare un Apple ID gratuito).
** Esegui l'app:
Collega il tuo iPhone o seleziona un simulatore iOS e premi il tasto Play ▶️ (Cmd + R) in alto a sinistra.
