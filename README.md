# Struttura progetto

```
Lib
  - Application Layer
  - Domain Layer
  - Data Model
Assets
  - Fonts
  - Icons
  - Images
  ...
```

## Application Layer

Qui dentro ci vanno gli elementi della **UI** e lo **stato** (Bloc o Provider)

Ogni pagina ha una sua cartella con il nome in `PascalCase` mentre la nomenclaturea dei file è in `PascalCase` e la nomenclatura delle funzioni e delle variabili è in `camelCase`.

### Esempio:
- **Cartella**: CustomerSupport
- **File**: CustomerSupportScreen
- **Variabile**: nomeVariabile

All'interno di ogni cartella riferita ad una pagina c'è un'altra cartella nominata **Widget** che contiene i widget della pagina.

Nella cartella Application Layer inoltre va creata la cartella ``Core`` che contiene il codice che gestisce gli stati.

## Domain Layer

Qui dentro vanno inseriti tutti i file di logica ed i metodi per gestire l'interazione con il database all'interno di cartelle relative alla pagina a cui fanno riferimento.

**Esempio:**
```
Application Layer
  - Auth

Domain Layer
  - Auth
```

La nomenclatura dei file prevede come da convenzione il ``PascalCase`` con la dicitura ``Service`` alla fine.

**Esempio:**
```
SchermataDellaUIaCuiSiFaRiferimentoService.dart
```

## Data Model

Qui vanno i modelli di dati del database mappati in oggetti

Per ogni modello servono i metodi:
- Json -> Mappa
- Mappa -> Json

## Assets

Nella cartella assets va inserita una cartella per tipologia di asset.
Generalmente:
- Font
- Icons
- Images
