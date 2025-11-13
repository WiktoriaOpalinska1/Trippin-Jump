/* Grupa: Psychodelic Squad
Członkowie: Opalińska Wiktoria, Opar Kamil, Tambor Maksymilian
Lider: Opalińska Wiktoria
Wybrany temat: Środki psychoaktywne
*/

/* Projekt jest adapacją gry Google Dino. 
W zależności od wybranego trybu zmieniają się ustawienia gry.
4 tryby:
Tryb trzeźwy - bez dodatkowych rozpraszaczy, bez muzyki
Tryb marihuana - zmiana kolorów tła w odcieniach zieleni, spokojna muzyka
Tryb lsd - zmiana kolorów tła na dowolne, energiczna muzyka
Tryb alkohol - rozmazany ekran, efekty dźwiękowe */

// Główny plik, który przechowuje setup i draw. 
// W tym pliku jest też śledzenie przycisków - spacja skaczemy, r restarujemy.

import processing.serial.*;

Serial arduino;


boolean gameOver = false;

void setup() {
 
  size(1200, 680);
  
  GUI_setup();
  
  minim = new Minim(this);
  
  player = new Player();
  
  our_player = loadImage("img/donut.png");
  cactusS = loadImage("img/cactus.png");
  cactus_many = loadImage("img/multiple_cactus.png");
  
  our_player.resize(50, 0);
  cactusS.resize(50, 0);
  cactus_many.resize(80, 0);
  
  bgColor = bgColor(30, 0);
  fR = 60;
  mode = 0;
  
  String portName = Serial.list()[0];  
  arduino = new Serial(this, portName, 9600); 
}

void draw() {
  filter(POSTERIZE, 2);
  GUI_draw();
  cp5.draw();
  
  if (!gameOver) {
    showGameplay(bgColor);
    bgColor = bgColor(fR, mode);
    
    if (arduino.available() > 0) {
      char input = arduino.readChar();
      println("Received: " + input);

      if (input == ' ') {
        player.jump();
      } else if (input == 'G') {
        gameOver = true;
        displayGameOverOnLCD();
      }
    }
  } else {
    displayGameOverOnLCD(); 
  }
}

// Funkcja odpowiedzialna za przesyłanie informacji do Arduino o przegranej
void displayGameOverOnLCD() {
  arduino.write("G");
}


void keyPressed(){
  if (!player.dead && key == ' '){
     player.jump();
  }
  if (player.dead && key =='r'){
     restart();
  }
}
