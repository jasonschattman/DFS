//GLOBAL VARIABLES
ArrayList<Room> allRooms = new ArrayList();   //Stores all the rooms in our building
ArrayList<Room> searchPath = new ArrayList(); //Stores the rooms the robot will visit during its search, in order

float animationSpeed = 1.2;
color emptyColour = color(255, 255, 180);
color occupiedColour = color(0,255,0);

Room entrance = new Room( "Entrance" );
Room library = new Room( "Library" );
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

Room startingRoom = foyer1;   //Where the robot will start 
Room treasureRoom = library;        //Where the ring is hidden
Room centralRoom = foyer1;      //The room around which the building's 2D layout will be generated and drawn

//OTHER GLOBAL VARIABLES -- DON'T CHANGE
int roomIndex = 0;
PFont myFont;
PVector center;
boolean found = false;
PImage ring, robot;


//MAIN PROCEDURE
void setup() {
  size( 1000, 770 );
  noLoop();
  frameRate( animationSpeed ); 
  stroke( 255 );
  textAlign( CENTER, CENTER );
  imageMode(CENTER);
  
  //Loads images and fonts
  ring = loadImage("ring.png");
  ring.resize(60, 45);
  robot = loadImage("robot.png");
  robot.resize(50, 50);
  myFont = createFont("Cambria", 20); textFont(myFont);
  center = new PVector(width/2, height/2);  
  
  //Specifies which rooms connect to which
  specifyNeighbours();
  
  //Computes the screen coordinates of each room - the goal is a hub-and-spoke like layout
  arrangeLayout( centralRoom, center, 400 );
  
  //Hides the ring in the desired room
  hideRing( treasureRoom );
  
  //RUNS THE MAIN ALGORITHM: Finds the ring using a DFS algorithm and stores the robot's path in the list searchPath
  findRing( startingRoom );
}


//ANIMATION LOOP - DRAWS THE ROBOT'S SEARCH PATH. EVERY ROOM CHANGE TAKES ONE FRAME OF THE ANIMATION
void draw() {
  background(0);
 
  Room currRoom = searchPath.get( roomIndex ); //Fetches the next room in the robot's path
  
  currRoom.hasRobot = true;  //Puts the robot in this room and changes the room's colour to green
  currRoom.colour = occupiedColour;
  
  drawLayout();  //Draws the building, along with the robot and the ring in their current positions
  
  currRoom.hasRobot = false; //Removes the robot from this room and changes the room's colour to default
  currRoom.colour = emptyColour;
  
  //Advances to the next room in searchPath, if we haven't already reached the end 
  if (roomIndex < searchPath.size()-1) 
    roomIndex++;
  else
    noLoop();
}
