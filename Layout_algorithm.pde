
//USES A HUB_AND_SPOKE LIKE LAYOUT. USES A BFS QUEUE TO SET THE ORDER IN WHICH THE 
//ROOMS' COORDINATES ARE COMPUTED
void arrangeLayout( Room startRoom, PVector center, float startRadius ) {
  ArrayList<Room> roomsToDraw = new ArrayList();
  
  roomsToDraw.add( startRoom ); //First room in the BFS queue
  startRoom.pos = center;
  startRoom.drawn = true;
  
  float radius = startRadius;

  //For as long as the queue is not empty...
  while ( roomsToDraw.size() > 0 ) {
    Room nextRoom = roomsToDraw.get(0);  //Fetches the next room in the queue, which becomes a new hub
    
    //Theta measures the angle that the spokes will form with the hub
    float theta = 0;
    float deltaTheta = TWO_PI / nextRoom.neighbours.size();
    
    //For every neighbour of the current hub...
    for( Room neighbour : nextRoom.neighbours ) {
      if(  !neighbour.drawn & !neighbour.inDrawingQueue ) {
        roomsToDraw.add( neighbour );  //Adds the neighbour to the queue
        neighbour.inDrawingQueue = true;
        
        //Computes the neighbour's screen coordinates using the current hub as a center
        float xRoom = nextRoom.pos.x + radius * cos(theta);
        float yRoom = nextRoom.pos.y - radius * sin(theta);
        
        //Sets the neighbour's coordinates to those values, but constraining them to make sure it's not off screen
        neighbour.pos.x = constrain( xRoom, 40, width-40 );
        neighbour.pos.y = constrain( yRoom, 40, height-80 );
        
        theta += deltaTheta;  //Increases theta to prepare for the next spoke
      }
    }

    radius = 0.35*startRadius; //Decreases the radius so that the second hub is smaller in diameter for easier visualization
    
    roomsToDraw.remove( nextRoom ); //Crucially, removes the current room from the queue  
  }
}


//DRAWS THE ROOMS AND CONNECTING LINES
void drawLayout() {
   
   //Draws the connecting lines first (so that the rooms will be drawn on top of the lines)
   for( Room r: allRooms) {
     for( Room neighbour: r.neighbours ) {
       line( r.pos.x, r.pos.y, neighbour.pos.x, neighbour.pos.y );
     }
   }
   
   //Draws the rooms themselves
   for( Room r: allRooms) {
     r.drawMe();
   }
}
