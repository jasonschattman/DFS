ArrayList<Room> allRooms = new ArrayList();
ArrayList<Room> searchPath = new ArrayList();

float animationSpeed = 1.2;
color emptyColour = color(255, 255, 180);
color occupiedColour = color(0,255,0);

Room entrance = new Room( "Entrance" );
Room lib = new Room( "Library" );
Room caf = new Room( "Cafeteria" );
Room aud = new Room( "Auditorium" );
Room drama = new Room( "Drama hall" );
Room gyms = new Room( "Phys Ed" );
Room foyer1 = new Room( "1st floor foyer" );
Room foyer2 = new Room( "2nd floor foyer" );
Room office = new Room( "Main office" );
Room guidance = new Room( "Guidance" );
Room sac = new Room( "SAC office" );
Room tech = new Room( "Tech hall" );
Room pods1 = new Room( "Pods 1000's" );
Room pods2 = new Room( "Pods 2000's" );
Room art = new Room( "Art hall" );
Room staff = new Room( "Staff room" );

Room startingRoom = entrance;
Room treasureRoom = lib;
Room centralRoom = foyer1;

int roomIndex = 0;
PFont myFont;
PVector center;
boolean found = false;
PImage ring, robot;

void setup() {
  size(1000,770);
  noLoop();
  frameRate( animationSpeed ); 
  background(255);  
  textAlign( CENTER, CENTER );
  imageMode(CENTER);
  
  ring = loadImage("ring.png");
  ring.resize(70, 60);
  robot = loadImage("robot.png");
  robot.resize(50, 50);
  
  myFont = createFont("Cambria", 20); textFont(myFont);
  center = new PVector(width/2, height/2);  
  
  specifyNeighbours();
  arrangeLayout( centralRoom, center, 400 );
  drawLayout();
  
  hideGold( treasureRoom );
  findGold( startingRoom );
}


void draw() {
  background(255);
 
  Room currRoom = searchPath.get( roomIndex );
  currRoom.colour = occupiedColour;
  currRoom.hasRobot = true;
  currRoom.drawMe();
  
  drawLayout();
  
  currRoom.colour = emptyColour;
  currRoom.hasRobot = false;
  
  if (roomIndex < searchPath.size()-1) 
    roomIndex++;
  else
    noLoop();
    
  
}
