void arrangeLayout( Room startRoom, PVector center, float startRadius ) {
  ArrayList<Room> roomsToDraw = new ArrayList();
  
  roomsToDraw.add( startRoom );
  startRoom.pos = center;
  startRoom.drawn = true;
  
  float radius = startRadius;

  while ( roomsToDraw.size() > 0 ) {
    Room nextRoom = roomsToDraw.get(0);
    
    float theta = 0;
    float deltaTheta = TWO_PI / nextRoom.neighbours.size();
    
    for( Room neighbour : nextRoom.neighbours ) {
      if(  !neighbour.drawn & !neighbour.inDrawingQueue ) {
        if( neighbour.equals(foyer1))
          println("FOYER!", nextRoom.name);
        roomsToDraw.add( neighbour );
        neighbour.inDrawingQueue = true;
        
        float xRoom = nextRoom.pos.x + radius * cos(theta);
        float yRoom = nextRoom.pos.y - radius * sin(theta);
        
        neighbour.pos.x = constrain(xRoom, 40, width-40);
        neighbour.pos.y = constrain(yRoom, 40, height-80);
        
        theta += deltaTheta;
      }
    }

    radius = 0.35*startRadius;
    
    roomsToDraw.remove( nextRoom );    
  }
}


void drawLayout() {
   println(foyer1.pos);
   for( Room r: allRooms) {
     for( Room neighbour: r.neighbours ) {
       line( r.pos.x, r.pos.y, neighbour.pos.x, neighbour.pos.y );
     }
   }
   
   for( Room r: allRooms) {
     r.drawMe();
   }
}
