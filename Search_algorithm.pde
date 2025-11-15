void hideGold( Room r ) {
  r.hasGold = true;
}


void findGold( Room r ) {

  if ( !r.visited ) {
    println("Searching the", r.name);
    searchPath.add( r );
  }

  if ( r.hasGold ) {
    println("Yay! You found it in the", r.name + "!");
    found = true;
  } 
  
  else {
    r.visited = true;

    for ( Room neighbour : r.neighbours ) {

      if ( !neighbour.visited && !found ) {
        findGold( neighbour );  //RECURSIVE CALL!

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
