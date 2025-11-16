void hideRing( Room r ) {
  r.hasRing = true;
}


//RUNS A DFS ALGORITHM TO FIND THE ROOM THAT CONTAINS THE RING
void findRing( Room r ) {

  //If the robot hasn't visited this room yet, then add it to the search path
  if ( !r.visited ) {
    println("Searching the", r.name);
    searchPath.add( r );
  }

  //BASE CASE - Check if the ring is in this room
  if ( r.hasRing ) {
    println("Yay! You found it in the", r.name + "!");
    found = true;
  } 
  
  //RECURSIVE CASE - If the ring is not in this room...
  else {
    r.visited = true;

    //For each of this room's neighbours, call the DFS algorithm on that neighbour recursively
    for ( Room neighbour : r.neighbours ) {

      if ( !neighbour.visited && !found ) {
        findRing( neighbour );  //RECURSIVE CALL! Calls the DFS algorithm recursively on the neighbour

        //IF THE ABOVE RECURSIVE SEARCH DIDN'T SUCCEED, THEN GO BACK TO THE PREVIOUS ROOM & ADD IT AGAIN TO THE SEARCH PATH
        //(since the robot has to re-enter this room)
        if ( !found ) {
          println("Going back to the", r.name);
          searchPath.add( r );
        }
      }
    }
  }
}


void printSearchPath() {
  println("***");
  for ( Room r : searchPath) {
    println(r.name);
  }
}

