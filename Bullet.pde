class Bullet extends Floater 
 {
     public Bullet(SpaceShip theShip) {
     myCenterX = theShip.getX();
     myCenterY = theShip.getY();
     myPointDirection = theShip.getPointDirection();
     double dRadians = myPointDirection*(Math.PI/180);   
     myDirectionX = 5 * Math.cos(dRadians) + theShip.getDirectionX();
     myDirectionY =  5 * Math.sin(dRadians) + theShip.getDirectionY();
     }
    
public void move() 
     {
     
     myCenterX += 5*myDirectionX;
     myCenterY += 5*myDirectionY;
   
     }
 
 public void show() 
     {
       
     noFill();
     stroke(108);
     double dRadians = myPointDirection*(Math.PI/180);
     ellipse( (int)myCenterX,(int) myCenterY, 5,5);
   
   }
    
   
public void setX(int x){myCenterX=x;}  
     public int getX(){return (int)myCenterX;}  
     public void setY(int y){myCenterY=y;}   
     public int getY(){return (int)myCenterY;}   
     public void setDirectionX(double x){myDirectionX=x;}    
     public double getDirectionX(){return (int)myDirectionX;}   
     public void setDirectionY(double y){myDirectionY=y;}  
     public double getDirectionY(){return (int)myDirectionY;} 
     public void setPointDirection(int degrees){myPointDirection=degrees;}  
     public double getPointDirection(){return myPointDirection;} 
 
 
 
 }
 