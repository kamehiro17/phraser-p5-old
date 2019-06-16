void prepareChannel(AudioChannel Channel, Slider LP, Slider HP, Knob QF, Knob QG, Knob QQ){
  Channel.initChannel(Channel.frames(Seq.length * noteDuration));
  
  myNM = new Normalize();
  myLP = new LowPass(LP.value(), -24, 16); //Freq, gain, q-sharpness
  myHP = new HighPass(HP.value(), -24, 16); //Freq, gain, q-sharpness
  myEQ = new EQ(QF.value(), QG.value()-24, QQ.value());

}  

EPoint[] setEnvelopePoints(float[] EArray, AGraph EnvG){
  EPoint[] myEnv = new EPoint[EArray.length]; // breakpoint function
  for(int i = 0; i < EArray.length; i++){
    myEnv[i] = new EPoint(i, EnvG.getVal(i));
  }
  return myEnv;
}

void createChannelData(AudioChannel Channel, int waveForm, float[] EArray, AGraph EnvG, Slider Vol, Slider Gate){
    myEnv.points = setEnvelopePoints(EArray, EnvG);
      for(int i = 0, note = 0, time = 0; i < Seq.length; i++, note++, time += noteDuration){ // Repeat number of steps
        int begin = Channel.frames(time); // Starting position within Channel
        int e = int(noteDuration * Gate.value()); // length of each note
        int end = Channel.frames(e); // Ending position with Channel
        switch(waveForm){
          case(0):
              Saw.frequency = melody(note); // Update waveform frequency
              Saw.generate(Channel, begin, end); // Render wave
              break;
          case(1):
              Sin.frequency = melody(note); // Update waveform frequency
              Sin.generate(Channel, begin, end); // Render wave
              break;
          case(2):
              Sqr.frequency = melody(note); // Update waveform frequency
              Sqr.generate(Channel, begin, end); // Render wave
              break;
          case(3):
              if(melody(note) != 0)Noise.generate(Channel, begin, end);
              break;
        }
        myEnv.filter(Channel, begin, end); // Apply envelope
      }

  myLP.filter(Channel); // Apply LPF
  myHP.filter(Channel); // Apply HPF
  myEQ.filter(Channel); // Apply EQ
  myNM.filter(Channel, Vol.value()); // Apply Normalize
}

void synthesis(AudioChannel PlayCh, AudioChannel ch1, AudioChannel ch2){
  PlayCh.initChannel(PlayCh.frames(Seq.length * noteDuration));
  for(int i = 0; i < Seq.length * noteDuration * 44.1 ; i++){
    PlayCh.samples[i] = ch1.samples[i] + ch2.samples[i];
  }
}
