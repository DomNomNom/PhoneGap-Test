// Multitouch Sparks
// Adrian Park <http://www.adrianpark.com>
// 2012

ArrayList mouseTrail;

int prevMouseX;
int prevMouseY;

// if multitouch events are fired, this is set to true
boolean useMultiTouch = false;

void setup() {
  size( 960 , 630 );
  background( 0 );
  smooth();
  mouseTrail = new ArrayList();
}

void draw() {
  background( 0 );

  if( !useMultiTouch ) {
    // respond to mouse movement

    if( mouseX != prevMouseX || mouseY != prevMouseY ) {
      // create a spark if the mouse is moving
      Disc newDisc = new Disc( mouseX, mouseY );
      mouseTrail.add( newDisc );
    }

    prevMouseX = mouseX;
    prevMouseY = mouseY;

  }

  updateDiscs();

}

// instructs each spark to draw itself and removes extinguished sparks
void updateDiscs() {

  for( int i = mouseTrail.size() - 1; i > 0; i-- ) {
    Disc d = (Disc) mouseTrail.get(i);

    if( !d.isAlive ) {
      mouseTrail.remove(i);
    }

    d.render();
  }
}

// respond to multitouch events
// COMMENT THIS OUT TO MAKE APP COMPILE IN PROCESSING IDE
//*/
void touchMove(TouchEvent touchEvent) {
  useMultiTouch = true;

  for (int i = 0; i < touchEvent.touches.length; i++) {
    int x = touchEvent.touches[i].offsetX;
    int y = touchEvent.touches[i].offsetY;

    Disc newDisc = new Disc( x, y );
    mouseTrail.add( newDisc );
  }
}
//*/