float melody(int note){
  return getFrequencyByNote(SeqG.getVal(note));  
}

float getFrequencyByNote(float note){
  if(note != 0){
    return 55 * pow(2, ((note - 33) / 12.0));
  }else{
    return 0;
  }
}

  int[] kaeru = {
    48, 50, 52, 53, 52, 50, 48, 0,
    52, 53, 55, 57, 55, 53, 52, 0
  };
  int[] hotaru = {
    53, 58, 58, 58, 62, 60, 58, 60,
    62, 58, 58, 62, 65, 67, 0, 0
  };
  int[] doremi = {
    48, 50, 52, 53, 55, 57, 59, 60,
    60, 62, 64, 65, 67, 69, 71, 72
  };
  int[] sakura = {
    62, 62, 64, 0, 62, 62, 64, 0,
    62, 64, 65, 64, 62, 64, 58, 0
  };
  
