// W tym pliku przechowujemy klasę player

class Player{
  float posY = 0;
  float velY = 0;
  float gravity = 1.2;
  int size = 20;
  boolean dead = false;
  
  int runCount = -5;
  
  Player(){}
  
  // Metoda odpowiedzialna za skakanie 
  // zmiana wartości gravity i velY wpływa na wysokość i długość skoku
  void jump(){
    if (posY == 0){
      gravity = 2.0;
      velY= 20;
    }
   }
  
  // Metoda odpowidzialna za rysowanie gracza
  void show(){
    image(our_player, playerXpos - our_player.width/2, height - GROUNDHEIGHT - (posY + our_player.height)); 
  }
  
  // Metoda odpowiedzialna za poruszanie się gracza
  void move(){
    posY += velY;
    if (posY > 0){
      velY -= gravity;
    }
    else{
      velY = 0;
      posY = 0;
    }
    
  // Jeśli trafimy na którąś z przeszkód, zmienna dead powinna zmienić wartość na true    
    for (int i = 0; i < obstacles.size(); i++){
      if (!dead){
        if (obstacles.get(i).collided(playerXpos, posY + our_player.height/2, our_player.width , our_player.height)){
          dead = true;
        }
      }
    }
    
  }
  
  // Update'owanie pozycji gracza
  void update(){
    move();
  }
}
