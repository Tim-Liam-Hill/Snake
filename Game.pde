
int xOffset = 175;
int yOffset = 175;
int numRows = 7; //25 default, 12 is minimum unless start point changes
int numCols = 7; //25 default
int squareWidth = 25;
boolean useAI = true;
AI ai;

Board board;
Snake snek;
GameState gamestate;
int score;
PFont pf;

enum GameState {
      PAUSE,
      PLAY,
      DEAD
}

void setup()
{
  frameRate(60);
  size(1000, 1000);
  background(0);
  snek = new Snake();
  board = new Board();
  gamestate = GameState.PAUSE;
  score = 0;
  pf = createFont("Arial", 25, true);
  
   if(useAI)
     ai = new AI();
 
}


void draw()
{
    background(0);
   if(gamestate == GameState.PLAY)
   {
   
    snek.updateSnake();
    snek.drawSnake();
    board.drawBoard();
    if(useAI)
      ai.decideNextMove();
    
    printScore();
    if(!snek.alive)
      gamestate = GameState.DEAD;
   }
   else 
   {
     snek.drawSnake();
     board.drawBoard();
     printScore();
   }
   
  
}

void keyPressed()
{
  switch(gamestate)
  {
     case PAUSE: gamestate = GameState.PLAY;
       break;
     case PLAY: handleInputPlay();
       break;
     case DEAD: restartGame();
       break;
  }
}

void handleInputPlay()
{
  switch(keyCode)
  {
    case UP: snek.direction = Direction.UP;
      break;
    case DOWN: snek.direction = Direction.DOWN;
      break;
    case LEFT: snek.direction = Direction.LEFT;
      break;
    case RIGHT: snek.direction = Direction.RIGHT;
     break;
    case TAB: gamestate = GameState.PAUSE;
     default:
  }
}

void restartGame()
{
    gamestate = GameState.PAUSE;
    snek.initializeBody();
    board.initializeBoard();
    
    if(useAI)
      ai.reset();
    
    resetScore();
}

void resetScore()
{
  score = 0 ;
}

void printScore()   //shouldnt hardcode text position values
{
  textFont(pf, 35);
  fill(0, 190, 0);
  text("Score: " + score, 30, 70);
  
  if(gamestate == GameState.DEAD)
  {
     textFont(pf, 60);
     fill(200, 0, 10);
     text("Game Over", 300, 70);
  }
  else if(gamestate == GameState.PAUSE)
  {
    textFont(pf, 60);
    fill(0, 20, 150);
     text("Paused", 300, 70);
  }
  
}
