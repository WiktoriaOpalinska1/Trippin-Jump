// Plik, w którym tworzymy potrzebne nam dane
import controlP5.*;
import ddf.minim.*;

ControlP5 cp5;

Minim minim;
AudioPlayer audio;

// Obrazki do GUI
PImage microchipImage, title3Image, undertitleImage, plantImage, wineImage, lsdImage, resistorImage, selectmodeImage, batteryImage, soberImage;

// Ustawienia GUI
int gameAreaWidth = 710;
int gameAreaHeight = 400;

int colorLeft = color(0,180,110);  
int colorRight = color(0,80,90);

// 3 obrazki, które będą odpowiadać za gracza i kaktusy
PImage our_player;
PImage cactusS;
PImage cactus_many;

// Obiekt klasy Player (nasz gracz)
Player player;

// Tablice przechowujące przeszkody i kreski na ziemi
ArrayList<Obstacle> obstacles = new ArrayList<Obstacle>();
ArrayList<Ground> grounds = new ArrayList<Ground>();

// Stała przechowująca wysokość na jakiej znajduje się linia oraz zmienna przechowująca pozycję gracza
int GROUNDHEIGHT = 180;
int playerXpos = 360;

// Zmienne wykorzystywane głównie przy logice pojawiania i przesuwania się elementów po ekranie 
int obstacleTimer = 0;
int minTimerBeforeObs = 20;
int randomAddition = 0;
int groundCounter = 0;
float speed = 50;

color bgColor;
int mode;
int fR;

String mode_type;
