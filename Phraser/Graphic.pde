void defaultImage(){
  setControllers();

  background(0xddDDDDDD);
  stroke(0xff446666);
  line(290, 0, 290, 320);
  line(width - 1, 0, width - 1, 320);
  line(290, 0, width, 0);
  line(290, 160, width, 160);
  line(290, 320, width, 320);
  stroke(0xffC0C0C0);
  line(290, 80, width, 80);
  line(290, 240, width, 240);
  
}

void drawWave(AudioChannel chData, int Wcolor, int SWeight){
  stroke(0xff446666);
  line(290, 0, 290, 320);
  line(width - 1, 0, width - 1, 320);
  line(290, 0, width, 0);
  line(290, 160, width, 160);
  line(290, 320, width, 320);
  stroke(0xffC0C0C0);
  line(290, 80, width, 80);
  line(290, 240, width, 240);
  
  strokeWeight(SWeight);
  stroke(Wcolor);
  noFill();
  beginShape();
  for(int j = 290 ; j < width ; j++){
    vertex(j, 80+(int)(chData.samples[(j+500)*7]*90));
  }
  endShape();

  beginShape();
  for(int j = 0 ; j < width - 290 ; j++){
    vertex(j + 290, 240+(int)(chData.samples[j*50]*90));
  }
  endShape();
  strokeWeight(1);
}

void drawFFT(AudioChannel chData, int x, int y, int xSize, int ySize) {
  pushMatrix();
  translate(x, y);
  fill(0xaa888888);
  stroke(80);
  rect(0, 0, xSize, ySize);

  pFFT.getSpectrum(chData);
  
  noFill();
  stroke(0xff33FF33);
  for (int i = 0; i < 256; i++) {
    float temp = max(0, ySize * 0.9 - pFFT.spectrum[i] * 700);
    rect(i * xSize / 256 + 1, temp - 1, xSize / 256 , ySize - temp);
  }
  popMatrix();
}
