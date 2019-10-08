String [] kuloer =new String[4];
String []vaerdi = new String[13];
StringList Kort = new StringList();
StringList KortVaerdi = new StringList();
// jeg mangler dealer / jeg bliver funktion
int Counter=0;
int antalKort=52;
int TraekVaerdi;
int BrugerVaerdi=0;
int DealerVaerdi=0;
int AntalDealerTraek=0;

PFont Font1;
PFont Font2;
PFont Font3;

boolean DealerensTraek = true;
boolean nyt_traek=false;
boolean Afslut_spil=false;

import controlP5.*;
ControlP5 cp5;

void setup() {
  Font1 = createFont("TimesNewRomanPSMT", 32);
  Font2 = createFont("TimesNewRomanPSMT", 20);
  Font3 = createFont("TimesNewRomanPSMT", 28);

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

  cp5.addButton("Traek_endnu_et_kort")
    .setPosition(10, 10)
    .setSize(100, 50)
    ;
  cp5.addButton("Jeg_bliver")
    .setPosition(10, 70)
    .setSize(100, 50)
    ;
}

void draw() {
  if (BrugerVaerdi > 21) {
    fill(255, 0, 0);
    textFont(Font3);
    text("Du kom over 21 desværre", width/2, height/2-50);
    noLoop();
  }
  for (int i = 0; i < 9; i++) {
    vaerdi[i+1] = str(i+2);
  }

  while ( Counter < 52) {
    for (int i = 0; i < 4; i++) {
      for (int j = 0; j < 13; j++) {
        Kort.append(kuloer[i]+" "+vaerdi[j]);
        if (vaerdi[j]=="Knaegt"||vaerdi[j]=="Dronning"||vaerdi[j]=="Konge") {
          KortVaerdi.append("10");
        } else if (vaerdi[j]=="Es") {
          KortVaerdi.append("11");
        } else 
        KortVaerdi.append(vaerdi[j]);
        Counter++;
      }
    }
  }

  if (nyt_traek) {
    background(0);
    rectMode(CENTER);
    fill(255);
    rect(width/2, height/2, 300, 400, 6);

    if (DealerensTraek) {
      int traek=int(random(0, antalKort));
      antalKort--;
      AntalDealerTraek++;

      int TrukketVaerdi = Integer.parseInt(KortVaerdi.get(traek));
      DealerVaerdi = DealerVaerdi + TrukketVaerdi;
      DealerensTraek = false;
      
    } else if (!DealerensTraek) {
      int traek=int(random(0, antalKort));
      antalKort--;

      textAlign(CENTER);
      fill(0);
      textFont(Font1);
      text(Kort.get(traek), width/2, height/2);

      int TrukketVaerdi = Integer.parseInt(KortVaerdi.get(traek));
      if (TrukketVaerdi == 11 ) {
        if (BrugerVaerdi + TrukketVaerdi > 21) {
          BrugerVaerdi++;
        }
      } else if (TrukketVaerdi != 11 || TrukketVaerdi != 1) {
        BrugerVaerdi = BrugerVaerdi + TrukketVaerdi;
      }

      textFont(Font2);
      text("Du har lige nu: "+BrugerVaerdi, width/2, height/2-100);
      Kort.remove(traek);
      KortVaerdi.remove(traek);
      
      textFont(Font2);
      text("Dealeren har Trukket "+AntalDealerTraek+" kort", width/2, height/2+100);
      Kort.remove(traek);
      KortVaerdi.remove(traek);

      

      nyt_traek=false;
    }
  }
  if (Afslut_spil) {
    BrugerVaerdi = 21 - BrugerVaerdi;
    DealerVaerdi = 21 - DealerVaerdi;
    if (DealerVaerdi <= BrugerVaerdi) {
      fill(255, 0, 0);
      textFont(Font3);
      text("Dealeren vandt desværre", width/2, height/2-50);
      noLoop();
    } else if (BrugerVaerdi < DealerVaerdi) {
      fill(255, 0, 0);
      textFont(Font3);
      text("Du vandt, Tillykke!", width/2, height/2-50);
      noLoop();
    }
  }
}

void Traek_endnu_et_kort() {
  if (antalKort > 0) {
    DealerensTraek=true; 
    nyt_traek=true;
    
  }
}
void Jeg_bliver() {
  Afslut_spil = true;
}
