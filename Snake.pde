
import java.util.LinkedList;

enum Direction {
    UP,
    DOWN,
    LEFT,
    RIGHT
}

class Snake
{
  LinkedList<Integer []> body;
  Direction direction;
  boolean alive;
  final int startLength = 3;
  Integer [] startPoint = {0, 0};
  boolean hasEaten;
  
  Snake()
  {
    
     body = new LinkedList<Integer []>();
     direction = Direction.RIGHT;
     initializeBody();
     alive = true;
     hasEaten = false;
     
  }
    
  void initializeBody()
  {
      hasEaten = false;
      alive = true;
      direction = Direction.UP;
      body.clear();
      body.add(startPoint);
      for(int i=0; i< startLength; i++)
      {
        Integer [] newPoint = movePoint(body.get(0));
        body.add(0, newPoint);
      }
      
  }
  
  void drawSnake()
  {
     for(int i=0; i < body.size(); ++i)
     {
         if(i ==0)
          fill(255, 0,0);
         else fill(0, 255, 0);
         
         rect(xOffset + squareWidth * body.get(i)[0], yOffset + squareWidth * body.get(i)[1], squareWidth, squareWidth);
     }
  }
  
  void updateSnake()
  {
      if(alive)
      {
          Integer [] newPoint = movePoint(body.get(0));
          alive = ! isAboutToCollide(newPoint);
          
          body.add(0, newPoint);
    
          if(!hasEaten)
            body.removeLast(); 
            
           hasEaten = checkIfEating();
           if(hasEaten)
             score += 10;
      }
  }
  
  boolean checkIfEating()
  {
    Integer [] foodPos = board.food;
    
    if(comparePointsIfEqual(foodPos, body.get(0)))
    {
      board.foodExists = false;
      return true;
    }
    
    return false;
  }
  
  boolean isAboutToCollide(Integer [] newPoint)
  {
      //first check body Linked list then check board
     
      
      for(int i=1; i<body.size(); ++i)
      {
          if(comparePointsIfEqual(body.get(i), newPoint))
            return true;
      }
    
    
     return false; 
  }
  
  boolean comparePointsIfEqual(Integer [] p1, Integer [] p2)    //returns true if two points are equal
  {
    return (p1[0] == p2[0] && p1[1] == p2[1]);
  }
  
  Integer [] movePoint(Integer [] point) //returns a new point that has been moved according to the snakes direction
  {
    Integer [] newPoint = new Integer[2];
    
    switch(this.direction)
    {
      case DOWN: newPoint[0] = point[0];
               if(point[1] == numRows - 1)
                 newPoint[1] = 0;
                else newPoint[1] = point[1] + 1;
        break;
      case LEFT: 
              newPoint[1] = point[1];
              if(point[0] == 0)
                   newPoint[0] = numCols - 1;
              else newPoint[0] = point[0] - 1;
        break;
      case RIGHT:
                newPoint[1] = point[1];
               if(point[0] == numCols - 1)
                 newPoint[0] = 0;
                else newPoint[0] = point[0] + 1;
        break;
      case UP:
                  newPoint[0] = point[0];
                 if(point[1] == 0)
                   newPoint[1] = numRows - 1;
                else newPoint[1] = point[1] - 1;
        break;
    
    }
    
    return newPoint;
  }
  
  boolean checkForCollision()
  {
   return false; 
  }
  
}
