class Magnet {

  PVector pos = new PVector();
  PVector size = new PVector(200, 200);

  color fillColour = color(255, 204, 204);
  color strokeColour         = color(0  , 255, 0);
  color strokeColour_dragged = color(255, 0, 0);

  int dragPeriod = 100;
  int dragEndTime = 0;
  boolean dragged = false;

  Magnet(int x, int y) {
    pos = new PVector(x, y);
  }

  public void update(dt) {
    if (millis() > dragEndTime)
      dragged = false;
  }

  public boolean on(PVector v) {
    return (
         pos.x          <= v.x
      && pos.y          <= v.y
      && pos.x + size.x >  v.x
      && pos.y + size.y >  v.y
    );
  }

  public void drag(PVector prev, PVector now) {
    if (!dragged) {
      pos.add(PVector.sub(now, prev));
      dragged = true;
      dragEndTime = millis() + dragPeriod;
    }
  }

  void move(PVector v) {
    pos.add(v);
  }

  // draw the spark to screen
  void render() {
    fill(fillColour);
    //noStroke();
    if (dragged) stroke(strokeColour_dragged);
    else         stroke(strokeColour        );


    rect(pos.x, pos.y, size.x, size.y);
  }

}
