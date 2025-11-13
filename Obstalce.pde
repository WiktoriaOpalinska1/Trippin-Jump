/* W tym pliku tworzymy 2 klasy:
- Obstacle - odpowidzialna za logikę przeszkód
- Ground - odpowiedzialna za wyrysowywanie kresek na podłożu (raczej aspekt wizualny niż praktyczny)

Klasa Obstacle posiada 3 metody:
- show() - w zależności od wylosowanego typu przeszkody pokazuje 1 lub 2 kaktusy obok siebie.
- move() - przesuwa nasze przeszkody po ekranie
- collided() - zwraca true/false w zależności, czy współrzędne gracza i przeszkody się pokryły

Klasa Ground posiada 2 metody:
- show() - na losowej wysokości  wyrysowuje linię na ekranie
- move() - przesuwa wyrysowane linie po ekranie

W pliku znajdują się jeszcze 4 funkcje, które wykonują się zarówno na przeszkodach, jak i ziemi:
- updateObstacles(),
- showObstacles(),
- moveObstacles(),
- addObstacles().
*/

class Obstacle{
  float posX;
  int w, h;
  int type;
  
  Obstacle(int t){
    posX = (width - gameAreaWidth) / 2 + gameAreaWidth;
    type = t;
    if (type == 0){
      w = 50; h = 70;
    } else if (type == 1){
      w = 80; h = 70;
    } 
  }
  
  // Metoda odpowiedzialna za rysowanie wylosowanej przeszkody: 
  // albo pojedynczego kaktusa, albo kilku kaktusów
  void show(){
    if (type == 0){
      image(cactusS, posX - cactusS.width/2, height - GROUNDHEIGHT - cactusS.height);
    } else if (type == 1){
      image(cactus_many, posX - cactus_many.width/2, height - GROUNDHEIGHT - cactus_many.height);
    }
  }
  
  // Metoda opowiedzialna za ruch przeszkód
  void move(float speed){
    posX -= speed*1.2;
  }
  
  
  // Metoda sprawdzająca czy gracz nie zderzył się z przeszkodą ]
  //- porównywanie współrzędnych
  boolean collided(float playerX, float playerY, float playerWidth, float playerHeight){
    float playerLeft = playerX - playerWidth/2;
    float playerRight = playerX + playerWidth/2 + 10;
    float thisLeft = posX - w/2;
    float thisRight = posX + w/2;
    
    if (playerLeft < thisRight && playerRight > thisLeft){
      float playerDown = playerY - playerHeight/2 + 10;
      float thisUp = h;
      if (playerDown < thisUp){
        return true;
      }
    }
    return false;
  }
}

/////////////////////////////////////
class Ground{
  float posX = (width - gameAreaWidth) / 2 + gameAreaWidth;
  float posY = height - floor(random(GROUNDHEIGHT - 20, GROUNDHEIGHT + 30));
  int w = floor(random(1,10));
  
  Ground(){}
  
 // Metoda wyrysowująca linie losowej długości
  void show(){
    stroke(0);
    strokeWeight(3);
    line(posX, posY, posX + w, posY);
  }
  
  // Metoda przesuwająca linie po ekranie
  void move(float speed){
    posX -= speed*1.2;
  }
}

/////////////////////////////////

/* Funkcja, która odpowida za wyrysowane przeszkody i grunt.
Jeżeli jesteśmy w grze, przeszkody powinny przesuwać się coraz szybciej.
Przeszkody powinny pojawiać się w odstępach z pewną losowością.
Pozycja gracza też powinna się uaktualniać
*/
void updateObstacles(){
  showObstacles();
  player.show();
  if (!player.dead){
    obstacleTimer ++;
    speed += 0.05;
    
    if (obstacleTimer > minTimerBeforeObs + randomAddition){
      addObstacle();
    }
    
    groundCounter++;
    if (groundCounter > 10){
      groundCounter = 0;
      grounds.add(new Ground());
    }
    
    moveObstacles();
    player.update();
  }
}


// Funkcja odpowidzialna za tworzenie i pokazywaie nowych obiektów przeszkód i gruntu 
void showObstacles(){
  for (int i = 0; i < grounds.size(); i++){
    grounds.get(i).show();
  }
  for (int i = 0; i < obstacles.size(); i++){
    obstacles.get(i).show();
  }
}


// Funkcja tworząca nowe przeszkody.
// Losowość wyboru przeszkody (albo pojedynczy kaktus albo kilka kaktusów
void addObstacle(){
  obstacles.add(new Obstacle(floor(random(2))));
  randomAddition = floor(random(50));
  obstacleTimer = 0;
}

// Funkcja odpowidzialna za przesuwanie i usuwanie przeszkód i gruntu.
// Jeśli obiekt zbliży się do końca okna, powinien zostać usunięty z listy
void moveObstacles(){
  for (int i = 0; i < grounds.size(); i++){
    grounds.get(i).move(speed);
    if(grounds.get(i).posX < (width-gameAreaWidth)/2 +20){
       grounds.remove(i);
       i--;
    }
   }
  for (int i = 0; i < obstacles.size(); i++){
    obstacles.get(i).move(speed);
    if(obstacles.get(i).posX < (width-gameAreaWidth)/2 +20){
      obstacles.remove(i);
      i--;
     }
  }

}
