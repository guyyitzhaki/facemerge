int NUM_IMAGES = 6;

PImage frame, eyes, eyeMask, nose, noseMask, mouth, mouthMask;
int printerId; 

void setup() {
  size(500, 630);
  listPrinters();
  loadSettings();
  eyeMask = loadImage("eyes.png");
  noseMask = loadImage("nose.png");
  mouthMask = loadImage("mouth.png");
  reset();
}


void draw() {
  image(frame, 0, 0);
  if (mousePressed)
    return;
  image(eyes, 0, 0);
  image(nose, 0, 0);
  image(mouth, 0, 0);
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
  return int(random(1, NUM_IMAGES+1));
}

PImage getImage() {
  return loadImage("0"+getIndex()+".jpg");
}

void loadSettings() {
  String[] settings = loadStrings("settings.txt");
  for (int i = 0; i < settings.length; i++) {
    if (settings[i].startsWith("#")) {
      continue;
    }
    if (settings[i].indexOf(":") == -1) {
      continue;
    }
    String[] parts = settings[i].split(":");
    String key = parts[0].trim();
    String val = parts[1].trim();
    if (key.equals("printer")) {
      printerId = Integer.parseInt(val);
      println("setting printer to " + printerId);
    }
  }
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
  case 'p':
    printFrame(false); 
    break;
  }
}

