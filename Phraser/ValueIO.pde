String ValueOut(){
  String[] vOut = new String[42];
  String ValueStr = "";
  vOut[0] = String.valueOf(waveForm1);
  vOut[1] = String.valueOf(waveForm2);
  vOut[2] = String.valueOf(Vol1.value());
  vOut[3] = String.valueOf(Vol2.value());
  vOut[4] = String.valueOf(LP1.value());
  vOut[5] = String.valueOf(LP2.value());
  vOut[6] = String.valueOf(HP1.value());
  vOut[7] = String.valueOf(HP2.value());
  vOut[8] = String.valueOf(QF1.value());
  vOut[9] = String.valueOf(QF2.value());
  vOut[10] = String.valueOf(QG1.value());
  vOut[11] = String.valueOf(QG2.value());
  vOut[12] = String.valueOf(QQ1.value());
  vOut[13] = String.valueOf(QQ2.value());
  for(int i = 14; i < 14 + EArray1.length; i++)
    vOut[i] = String.valueOf(EnvG1.val[i - 14]);
  for(int i = 19; i < 19 + EArray2.length; i++)
    vOut[i] = String.valueOf(EnvG2.val[i - 19]);
  for(int i = 26; i < 26 + Seq.length; i++)
    vOut[i] = String.valueOf(SeqG.getVal(i - 26));

  for(int i = 0; i < 25; i++){
    ValueStr += vOut[i] + ",";
  }
    ValueStr += vOut[25] + ",";
  for(int i = 26; i < 42; i++){
    ValueStr += vOut[i] + ",";
  }

  return ValueStr;
}

String ValueIn(String vIn){
  float[] valAry = new float[42];
  println("ValueIn");
  String[] strAry = vIn.split(",");
  for(int i = 0; i < 42; i++){
    try {
      valAry[i] = Float.valueOf(strAry[i]);
    } catch (Exception e){
      return "";
    }
  }
  VUpdate(valAry);
  return vIn;
}

void VUpdate(float[] Value){
  println("VUpdate");
  waveForm1 = constrain(parseInt(Value[0]), 0, 2);
  waveForm2 = constrain(parseInt(Value[1]), 0, 3);
  
  Vol1.setValue(constrain(Value[2], 0, 0.5));
  Vol2.setValue(constrain(Value[3], 0, 0.5));
  LP1.setValue(constrain(Value[4], 1500, 22000));
  LP2.setValue(constrain(Value[5], 1500, 22000));
  HP1.setValue(constrain(Value[6], 15, 1500));
  HP2.setValue(constrain(Value[7], 15, 1500));
  QF1.setValue(constrain(Value[8], 15, 22000));
  QF2.setValue(constrain(Value[9], 15, 22000));
  QG1.setValue(constrain(Value[10], 0, 48));
  QG2.setValue(constrain(Value[11], 0, 48));
  QQ1.setValue(constrain(Value[12], 1, 11));
  QQ2.setValue(constrain(Value[13], 1, 11));
  for(int i = 14; i < 14 + EArray1.length; i++)
    EnvG1.val[i - 14] = constrain(Value[i], 0, 2);
  for(int i = 19; i < 19 + EArray2.length; i++)
    EnvG2.val[i - 19] = constrain(Value[i], 0, 2);
  for(int i = 26; i < 26 + Seq.length; i++)
    Seq[i - 26] = constrain(Value[i], 47, 73);
  
  SeqG.init(Seq);
}
