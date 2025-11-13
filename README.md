# Trippin-Jump
Projekt grupowy realizowany w ramach zajęć "Projektowanie systemów interaktywnych w środowiskach Processing i Arduino". Grupa podjęła się realizacji tematu środków psychoaktywnych, tworząc własną adaptację gry Dinozaura Google.

**Tryby gry:** 
- _tryb marihuana_: muzyka na rozluźnienie, tło zmieniające się w odcieniach zieleni,
- _tryb alkohol_: muzyka mająca zmienne tempo, rozmazany ekran,
- _tryb LSD_: szybka muzyka, tło przybierające dowolne kolory,
- _tryb trzeźwy_: brak muzyki, jednolite tło.

**Podział obowiązków:**
- _Wiktoria Opalińska_: Kod gry, logika trybów i składanie projektu.
- _Kamil Opar_: Kod arduino i komunikacja z Processingiem
-_ Maksymilian Tambo_r: GUI

**Techniczne aspekty kodu:**
- Do utworzenia gry wykorzystaliśmy biblioteki i moduły, takie jak ControlP5 (GUI), Minim (dźwięk), PImage, Serial. Nie mogliśmy pozwolić sobie wykorzystanie większej liczby ze względów na spowolnienie, które prawdopodobnie wynika z konfliktu Windowsa 11 z Processingiem.  - Obiektowy charakter projektu:
  - 3 klasy własne: Player (gracz), Ground (podłoże) oraz Obstacle (przeszkody),
  - 1 klasa z biblioteki Minim: AudioPlayer.
- Pliki zewnętrzne:
  - Pliki graficzne (w GUI + jako  „ruchome” elementy)
  - Pliki dźwiękowe (muzyka do poszczególnych trybów)
- Komunikacja Procecesing - Arduino
  - Uruchomienie gry zapala zieloną diodę.
  - Gdy gracz przegra, na ekranie podłączonym do Arduino wyświetla się „Game over”.
  - Przycick podpięty pod Arduino umożliwia skakanie.


