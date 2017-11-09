//Переменные:
float MestopolozheniEx = random(100, 250);
float skorostX = 6;
float MestopolozheniEy = random(40, 300);
float skorostY = 6.5;
float KoordinataMouse;
float KoordinataYplatformy = 486;
//Расстояния от различных частей платформы до шарика: 
float dist;
float dist2;
float dist3;
float dist4;
float dist5;
//Координаты появления цели (кружочка для сбора очков с надписью "GOAL"):
float KoordinataX = random(40, 460);
float KoordinataY = random(40, 460);
//Расстояние от шарика до цели
float rasst1;
float rasst2;
//Украшения:
int points = 0;
float changeColour;
float deltaColour = 0.2;
float peremeschenieTexta;
float uvelichenieTexta = 0.1;
//Звук и картинка:
PImage photo;
import ddf.minim.*;
Minim minim;
AudioPlayer player;

void setup() {
    size(500, 500);
    frameRate(40);
    minim = new Minim(this);
    player = minim.loadFile("innotic beats - blender.mp3");
    player.play();
    photo = loadImage("Goals.jpg");
}

void draw() {
    background(22 + changeColour, 24 + changeColour, 57 + changeColour);
    fill(255, 165, 0);
    stroke(255, 48, 48);
    strokeWeight(5);
    ellipse(MestopolozheniEx, MestopolozheniEy, 30, 30);
    //Изменение цвета фона:
    changeColour = changeColour + deltaColour;
    if ((changeColour >= 90) || (changeColour == 0)) {
        deltaColour = -deltaColour;
    }
    //Проработка отскока шарика от стенок:
    MestopolozheniEx = MestopolozheniEx + skorostX;
    MestopolozheniEy = MestopolozheniEy + skorostY;

    if ((MestopolozheniEx > width - 15) || (MestopolozheniEx < 15)) {
        skorostX = -skorostX;
    }
    if ((MestopolozheniEy > height - 15) || (MestopolozheniEy < 15)) {
        skorostY = -skorostY;
    }
    //Проработка платформы, ее функций: 
    fill(0, 255, 0);
    stroke(173, 255, 47);
    rect(KoordinataMouse, KoordinataYplatformy, 60, 10);
    dist = sqrt((KoordinataMouse - MestopolozheniEx) * (KoordinataMouse - MestopolozheniEx) + (KoordinataYplatformy - MestopolozheniEy) * (KoordinataYplatformy - MestopolozheniEy));
    dist2 = sqrt((KoordinataMouse + 60 - MestopolozheniEx) * (KoordinataMouse + 60 - MestopolozheniEx) + (KoordinataYplatformy - MestopolozheniEy) * (KoordinataYplatformy - MestopolozheniEy));
    dist3 = sqrt((KoordinataMouse + 30 - MestopolozheniEx) * (KoordinataMouse + 30 - MestopolozheniEx) + (KoordinataYplatformy - MestopolozheniEy) * (KoordinataYplatformy - MestopolozheniEy));
    dist4 = sqrt((KoordinataMouse + 15 - MestopolozheniEx) * (KoordinataMouse + 15 - MestopolozheniEx) + (KoordinataYplatformy - MestopolozheniEy) * (KoordinataYplatformy - MestopolozheniEy));
    dist5 = sqrt((KoordinataMouse + 45 - MestopolozheniEx) * (KoordinataMouse + 45 - MestopolozheniEx) + (KoordinataYplatformy - MestopolozheniEy) * (KoordinataYplatformy - MestopolozheniEy));
    if ((dist < 22) || (dist2 < 22) || (dist3 < 22) || (dist4 < 22) || (dist5 < 22)) {
        skorostY = -skorostY;
    }
    //Проработка цели (шарика с надписью "GOAL"):
    fill(255, 255, 0);
    stroke(255, 0, 0);
    strokeWeight(2);
    ellipse(KoordinataX, KoordinataY, 40, 40);
    rasst1 = sqrt((KoordinataX - MestopolozheniEx) * (KoordinataX - MestopolozheniEx) + (KoordinataY - MestopolozheniEy) * (KoordinataY - MestopolozheniEy));
    println(rasst1);
    image(photo, KoordinataX - 20, KoordinataY - 35);

    //Проработка интерфейса:
    if (rasst1 <= 30) {
        KoordinataX = random(40, 460);
        KoordinataY = random(40, 460);
        points = points + 20;
    }

    if (MestopolozheniEy >= 475) {
        textSize(32 + uvelichenieTexta);
        fill(255, 50, 0);
        text("Game Over", 160 + peremeschenieTexta, 250 + peremeschenieTexta);
        skorostX = 1;
        skorostY = 1;
        peremeschenieTexta = peremeschenieTexta - 0.25;
    }
    textSize(32);
    fill(255, 25, 0);
    text("Points: " + points, 10, 30);
    //Управление мышкой:
    KoordinataMouse = mouseX;
    if (KoordinataMouse > 440) {
        KoordinataMouse = 440;
    }
}