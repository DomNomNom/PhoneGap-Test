ArrayList<Magnet> magnets;

HashMap<Integer, PVector> prevTouches    = new HashMap<Integer, PVector>();
HashMap<Integer, Magnet > draggedMagnets = new HashMap<Integer, Magnet >();

// if multitouch events are fired, this is set to true
boolean useMultiTouch = false;

float prevTime = 0;
float timeStep = 15; // period of physics steps (in millis)
float accumulator = 0;

String debug = "";
String debug2 = "";

void setup() {
  size(960, 630);
  background(0);
  smooth();
  magnets = new ArrayList<Magnet>();
  magnets.add(new Magnet(300,  50));
  magnets.add(new Magnet(300, 300));
}

void draw() {

  // == input ==
  if (!useMultiTouch) {
    // respond to mouse movement ... maybe
    //debug = "" + mousePressed;
  }


  // == update ==

  float timeNow = millis();
  float frameTime = timeNow - prevTime;
  prevTime = timeNow;
  accumulator += frameTime;
  while (accumulator >= timeStep) {
    for (Magnet m : magnets)
      m.update(timeStep);

    accumulator -= timeStep;
  }


  // == draw ==
  background(0);
  for (Magnet m : magnets) {
    m.render();
  }

  //debug2 = ""+ showObject_all(draggedMagnets.keySet().toArray());

  fill(color(200,200,200));
  if (debug  != "")  text("debug: " + debug,  10, 10);
  if (debug2 != "")  text("debug: " + debug2, 200, 20);
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

    Magnet touched = null;
    for (Magnet m : magnets) {  // TODO
      if (m.on(currentPos)) {
        touched = m;
        break;
      }
    }
    if (touched != null) {
      //touched.dragged = true;
      touched.drag(prevTouches(id), currentPos);
      //draggedMagnets.put(id, touched);
    }

    prevTouches.put(id, currentPos);

    debug = "move: " + showObject_all(touchEvent.touches[i]);
  }
}

void touchEnd   (TouchEvent touchEvent) { stopDrag(touchEvent); }
void touchCancle(TouchEvent touchEvent) { stopDrag(touchEvent); }
void stopDrag(TouchEvent touchEvent) {
  for (int i=0; i<touchEvent.touches.length; ++i) {
    int id = touchEvent.touches[i].identifier;
    debug = "stopDrag" + id +"??";
    if (draggedMagnets.containsKey(id)) {
      debug = "removed key: " + id;
      Magnet removedMagnet = draggedMagnets.remove(id);
      if (removedMagnet != null)
        removedMagnet.dragged = false;
    }
    debug = "stopDrag end" + id;
  }
}


//*/