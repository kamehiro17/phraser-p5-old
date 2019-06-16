import krister.Ess.*;
import controlP5.*;
//import netscape.javascript.*;

//JSObject js;
AudioChannel myChannel, ch1, ch2; // Create channel
SawtoothWave Saw; // Create Sawtooth waveform
SineWave Sin;
SquareWave Sqr;
WhiteNoise Noise;
FFT pFFT;

Envelope myEnv; // Create envelope
Normalize myNM;
LowPass myLP; //Create LPF(HCF)
HighPass myHP; //Create HPF(LCF)
EQ myEQ; //Create NotchFilter
AGraph EnvG1, EnvG2, SeqG;

ControlP5 ctrl;
Slider LP1, LP2, HP1, HP2, Vol1, Vol2, gateS;
Knob QF1, QF2, QG1, QG2, QQ1, QQ2;
RadioButton WSwitch1, WSwitch2, SSwitch;
Controller Play, Stop, Reset, Random1, Random2, RToggle;

int noteDuration = 500; // Duration of each note in milliseconds
int waveForm1 = 0, waveForm2 = 2; //0 = Saw, 1 = Sine, 2 = Square, 3 = WNoise
boolean RT = false;
float[] EArray1 = {0, 1, 2, 1, 0};
float[] EArray2 = {2, 1, 0, 0, 0, 0, 0};
float[] Seq = {48, 50, 52, 53, 52, 50, 48, 0, 52, 53, 55, 57, 55, 53, 52, 0};
float gate = 0.5;

void setup(){
  size(800,560);
  noFill();
  Ess.start(this); // Start Ess
  myChannel = new AudioChannel(); // Create a new AudioChannel
  ch1 = new AudioChannel(); // Create a new AudioChannel
  ch2 = new AudioChannel(); // Create a new AudioChannel
  myEnv = new Envelope(null);  
  Saw = new SawtoothWave(0, 0.1); // Freq, volume
  Sin = new SineWave(0, 0.1);
  Sqr = new SquareWave(0, 0.1);
  Noise = new WhiteNoise(0.1);
  pFFT = new FFT(512);
  //try{
  //  js = JSObject.getWindow(this);
  //}catch(Exception e){
  //  println("Error: Cannot get window object " +  e.getMessage());
  //}

  defaultImage();
}

void draw(){
  noFill();
  EnvG1.display(gateS);
  EnvG1.update(mouseX, mouseY);
  EnvG2.display(gateS);
  EnvG2.update(mouseX, mouseY);
  SeqG.display(gateS);
  SeqG.update(mouseX, mouseY);
  drawFFT(myChannel, 60, 350, 200, 200);
} 


void mousePressed() {
  if(mouseButton == LEFT){
    EnvG1.press(mouseX, mouseY);
    EnvG2.press(mouseX, mouseY);
    SeqG.press(mouseX, mouseY);
  } else if(mouseButton == RIGHT){
    EnvG1.rPress(mouseX, mouseY);
    EnvG2.rPress(mouseX, mouseY);
    SeqG.rPress(mouseX, mouseY);
  }
}

void mouseReleased() {
  EnvG1.release();
  EnvG2.release();
  SeqG.release();
}

void stop(){
  Ess.stop();
  super.stop();
}
