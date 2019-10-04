String [] kuloer =new String[4];
String []vaerdi = new String[13];

PFont Font;

boolean nyt_traek=false;

import controlP5.*;
ControlP5 cp5;

void setup() {
  Font = createFont("TimesNewRomanPSMT", 32);
  textFont(Font);

  kuloer[0]="Hjerter";
  kuloer[1]="Ruder";
  kuloer[2]="Spar";
  kuloer[3]="Kloer";

  vaerdi[0]="Es";
  vaerdi[10]="Knaegt";
  vaerdi[11]="Dronning";
  vaerdi[12]="Konge";

  size(600, 600);
  background(0);
  rectMode(CENTER);
  fill(255);
  rect(width/2, height/2, 300, 400, 6);

  cp5 = new ControlP5(this); 

  cp5.addButton("Traek_et_kort")
    .setPosition(10, 10)
    .setSize(100, 50)
    ;
}

void draw() {
  for (int i = 0; i < 9; i++) {
    vaerdi[i+1] = str(i+2);
  }

  if (nyt_traek) {
    int traek_kuloer =int(random(0, 4));
    int traek_vaerdi = int(random(0, 13));
    background(0);
    rectMode(CENTER);
    fill(255);
    rect(width/2, height/2, 300, 400, 6);

    textAlign(CENTER);
    fill(0);
    if (traek_kuloer < 2) {
      fill(255, 0, 0);
    }
    text(kuloer[traek_kuloer]+" "+vaerdi[traek_vaerdi], width/2, height/2);
    nyt_traek=false;
  }
}

void Traek_et_kort() {
  nyt_traek=true;
}
