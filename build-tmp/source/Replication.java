import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class Replication extends PApplet {


int fieldX, fieldY;
int _pointX, _pointY;
int infiledPoint = 20;
PImage masuImg, saveBtImg;
int lineWeight = 10;
int pMouseX, pMouseY;
int firstTouch = 0;
int _fieldX;
int _fieldY;
int _x1, _x2, _y1, _y2;
int _btImagW;
int _btImagH;
int _saveX;
int _saveY;

public void setup() {
	background(0,0,0);
	
	field(width, height);
	inField();
	saveBt();
}

public void draw() {
	fill(0,0,0);
	strokeWeight(lineWeight);
	// \u30de\u30a6\u30b9\u3067\u7dda\u3092\u63cf\u304f
	if (mousePressed) {
		if (firstTouch == 0) {
			pMouseX = mouseX;
			pMouseY = mouseY;
			firstTouch ++;
		} else {
			pMouseX = pmouseX;
			pMouseY = pmouseY;
		}
		line(mouseX, mouseY, pMouseX, pMouseY);
	} else if (!mousePressed) {
		firstTouch = 0;
	}
}

public void field(int w, int y) {
	//\u7e26\u9577\uff0c\u6a2a\u9577\u5224\u65ad
	if (w >= y) {
		//\u6a2a\u9577\u306a\u3089
		fieldX = y;
		fieldY = y;
		_pointX = (width / 2) - (fieldX / 2);
		_pointY = 0;
	} else {
		//\u7e26\u9577\u306a\u3089
		fieldX = w;
		fieldY = w;
		_pointY = (height / 2) - (fieldY / 2);
		_pointX = 0;
	}
	strokeWeight(0);
	fill(255, 255, 255);
	rect(_pointX, _pointY, fieldX, fieldY);
}

public void inField() {
	masuImg = loadImage("data/masu.png");
	_fieldX = fieldX - infiledPoint*2;
	_fieldY = fieldY - infiledPoint*2;
	_x1 = _pointX + infiledPoint;
	_x2 = _x1 + _fieldX;
	_y1 = _pointY + infiledPoint;
	_y2 = _y1 + _fieldY;
	image(masuImg, _x1, _y1, _fieldX, _fieldY);
}

public void keyPressed() {
	String time = "" + year() + "_" + month() + "_" + day() + "_" + hour() + "_" + minute() + "_" + second();
	String path = "data/screenshot/" + time + ".png";
	if (key == ENTER) {
		save(path);
		clear();
		background(0,0,0);
		field(width, height);
		inField();
		saveBt();
	}
}

public void saveBt() {
	saveBtImg = loadImage("data/save.png");
	_btImagW = saveBtImg.width / 2;
	_btImagH = saveBtImg.height / 2;
	_saveX = width - _btImagW;
	_saveY = height - _btImagH;
	image(saveBtImg, _saveX, _saveY, _btImagW, _btImagH);
}

public void mousePressed() {
	if (mouseX > _saveX && mouseX < width && mouseY > _saveY && mouseY < height) {
		String time = "" + year() + "_" + month() + "_" + day() + "_" + hour() + "_" + minute() + "_" + second();
		String path = "data/screenshot/" + time + ".png";
		save(path);
		clear();
		background(0,0,0);
		field(width, height);
		inField();
		saveBt();
	}
}
  public void settings() { 	fullScreen(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Replication" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
