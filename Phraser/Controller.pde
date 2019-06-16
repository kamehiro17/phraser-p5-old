void setControllers(){
  ctrl = new ControlP5(this);
  ctrl.setColorBackground(0xffB0B0B0);
  ctrl.setColorForeground(0xff999988);
  ctrl.setColorActive(0xff888855);
  ctrl.setColorLabel(0xdd000000);
  ctrl.setColorValue(0x00CCCCCC);

  WSwitch1 = ctrl.addRadio("WaveSwitch1", 20, 15);
  WSwitch1.setColorForeground(0xffB0B0B0);
  WSwitch1.setColorActive(0xdd998800);
  WSwitch1.setLabelVisible(false);
  WSwitch1.add("Saw", 0);
  WSwitch1.add("Sin", 1);
  WSwitch1.add("Sqr", 2);

  WSwitch2 = ctrl.addRadio("WaveSwitch2", 55, 15);
  WSwitch2.setColorForeground(0xffB0B0B0);
  WSwitch2.setColorActive(0xdd6B8E23);
  WSwitch2.add("Saw", 0);
  WSwitch2.add("Sin", 1);
  WSwitch2.add("Sqr", 2);
  WSwitch2.add("Noise", 3);

  Vol1 = ctrl.addSlider("Vol1", 0, 0.5, 0.5, 15, 80, 15, 80);
  Vol1.setColorBackground(0xffB0B0B0);
  Vol1.setColorForeground(0x99998800);
  Vol1.setColorActive(0xdd998800);
  Vol1.setLabelVisible(false);
  
  Vol2 = ctrl.addSlider("Vol2", 0, 0.5, 0.5, 15, 170, 15, 80);
  Vol2.setColorBackground(0xffB0B0B0);
  Vol2.setColorForeground(0x996B8E23);
  Vol2.setColorActive(0xdd6B8E23);
  Vol2.setLabelVisible(false);

  Play = ctrl.addButton("Play", 0, 95, 10, 40, 60);
  Play.setColorActive(0x99666688);
  Play.setColorBackground(0x99B0B0B0);

  Stop = ctrl.addButton("Stop", 0, 140, 10, 40, 60);
  Stop.setColorActive(0x99888888);
  Stop.setColorBackground(0x99B0B0B0);

  Reset = ctrl.addButton("Reset", 0, 185, 10, 40, 60);
  Reset.setColorActive(0x99996060);
  Reset.setColorBackground(0x99B0B0B0);

  Random1 = ctrl.addButton("Random1", 0, 230, 10, 45, 28);
  Random1.setColorActive(0x99998660);
  Random1.setColorBackground(0x99B0B0B0);

  Random2 = ctrl.addButton("Random2", 0, 230, 42, 45, 28);
  Random2.setColorActive(0x99608860);
  Random2.setColorBackground(0x99B0B0B0);

  EnvG1 = new AGraph(EArray1, 0, 40, 80, 180, 80, 0, 2);
  EnvG2 = new AGraph(EArray2, 0, 40, 170, 180, 80, 0, 2);

  LP1 = ctrl.addSlider("LowPass(HighCut)", 1500, 22000, 22000, 230, 85, 20, 120);
  LP1.setColorBackground(0xffB0B0B0);
  LP1.setColorForeground(0xff94822E);
  LP1.setColorActive(0xff94822E);
  LP1.setLabelVisible(false);

  HP1 = ctrl.addSlider("HighPass(LowCut)", 15, 1500, 15, 230, 205, 20, 120);
  HP1.setColorBackground(0xff94822E);
  HP1.setColorForeground(0xffB0B0B0);
  HP1.setColorActive(0xffB0B0B0);
  HP1.setLabelVisible(false);

  LP2 = ctrl.addSlider("LowPass(HighCut)", 1500, 22000, 22000, 260, 85, 20, 120);
  LP2.setColorBackground(0xffB0B0B0);
  LP2.setColorForeground(0xff73903E);
  LP2.setColorActive(0xff73903E);
  LP2.setLabelVisible(false);

  HP2 = ctrl.addSlider("HighPass(LowCut)", 15, 1500, 15, 260, 205, 20, 120);
  HP2.setColorBackground(0xff73903E);
  HP2.setColorForeground(0xffB0B0B0);
  HP2.setColorActive(0xffB0B0B0);
  HP2.setLabelVisible(false);

  QF1 = ctrl.addKnob("EqFreq", 15, 22000, 2000, 30, 260, 30);
  QG1 = ctrl.addKnob("EqGain", 0, 48, 24, 102, 260, 30);
  QQ1 = ctrl.addKnob("EqQ", 1, 11, 5, 175, 260, 30);

  QF2 = ctrl.addKnob("EqFreq", 15, 22000, 2000, 30, 300, 30);
  QG2 = ctrl.addKnob("EqGain", 0, 48, 24, 102, 300, 30);
  QQ2 = ctrl.addKnob("EqQ", 1, 11, 5, 175, 300, 30);

  SSwitch = ctrl.addRadio("SongSwitch", 10, 380);
  SSwitch.setColorForeground(0xffB0B0B0);
  SSwitch.setColorActive(0xddAAAA66);
  SSwitch.add("KAERU", 0);
  SSwitch.add("SAKURA", 1);
  SSwitch.add("DOREMI", 2);
  SSwitch.add("HOTARU", 3);
  
  RToggle = ctrl.addToggle("Toggle", false, 7, 450, 20, 20);
  RToggle.setColorActive(0xddD5CC43);
  RToggle.setLabel("repeat");
  
  gateS = ctrl.addSlider("gateS", 0.0, 1.0, 0.5, 7, 500, 40, 10);
  gateS.setColorBackground(0xffB0B0B0);
  gateS.setColorForeground(0x998888bb);
  gateS.setColorActive(0xff8888cc);
  gateS.setLabelVisible(false);
  
  SeqG = new AGraph(Seq, 1,  275, 330, 520, 229, 47, 73);
}

