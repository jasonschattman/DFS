class Room {
  String name;
  boolean visited, hasGold, hasRobot, drawn, inDrawingQueue;
  ArrayList<Room> neighbours;
  PVector pos;
  float r, theta, size;
  color colour;
  
  Room(String n) {
    this.name = n;
    this.visited = false;
    this.hasGold = false;
    this.hasRobot = false;
    this.drawn = false;
    this.inDrawingQueue = false;
    this.neighbours = new ArrayList();
    this.pos = new PVector(60,60);
    this.size = 10*this.name.length();
    this.colour = emptyColour;
    allRooms.add(this);
  }

  
  void addNeighbour( Room r ) {
    this.neighbours.add( r );
    r.neighbours.add( this );
  }

  
  void drawMe() {
    fill(this.colour);
    ellipse( this.pos.x, this.pos.y, this.size, 60 ); noFill();

    fill(0);
    text(this.name, this.pos.x, this.pos.y);
    this.drawn = true;
    noFill();
    stroke(0);
    
    if (this.hasGold) {
      image(ring, this.pos.x,this.pos.y+55);
    }
    
    if (this.hasRobot) {
      image(robot, this.pos.x,this.pos.y-55);
    }
  }
  
}
