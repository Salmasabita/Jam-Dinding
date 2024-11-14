PImage jam;

void setup() {
  size(1000, 1000);
  jam = loadImage("jam.png");

  noStroke();
  imageMode(CENTER);
  textAlign(CENTER, CENTER);
  textSize(48);
}

void draw() {
  background(255);

  // Menggambar jam
  image(jam, width / 2, height / 2);

  // Menggambar angka setiap jam
  for (int i = 1; i <= 12; i++) {
    float angle = radians(map(i, 0, 12, 0, 360)) - HALF_PI;
    float x = cos(angle) * 260 + 990 / 2; // Menggeser angka ke dalam dan ke pusat
    float y = sin(angle) * 260 + 780 / 2; // Menggeser angka ke dalam dan ke pusat
    fill(#8E7936);
    text(i, x, y); // Menyesuaikan posisi angka jam
  }
  
  // Menggambar jarum detik
  float secondAngle = radians(map(second(), 0, 60, 0, 360)) - HALF_PI;
  stroke(#8E8772);
  strokeWeight(4);
  line(490, 400, cos(secondAngle) * 220 + 490, sin(secondAngle) * 240 + 400);
  
  // Menggambar jarum menit
  float minuteAngle = radians(map(minute(), 0, 60, 0, 360)) - HALF_PI;
  stroke(#D3AA20);
  strokeWeight(8);
  line(490,400, cos(minuteAngle) * 200 + 490, sin(minuteAngle) * 120 + 400);
  
  // Menggambar jarum jam
  float hourAngle = radians(map(hour() % 12, 0, 12, 0, 360)) - HALF_PI;
  stroke(0);
  strokeWeight(10);
  line(490, 400, cos(hourAngle) * 130 + 490, sin(hourAngle) * 80 + 400);
  
  // Menggambar titik tengah jam
  fill(0);
  ellipse(490, 400, 20, 20);
}
