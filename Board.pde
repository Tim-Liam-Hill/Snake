

class Board{
 
    Integer [] food = {-1, -1};
    boolean foodExists;
    
    Board()
    {
      generateFood();
    }
  
    void initializeBoard()
    {
      generateFood();
    }
  
    void drawBoard()
    {
      if(!foodExists)
        generateFood();
      
      for(int i =0; i< numRows; i ++)
      {
         for(int k=0; k< numCols; k++)
           {
             stroke(255);
             noFill();
             rect(xOffset + i*squareWidth, yOffset + k*squareWidth, squareWidth, squareWidth);
         }
      }
      
       fill(255, 255, 0);
       rect(xOffset + food[0]*squareWidth, yOffset + food[1]*squareWidth, squareWidth, squareWidth);
      
    }
  
    void generateFood()
    {
      Integer [] newFood = {-1, -1};
      boolean stop = false;
      
      while(!stop)
      {
        stop = true;
        newFood[0] = (int)(Math.random() * numRows);
        newFood[1] = (int)(Math.random() * numCols);
        
        if(newFood[0] == snek.body.get(0)[0] || newFood[1] == snek.body.get(0)[1])
          stop = false;
        else
        {
           for(int i=0; i< snek.body.size(); ++i)
            {
                if(snek.comparePointsIfEqual(snek.body.get(i), newFood))
                {
                    stop = false;
                }
            }
        }
        
      }
      
      food = newFood;
      foodExists = true;
    }
  
  
}
