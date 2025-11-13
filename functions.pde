// Plik przechowujący różne funkcje


// Funkcje do przycisów
//- zmieniamy tło, tryb i muzykę
void plantButton() {
   bgColor = bgColor(120, 1);
   mode = 1;
   switchModeMusic();
}

void wineButton() {
   bgColor = bgColor(30, 2);
   mode = 2;
   switchModeMusic();
  
}

void lsdButton() {
   bgColor = bgColor(120, 1);
   mode = 3;
   switchModeMusic();
  }
  

void soberButton() {
  bgColor = bgColor(60, 0);
  mode = 0;
  switchModeMusic();
}


// Pokazanie elementów gry 
// Jeżeli mamy tryb drugi, dochodzi filtr, który rozmazuje ekran
void showGameplay(color bgColor){

  fill(bgColor);
  rect((width - gameAreaWidth) / 2, (height - gameAreaHeight) / 2, gameAreaWidth, gameAreaHeight);
  stroke(0);
  strokeWeight(2);
  line((width - gameAreaWidth) / 2, height - GROUNDHEIGHT - 30, (width - gameAreaWidth) / 2 + gameAreaWidth, height - GROUNDHEIGHT - 30); 
  
  updateObstacles();
  if (mode == 2){
    filter(BLUR, 5);
  }
}

// Resetowanie gry: tworzymy nowego gracza i resetujemy wartości do startowych
void restart() {
  player = new Player();
  obstacles = new ArrayList<Obstacle>();
  grounds = new ArrayList<Ground>();
  obstacleTimer = 0;
  groundCounter = 0;
  speed = 50;
  mode = 0;
  gameOver = false;  // Reset the game over state
}

// Funkcja zmieniająca kolor tła w zależności od wybranego trybu
color bgColor(int fR, int mode){
  frameRate(fR);
  if (mode == 0 || mode == 2){  
     return color(140);
  } else if (mode == 1){
    float red = random(50, 150);  
    float green = random(150, 255);
    float blue = random(50);
    return color(red,green,blue);
  }else{
    float red = random(10,240);
    float green = random(10,240);
    float blue = random(10,240);
    return color(red,green,blue);
  }
}

// Funkcja odpowiedzialna za otwarzanie właściwej muzyki
void switchModeMusic() {
  // Zatrzymaj odtwarzacz, jeśli już istnieje
  if (audio != null) {
    audio.close();
  }
  
  if (mode != 0){
    if (mode == 1){
    mode_type = "blant";
    } else if (mode == 2){
      mode_type = "alco";
    } else if (mode == 3){
      mode_type = "lsd";
    }
  
  String musicFileName = mode_type + "_music.mp3";
  audio = minim.loadFile("music/" + musicFileName, 2048);
  audio.loop();
  }
}
