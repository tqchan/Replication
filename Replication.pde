
int fieldX, fieldY;
int _pointX, _pointY;
int infiledPoint = 20;
PImage masuImg;
int lineWeight = 10;

void setup() {
	background(0,0,0);
	fullScreen();
	field(width, height);
	inField();
}

void draw() {
	fill(0,0,0);
	strokeWeight(lineWeight);
	// マウスで線を描く
	if (mousePressed) {
		line(pmouseX, pmouseY, mouseX, mouseY);
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
	rect(_pointX, _pointY, fieldX, fieldY);
}

void inField() {
	masuImg = loadImage("data/masu.png");
	int _fieldX = fieldX - infiledPoint*2;
	int _fieldY = fieldY - infiledPoint*2;
	int _x1, _x2, _y1, _y2;
	_x1 = _pointX + infiledPoint;
	_x2 = _x1 + _fieldX;
	_y1 = _pointY + infiledPoint;
	_y2 = _y1 + _fieldY;
	// rect(_x1, _y1, _fieldX, _fieldY);
	image(masuImg, _x1, _y1, _fieldX, _fieldY);
}