void WaveSwitch1(int theID) {
  switch(theID) {
    case(0):
      waveForm1 = 0;    
      break;  
    case(1):
      waveForm1 = 1;    
      break;  
    case(2):
      waveForm1 = 2;    
      break;  
  }
}

void WaveSwitch2(int theID) {
  switch(theID) {
    case(0):
      waveForm2 = 0;    
      break;  
    case(1):
      waveForm2 = 1;    
      break;  
    case(2):
      waveForm2 = 2;    
      break;
    case(3):
      waveForm2 = 3;
      break;
  }
}

void SongSwitch(int theID) {
  switch(theID) {
    case(0):
      for(int i = 0; i < Seq.length; i++){
        Seq[i] = kaeru[i];
      }
      break;
    case(1):
      for(int i = 0; i < Seq.length; i++){
        Seq[i] = sakura[i];
      }
      break;
    case(2):
      for(int i = 0; i < Seq.length; i++){
        Seq[i] = doremi[i];
      }
      break;
    case(3):
      for(int i = 0; i < Seq.length; i++){
        Seq[i] = hotaru[i];
      }
      break;
  }
  SeqG.init(Seq);

}

void Toggle(boolean theFlag) {
  if(theFlag==true) {
    RT = true;
  } else {
    RT = false;
  }
}

void Play(float theValue){
  background(0xddDDDDDD);
  String[] dummy = new String[42];
  prepareChannel(ch1, LP1, HP1, QF1, QG1, QQ1);
  createChannelData(ch1, waveForm1, EArray1, EnvG1, Vol1, gateS);
  drawWave(ch1, 0x99B22222, 1);

  prepareChannel(ch2, LP2, HP2, QF2, QG2, QQ2);
  createChannelData(ch2, waveForm2, EArray2, EnvG2, Vol2, gateS);
  drawWave(ch2, 0x9922B222, 1);

  synthesis(myChannel, ch1, ch2);
  drawWave(myChannel, 0xff333333, 1);
    
  if(RT == true){
    myChannel.play(-1);
  } else {
    myChannel.play();
  }
  js.call("setData", dummy);
}

void Stop(float theValue){
  myChannel.stop();
  myChannel.initChannel(myChannel.frames(Seq.length * noteDuration));
}

void Reset(float theValue){
  myChannel.stop();
  myChannel.initChannel(myChannel.frames(Seq.length * noteDuration));
  defaultImage();
  ctrl.update();
}

void Random1(float theValue){
  myChannel.stop();
  myChannel.initChannel(myChannel.frames(Seq.length * noteDuration));
  for(int i = 0; i < EArray1.length; i++){
    EnvG1.val[i] = random(2);
  }
  LP1.setValue(random(1500, 22000));
  HP1.setValue(random(15, 1500));
  QF1.setValue(random(15, 22000));
  QG1.setValue(random(0, 48));
  QQ1.setValue(random(1, 11));
}

void Random2(float theValue){
  myChannel.stop();
  myChannel.initChannel(myChannel.frames(Seq.length * noteDuration));
  for(int i = 0; i < EArray2.length; i++){
    EnvG2.val[i] = random(2);
  }
  LP2.setValue(random(1500, 22000));
  HP2.setValue(random(15, 1500));
  QF2.setValue(random(15, 22000));
  QG2.setValue(random(0, 48));
  QQ2.setValue(random(1, 11));
}
