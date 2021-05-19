PImage pasto;
PFont texto, comenzar, complete;
int pasto1, pasto2, salto, backsalto, gameOver, puntos, caja1, caja2, start, velocidad, win;
void setup() {
  size(400, 300);
  pasto= loadImage ("pasto.png");
  texto= loadFont("CourierNewPS-BoldMT-60.vlw");
  comenzar=loadFont("Dialog.plain-20.vlw");
  complete=loadFont("Georgia-Bold-22.vlw");
  pasto1=380;
  pasto2=-500;
  caja1=400;
  caja2=850;
  salto=200;
  puntos=0;
  velocidad=1;
  gameOver=0;
  win=0;
  start=0;
  fill(255, 0, 0);
}
void draw() {
  background(155);
  //*********cajas***********
  textFont(comenzar, 20);
  text("Presione click para comenzar\n\n\n\nclick para saltar", 75, height/2);

  if (start==1&&win!=1&&gameOver!=1) {
    background(155);
    caja2=caja2-velocidad;
    caja1=caja1-velocidad;
    //*********cajas**********
    rect(caja1, 250, 50, 50);
    rect(caja2, 250, 50, 50);
    if (caja1<=-50) {
      caja1=901;
    }
    if (caja2<=-50) {
      caja2=901;
    }
    //*********la cajita saltarina********
    rect(50, salto, 40, 80);
    //********accion de salta******
    if (salto>200) {
      salto=200;
    }
    if (salto<200&salto>100&backsalto==0) {
      salto=salto-velocidad;
      if (salto<=100) {
        backsalto=1;
      }
    }
    if (backsalto==1) {
      salto=salto+velocidad;
      if (salto>=200) {
        backsalto=0;
      }
    }
    //********choque***********
    if (salto>170&&caja1<90&&caja1>1&&start==1) {
      gameOver=1;
    }
    if (salto>170&&caja2<90&&caja2>1&start==1) {
      gameOver=1;
    }
    //*********puntos***********
    if (caja1==901||caja2==901) {
      puntos++;
    }
    text("point: " + puntos, 200, 100);
    //*********velocidad*********
    if (puntos==2) {
      velocidad=2;
    } else if (puntos==6) {
      velocidad=3;
    } else if (puntos==10) {
      velocidad=4;
    } else if (puntos==15) {
      velocidad=5;
    } else if (puntos==25) {
      win=win+1;
    } else if (puntos>25&&win>1) {
      velocidad=7;
      text("FRENESÍ", 20, 60);
    }
    //*********pastito**********
    if (pasto1==-500) {
      pasto2=400;
    }
    if (pasto2==-400) {
      pasto1=400;
    }
    pasto1--;
    pasto2--;
    image(pasto, pasto1, 125);
    image(pasto, pasto2, 125);
  }
  //*********perdiste*********
  if (gameOver==1) {
    background(0);
    textFont(texto, 60);
    text("Game\n Over", width/4, height/2);
    textFont(comenzar, 20);
    text("click to restart game", 60, 280);
  }
  //*********ganaste*********
  if (win==1) {
    background(165);
    textFont(complete, 30);
    text("Congratulation!\n\n\nGame Complete", 70, height/3);
    textFont(comenzar, 20);
    text("click to restart game", 110, 270);
  }
  println(caja1, gameOver, start, win);
}
void mouseClicked() {
  if (start==1) {
    salto--;
  }
  start=1;
  if (win==1) {
    win=2;
    puntos=0;
    velocidad=1;
    pasto1=380;
    pasto2=-500;
    caja1=400;
    caja2=850;
    salto=200;
  }
  if (gameOver==1) {
    win=0;
    gameOver=0;
    puntos=0;
    velocidad=1;
    pasto1=380;
    pasto2=-500;
    caja1=400;
    caja2=850;
    salto=200;
  }
  //si pos x y caja1 o caja2 y pos y  es menor a= entonces ==FALSO
}
