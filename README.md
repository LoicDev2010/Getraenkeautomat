# 🥤 Getränkeautomat

Ein in Bash geschriebenes Skript, das den Ablauf eines Getränkeautomaten simuliert – von der Zahlung über die Getränkeauswahl bis zur Ausgabe.

## Ablauf

1. **Zahlungsmittel wählen**: Bargeld, Twint oder PayPal (bei Twint/PayPal wird ein QR-Code angezeigt und ein Guthaben-Check durchgeführt).
2. **Getränk wählen**: Kaffee, Tee, CocaCola, Sprite, Fanta oder Wasser, jeweils mit Untersorten und Preisen in Rappen.
3. **Bei Kaffee zusätzlich**: Auswahl mit/ohne Zucker und mit/ohne Milch.
4. **Ausgabe**: Simulierte Zubereitungszeit, Anzeige von Rückgeld und Getränk.

Ein Abbruch ist an jeder Stelle über `0` möglich und gibt das eingeworfene Restgeld zurück.

## Getränke & Preise (Auszug)

| Kategorie | Sorten | Preis |
|---|---|---|
| Kaffee | Latte Machiatto, Cappuccino, Espresso, Normaler Kaffee | 150–250 Rp. |
| Tee | Schwarz, Minze, Früchte | 150 Rp. |
| CocaCola | Normal, Zero, Light | 200 Rp. |
| Sprite | Normal, Zero | 200 Rp. |
| Fanta | Normal, Holunder, Exotic | 200–220 Rp. |
| Wasser | Still, Mineral | 100 Rp. |

## Voraussetzungen

- Eine Unix-ähnliche Umgebung (Linux, macOS oder WSL unter Windows) mit Bash

## Installation & Start

```bash
git clone https://github.com/LoicDev2010/Getraenkeautomat.git
cd Getraenkeautomat
chmod +x Getraenkeautomat.sh
./Getraenkeautomat.sh
```

## Autor

**Loïc Deverin** – [Portfolio](https://loicdeverin.vercel.app)

## Lizenz

Noch keine Lizenz definiert.
