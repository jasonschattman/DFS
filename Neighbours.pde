void specifyNeighbours() {
  
  foyer1.addNeighbour( entrance );
  foyer1.addNeighbour( office );
  foyer1.addNeighbour( caf );
  foyer1.addNeighbour( aud );
  foyer1.addNeighbour( drama );
  foyer1.addNeighbour( tech );
  foyer1.addNeighbour( gyms );
  foyer1.addNeighbour( pods1 );
  foyer1.addNeighbour( foyer2 );
  
  office.addNeighbour( guidance );
  
  caf.addNeighbour( aud );
  
  aud.addNeighbour( drama );
  
  foyer2.addNeighbour( lib );
  foyer2.addNeighbour( aud );
  foyer2.addNeighbour( sac );
  foyer2.addNeighbour( art );
  foyer2.addNeighbour( staff );
  foyer2.addNeighbour( pods2 );
}
