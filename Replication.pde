
int fieldX, fieldY;
int _pointX, _pointY;
int infiledPoint = 20;
PImage masuImg, saveBtImg, clearBtImg;
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
int _clearX;
int _clearY;

void setup() {
	background(0,0,0);
	fullScreen();
	field(width, height);
	inField();
	saveBt();
	clearBt();
}

void draw() {
	fill(0,0,0);
	strokeWeight(lineWeight);
	// マウスで線を描く
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

void field(int w, int y) {
	//縦長，横長判断
	if (w >= y) {
		//横長なら
		fieldX = y;
		fieldY = y;
		_pointX = (width / 2) - (fieldX / 2);
		_pointY = 0;
	} else {
		//縦長なら
		fieldX = w;
		fieldY = w;
		_pointY = (height / 2) - (fieldY / 2);
		_pointX = 0;
	}
	strokeWeight(0);
	fill(255, 255, 255);
	rect(_pointX, _pointY, fieldX, fieldY);
}

void inField() {
	masuImg = loadImage("data/masu.png");
	_fieldX = fieldX - infiledPoint*2;
	_fieldY = fieldY - infiledPoint*2;
	_x1 = _pointX + infiledPoint;
	_x2 = _x1 + _fieldX;
	_y1 = _pointY + infiledPoint;
	_y2 = _y1 + _fieldY;
	image(masuImg, _x1, _y1, _fieldX, _fieldY);
}

void keyPressed() {
	String time = "" + year() + "_" + month() + "_" + day() + "_" + hour() + "_" + minute() + "_" + second();
	String path = "data/screenshot/" + time + ".png";
	if (key == ENTER) {
		save(path);
		clear();
		background(0,0,0);
		field(width, height);
		inField();
		saveBt();
		clearBt();
	}
}

void saveBt() {
	saveBtImg = loadImage("data/save2.png");
	_btImagW = saveBtImg.width / 3;
	_btImagH = saveBtImg.height / 3;
	_saveX = width - _btImagW;
	_saveY = height - _btImagH;
	image(saveBtImg, _saveX, _saveY, _btImagW, _btImagH);
}

void clearBt() {
	clearBtImg = loadImage("data/keshi.png");
	_clearX = 0;
	_clearY = 0;
	image(clearBtImg, _clearX, _clearY, _btImagW, _btImagH);
}

void mousePressed() {
	if (mouseX > _saveX && mouseX < width && mouseY > _saveY && mouseY < height) {
		String time = "" + year() + "_" + month() + "_" + day() + "_" + hour() + "_" + minute() + "_" + second();
		String path = "data/screenshot/" + time + ".png";
		save(path);
		clear();
		background(0,0,0);
		field(width, height);
		inField();
		saveBt();
		clearBt();
	}
	if (mouseX > 0 && mouseX < _btImagW && mouseY > 0 && mouseY < _btImagH) {
		clear();
		background(0,0,0);
		field(width, height);
		inField();
		saveBt();
		clearBt();
	}
}