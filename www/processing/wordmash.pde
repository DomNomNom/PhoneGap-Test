ArrayList<Magnet> magnets;

ArrayList<PVector> touches     = new ArrayList<PVector>();
ArrayList<PVector> prevTouches = new ArrayList<PVector>();

// if multitouch events are fired, this is set to true
boolean useMultiTouch = false;

String debug = "";

void setup() {
  size(960, 630);
  background(0);
  smooth();
  magnets = new ArrayList<Magnet>();
  magnets.add(new Magnet(300, 500));
  magnets.add(new Magnet(300, 100));
}

void draw() {
  background(0);

  if (!useMultiTouch) {
    // respond to mouse movement
    touches.add(new PVector(mouseX, mouseY));
  }

  updateDiscs();
  touches.clear();
  text("debug: " + debug, 10, 10);
}

// instructs each spark to draw itself and removes extinguished sparks
void updateDiscs() {
  for (Magnet m : magnets) {

    m.renderColour = color(204, 204, 255);
    for (PVector touch : touches) { // bad n^2 collision detection... is good enough
      if (m.on(touch)) {
        m.renderColour = color(255, 204, 204);
        break;
      }
    }

    m.render();
  }
}

// just in case I want to know what a Jquery select gives me
function showObject(d) {
  out = "{\n";
  for (key=0; key<d.length; ++key) {
    out += key + " : " + d[key] + "\n";
  }
  out += '}';
  return out;
}
// just in case I want to know what a Jquery select gives me
function showObject_all(d) {
  out = "{\n"
  for (key in d) {
    out += key + " : " + d[key] + "\n";
  }
  out += '}'
  return out;
}

// respond to multitouch events
// COMMENT THIS OUT TO MAKE APP COMPILE IN PROCESSING IDE
// /*
void touchMove(TouchEvent touchEvent) {
  useMultiTouch = true;

  for (int i=0; i<touchEvent.touches.length; i++) {
    //text("ding: "+ showObject(touchEvent.touches[i]), 10, 30);
    debug = showObject(touchEvent.touches[i]);
    touches.add(new PVector(
      touchEvent.touches[i].offsetX,
      touchEvent.touches[i].offsetY
    ));
    /*
    int x = touchEvent.touches[i].offsetX;
    int y = touchEvent.touches[i].offsetY;

    Disc newDisc = new Disc(x, y);
    magnets.add(newDisc);
    */
  }
}
//*/