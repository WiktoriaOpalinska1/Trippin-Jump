/* Plik przechowujący logikę GUI
Załadowywanie zdjęć.
Tworzenie przycisków trybów
Funckja do wyrysowania GUI */

void GUI_setup(){
 
  cp5 = new ControlP5(this);
  
  title3Image = loadImage("img/title3.png");
  undertitleImage = loadImage("img/undertitle.png");
  
  selectmodeImage = loadImage("img/selectmode.png");
  
  soberImage = loadImage ("img/sober.png");
  soberImage.resize(90,90);
  
  batteryImage = loadImage("img/battery.png");
  batteryImage.resize(180,150);
  
  resistorImage = loadImage("img/resistor.png");
  resistorImage.resize(100,100);
  
  microchipImage = loadImage("img/microchip.png");
  microchipImage.resize(1200, 680);
 
  plantImage = loadImage("img/plant.png");
  plantImage.resize(40, 40);  
  
  wineImage = loadImage ("img/wine.png");
  wineImage.resize(40, 40);
  
  lsdImage = loadImage ("img/lsd.png");
  lsdImage.resize(40, 40);
  

  cp5.addBang("plantButton")
     .setPosition(55, 30)
     .setImage(plantImage)
     .setSize(plantImage.width, plantImage.height);
     
  cp5.addBang("wineButton")
     .setPosition(58, 76)
     .setImage(wineImage)
     .setSize(wineImage.width, wineImage.height);   
     
  cp5.addBang("lsdButton")
     .setPosition(58,134)
     .setImage(lsdImage)
     .setSize(lsdImage.width, wineImage.height);
     
     
  cp5.addBang("soberButton")
     .setPosition(70,570)
     .setImage(soberImage)
     .setSize(soberImage.width, soberImage.height);
     
}

void GUI_draw(){
  for (int i = 0; i < width; i++) {
    float inter = map(i, 0, width, 0, 1);
    int c = lerpColor(colorLeft, colorRight, inter);
    stroke(c);
    line(i, 0, i, height);
  } //gradient z tłem najpierw się rysuje
  
  image(microchipImage, 0, 0);
  image(title3Image, 400, 30);
  image(undertitleImage, 390,560);
  image(resistorImage, 25, 14);
  image(resistorImage, 25, 64);
  image(resistorImage, 25, 114);
  image(selectmodeImage, 25, -12);
  image(batteryImage, 23, 520);
}
