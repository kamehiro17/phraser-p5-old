class AGraph {
  float x, y;
  int xSize, ySize, cWidth;
  float pos;
  int divN;
  int mode;
  boolean[] rollOver = new boolean[50];
  boolean[] locked = new boolean[50];
  float[] val = new float[50];
  float minVal, maxVal;
  int pColor = 80;
  int rectColor = 0;

  AGraph(float aName[], int m, float xP, float yP, int xS, int yS, float minV, float maxV) {
    divN = aName.length;
    mode = m;
    x = xP;
    y = yP;
    xSize = xS;
    ySize = yS;
    minVal = minV;
    maxVal = maxV;
    cWidth = xSize / divN;
    init(aName);
  }

  void init(float aName[]){
    for(int i = 0; i < divN; i++)val[i] = maxVal - aName[i];
  }
  
  void update(float mx, float my) {
    for(int i = 0; i < divN; i++){
      rollOver[i] = over(mx, my, i);
      if(locked[i] == true) {
        pos = constrain(my, y, y + ySize);
        switch(mode){
          case(0):
            val[i] = (maxVal - minVal) - abs(pos - (y + ySize)) / ySize * (maxVal - minVal);
            break;
          case(1):
            val[i] = constrain(round((maxVal - minVal) - abs(pos - (y + ySize)) / ySize * (maxVal - minVal)), 1, maxVal - minVal - 1);
            break;
        }

      }
    }
  }
  
  void display(Slider Gate) {
    stroke(0xff555577);
    float[] vert = new float[divN];
    fill(190);
    rect(x, y, xSize, ySize);
    stroke(200);
    for(int i = 1; i < divN; i++){
      line(x + cWidth * i, y + 1, x + cWidth * i, y + ySize - 1);
    }
    for(int i = 1; i < (maxVal - minVal) ; i++){
      if(i == (maxVal - minVal) / 2 || i == maxVal - minVal - 1 || i == 1){
        stroke(145);
      }else if(i == 3 || i == 5 || i == 7 || i == 10 || i == 12 || i == 15 || i == 17 || i == 19 || i == 22 || i == 24) {
        stroke(180);
      }else{
        stroke(165);
      }      
      line(x + 1, y + ySize / (maxVal - minVal) * i, x + xSize - 1, y + ySize / (maxVal - minVal) * i);
    }
    pushMatrix();
    translate(x, y);
    for(int i = 0; i < divN; i++){
      if(rollOver[i] == true){
        pColor = 0xff7777aa;
      }else{
        pColor = 0x998888bb;
      }
      fill(pColor);
      switch(mode){
        case(0):
          vert[i] = val[i] / (maxVal - minVal) * ySize;
          break;
        case(1):
          noStroke();
          rect(cWidth * i + 1, val[i] / (maxVal - minVal) * ySize - ySize / (maxVal - minVal) / 2, cWidth * Gate.getValue(), ySize / (maxVal - minVal));
          break;
      }
    }
    fill(0x55889999);
    stroke(0xff778888);
    switch(mode){
      case(0):
        beginShape();
        vertex(cWidth / 2, ySize);
        for(int i = 0; i < divN; i++){
          vertex(cWidth / 2 + cWidth * i, vert[i]);
        }
        vertex(xSize - cWidth / 2, ySize);
        endShape(CLOSE);
        break;
      case(1):
        break;
    }
    popMatrix();
  }

  boolean over(float mx, float my, int i){
      if((mx > x + cWidth * i) && (mx < x + cWidth * (i + 1)) && (my > y) && (my < y + ySize)) {
        return true;
      } else {
      return false;
    }
  }

  void rPress(int mx, int my){
    for(int i = 0; i < divN; i++){
      if(rollOver[i] == true) {
        val[i] = maxVal;
      }
    }
  }
  
  void press(int mx, int my) {
    for(int i = 0; i < divN; i++){
      if(rollOver[i] == true) {
        locked[i] = true;
      } 
      else {
        locked[i] = false;
      }
    }
  }

  void release() {
    for(int i = 0; i < divN; i++){
      locked[i] = false;
    }
  }

  float getVal(int i) {
    return maxVal - val[i];
  }
}

