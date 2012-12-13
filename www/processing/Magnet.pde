class Magnet {

  PVector pos = new PVector();
  PVector size = new PVector(200, 200);

  color fillColour = color(255, 204, 204);
  color strokeColour         = color(0  , 255, 0);
  color strokeColour_dragged = color(255, 0, 0);

  boolean dragged = false;
  boolean isAlive = true;

  Magnet(int x, int y) {
    pos = new PVector(x, y);
  }

  public boolean on(PVector v) {
    return (
         pos.x          <= v.x
      && pos.y          <= v.y
      && pos.x + size.x >  v.x
      && pos.y + size.y >  v.y
    );
  }

  void move(PVector v) {
    pos.add(v);
  }

  // draw the spark to screen
  void render() {
    if (isAlive) {

      fill(fillColour);
      //noStroke();
      if (dragged) stroke(strokeColour_dragged);
      else         stroke(strokeColour        );


      rect(pos.x, pos.y, size.x, size.y);
    }
  }

}
