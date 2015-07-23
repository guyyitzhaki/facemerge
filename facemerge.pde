int NUM_IMAGES = 6;

PImage frame, eyes, eyeMask, nose, noseMask, mouth, mouthMask;

void setup() {
  size(500,630);
  eyeMask = loadImage("eyes.png");
  noseMask = loadImage("nose.png");
  mouthMask = loadImage("mouth.png");
  reset();
}


void draw() {
  image(frame, 0, 0);
  if (mousePressed)
    return;
  image(eyes,0,0);
  image(nose,0,0);
  image(mouth,0,0);
}

void reset() {
  frame = getImage();
  eyes = getImage();
  nose = getImage();
  mouth = getImage();
  mask();
}

void mask() {
  eyes.mask(eyeMask);  
  nose.mask(noseMask);  
  mouth.mask(mouthMask);  
}

int getIndex() {
  return int(random(1,NUM_IMAGES+1));
}

PImage getImage() {
  return loadImage("0"+getIndex()+".jpg");
}

void keyPressed() {
  switch(key) {
    case ' ':
      reset();
      break;  
    case 's':
      saveFrame("image####.png");
      break; 
    case 'e': 
      eyes = getImage();  
      mask();
      break;
    case 'n': 
      nose = getImage();  
      mask();
      break;
    case 'm': 
      mouth = getImage();  
      mask();
      break;
    case 'f': 
      frame = getImage();  
      mask();
      break;
  }
}
