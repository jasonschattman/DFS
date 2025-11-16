class Room {
  //Fields
  String name;
  boolean visited, hasRing, hasRobot, drawn, inDrawingQueue;
  ArrayList<Room> neighbours;
  PVector pos; //Screen coordinates
  float r, theta, size;
  color colour;
  
  //Constructor
  Room(String n) {
    this.name = n;
    this.visited = false;
    this.hasRing = false;
    this.hasRobot = false;
    this.drawn = false;
    this.inDrawingQueue = false;
    this.neighbours = new ArrayList();
    this.pos = new PVector(60,60);
    this.size = 10*this.name.length();
    this.colour = emptyColour;
    allRooms.add(this); //Adds the current room to the allRooms list as soon as the room is constructed
  }

  //METHODS
  
  void addNeighbour( Room r ) {
    this.neighbours.add( r );  //Adds r to this room's neighbour list
    r.neighbours.add( this );  //Conversely, adds this room to r's neighbour list, so that the adjacency goes in both directions 
  }

  
  void drawMe() {
    fill(this.colour);
    ellipse( this.pos.x, this.pos.y, this.size, 60 );  //Draws the room's oval

    fill(0);
    text( this.name, this.pos.x, this.pos.y ); //Draws the room's name on the oval
    this.drawn = true;
    
    if ( this.hasRing ) {  //If the ring is here, draw the ring below the oval
      image(ring, this.pos.x,this.pos.y+45);
    }
    
    if ( this.hasRobot ) { //If the robot is here, draw the robot above the oval ("above" is in case the robot & ring are in the same room)
      fill( occupiedColour );
      image(robot, this.pos.x,this.pos.y-55);
    }
  }
}
