
class AI
{
  int phase;
  
  AI()
  {
     phase = 0;
  }
  
  
  void decideNextMove()
  {
     switch(this.phase)
     {
       case 0:  findTopLeft();      //just started new game so need to find way to top left corner with correct orientation
         break;
        case 1: goDown();    
          break;
        case 2: goUp();
          break;
     }
  }
  
  //---------------Phase functions----------------------------------------------------------------------------------------
  
  void findTopLeft()
  {
      Integer [] snakeHead = snek.body.getFirst();
      
      if(snakeHead[0] == 0 && snakeHead[1] == 0) //made it to topLeft
      {
         this.phase = 1;
         snek.direction = Direction.RIGHT;
      }
      else if(snakeHead[0] == 0)
      {
        snek.direction = Direction.UP;
      }
      else
      {
        snek.direction = Direction.RIGHT;
      }
  }
  
  void goDown()
  {
     Integer [] snakeHead = snek.body.getFirst();
     
     if(snakeHead[1] == numRows - 1)
     {
         snek.direction = Direction.RIGHT;
         this.phase = 2;
     }
     else
     {
       snek.direction = Direction.DOWN;
     }
  }
  
  void goUp()
  {
      Integer [] snakeHead = snek.body.getFirst();
      
       if(snakeHead[1] == 0)
     {
         snek.direction = Direction.RIGHT;
         this.phase = 1;
     }
     else
     {
       snek.direction = Direction.UP;
     }
  }
  
  //-------------------------------------------------------------------------------------------------------------------------
  
  void reset()
  {
    this.phase = 0;
  }
}
