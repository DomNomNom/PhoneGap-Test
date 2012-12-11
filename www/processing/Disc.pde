// Multitouch Sparks
// Adrian Park <http://www.adrianpark.com>
// 2012

class Disc{

  int discRadius;
  int minRadius = 2;
  int maxRadius = 10;
  float discAlpha = 255.0;
  float alphaIncrement = 5;
  float xPos;
  float yPos;
  float xVel;
  float yVel;
  float friction = 0.98;
  float gravity = 0.1;
  int maxStartingVelocity = 8;

  // colour library
  color[] colours = new color[3];
  color c1 = color(255, 204, 204);
  color c2 = color(255, 255, 204);
  color c3 = color(204, 255, 204);
  color c4 = color(204, 255, 255);
  color c5 = color(204, 204, 255);
  color c6 = color(255, 204, 255);

  int renderColourIndex;
  color renderColour;

  // false when alpha <= 0
  boolean isAlive = true;

  Disc( int x, int y ) {

    discRadius = round( random( minRadius, maxRadius ) );

    PVector vector = getRandomVector();
    xVel = vector.x;
    yVel = vector.y;

    xPos = x;
    yPos = y;

    colours[0] = c1;
    colours[1] = c2;
    colours[2] = c3;
    colours[2] = c4;
    colours[2] = c5;
    colours[2] = c6;

    renderColourIndex = round( random(0, colours.length-1 ) );
  }

  // draw the spark to screen
  void render() {

    if( isAlive ) {
      renderColour = getColour();

      fill( renderColour );
      noStroke();

      ellipse( xPos, yPos, discRadius*2, discRadius*2 );

      // update properties
      discAlpha -= alphaIncrement;
      xPos += xVel;
      yPos += yVel;

      xVel = xVel * friction;
      yVel = (yVel * friction) + gravity;

      if( discAlpha <= 0 ) {
        isAlive = false;
      }
    }
  }

  // randomly chooses a colour from the colour library
  color getColour() {

    color randomColour = colours[ renderColourIndex ];
    color newColour = color( red(randomColour), green(randomColour), blue(randomColour), discAlpha );
    return newColour;
  }

  // calculate a random direction and speed for the spark
  PVector getRandomVector() {
    float angle = random(0, 2) * PI;
    float velocity = random( 0, maxStartingVelocity );
    float x = cos(angle) * velocity;
    float y = sin(angle) * velocity;
    PVector vector = new PVector( x, y );
    return vector;
  }
}
