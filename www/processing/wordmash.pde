ArrayList<Magnet> magnets;

HashMap<Integer, PVector> prevTouches    = new HashMap<Integer, PVector>();
HashMap<Integer, Magnet > draggedMagnets = new HashMap<Integer, Magnet >();

// if multitouch events are fired, this is set to true
boolean useMultiTouch = false;

String debug = "";

void setup() {
  size(960, 630);
  background(0);
  smooth();
  magnets = new ArrayList<Magnet>();
  magnets.add(new Magnet(300,  50));
  magnets.add(new Magnet(300, 300));
}

void draw() {
  background(0);

  if (!useMultiTouch) {
    // respond to mouse movement
    //debug = "" + mousePressed;
  }

  for (Magnet m : magnets) {
    m.render();
  }

  fill(color(200,200,200));
  if (debug != "") {
    text("debug: " + debug, 10, 10);
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
  out = "{\n";
  for (key in d) {
    out += key + " : " + d[key] + "\n";
  }
  out += '}';
  return out;
}

// respond to multitouch events
// COMMENT THIS OUT TO MAKE APP COMPILE IN PROCESSING IDE
// /*
void touchStart(TouchEvent touchEvent) {
  for (int i=0; i<touchEvent.touches.length; i++) {
    int id = touchEvent.touches[i].identifier;

    PVector currentPos = new PVector(
      touchEvent.touches[i].offsetX,
      touchEvent.touches[i].offsetY
    );


    Magnet touched = null;
    for (Magnet m : magnets)
      if (m.on(currentPos))
        touched = m;

    if (touched != null && !touched.dragged) {
      touched.dragged = true;
      draggedMagnets.put(id, touched);
    }

    prevTouches.put(id, currentPos);
  }
}

void touchMove(TouchEvent touchEvent) {

  useMultiTouch = true;

  for (int i=0; i<touchEvent.touches.length; i++) {
    PVector currentPos = new PVector(
      touchEvent.touches[i].offsetX,
      touchEvent.touches[i].offsetY
    );

    int id = touchEvent.touches[i].identifier;

    if (draggedMagnets.containsKey(id)) {
      draggedMagnets.get(id).move(
        PVector.sub(currentPos, prevTouches.get(id))
      );
    }
    prevTouches.put(id, currentPos);

    //debug = "move: " + showObject_all(touchEvent.touches[i]);
  }
}

void touchEnd   (TouchEvent touchEvent) { stopdrag(touchEvent); }
void touchCancle(TouchEvent touchEvent) { stopdrag(touchEvent); }
void stopdrag(TouchEvent touchEvent) {
  for (int i=0; i<touchEvent.touches.length; ++i) {
    int id = touchEvent.touches[i].identifier;
    if (draggedMagnets.containsKey(id)) {
      Magnet removedMagnet = draggedMagnets.remove(id);
      removedMagnet.dragged = false;
    }
  }
}


//*/