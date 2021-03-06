//your variable declarations here
SpaceShip bob;
Star [] stars;
//Asteroids [] lotsAsteroids;
ArrayList <Asteroids> asteroids;
ArrayList<Bullet> bullets;

public void setup() 
{
  //your code here
  background(0);
  size(600,600);
  bob =new SpaceShip();
  
  stars = new Star[5000];
  for (int i=0; i<1000; i++)
  {
    stars[i] = new Star();
  }
  asteroids= new ArrayList <Asteroids>();
  for (int i=0; i<20; i++)
  {
    asteroids.add(new Asteroids());
  }
 bullets= new ArrayList <Bullet>();
  
  /* lotsAsteroids= new Asteroids[40];
  for (int i = 0; i<40; i++)
  {
    lotsAsteroids[i] = new Asteroids();
  } */

}
public void draw() 
{
  //your code here
  background(0);
  bob.move();
  bob.show();
  /*  for (int i = 0; i<40; i++)
  {
    lotsAsteroids[i].show();
    lotsAsteroids[i].move();
  } */

  for (int i=0; i<1000; i++)
  {
    stars[i].show();
  }
 
for(int c = 0; c < asteroids.size(); c++)
  {
    asteroids.get(c).show();
    asteroids.get(c).move();
    if(dist(asteroids.get(c).getX(), asteroids.get(c).getY(), bob.getX(), bob.getY()) <= 20)
    {
      asteroids.remove(c);
    }
  }
  for(int a = 1; a < bullets.size(); a++)
  {
    bullets.get(a).show();
    bullets.get(a).move();
  }
  for(int i = 1; i < asteroids.size(); i++)
  {
    for(int j = 0; j < bullets.size(); j++)
    {
      if(dist((float)asteroids.get(j).getX(), (float)bullets.get(j).getY(), (float)asteroids.get(i).getX(), (float)asteroids.get(i).getY()) < 20)
      {
        bullets.remove(j);
        asteroids.remove(i);
        break;
      }
    }
  }
}

   public void keyPressed()
   {
     if (keyCode == UP) 
    {
      bob.accelerate(0.1);
    }
    else if (keyCode == LEFT) 
    {
      bob.rotate(-15);
    }
    else if (keyCode == RIGHT)
    {
      bob.rotate(15);
    }
    else if (keyCode == DOWN) 
    {
     bob.setDirectionX(0);
     bob.setDirectionY(0);
    }
    else if (key== ' ')
    {
    bob.hyperspace();
      
    }
    if (key=='q')
    {
    bullets.add(new Bullet(bob));
    }
   
}

class Asteroids extends Floater
{
  private int rotSpeed;
  public Asteroids()
 {
 corners = 9;
xCorners = new int[corners];
yCorners = new int[corners];
xCorners[0] =0;
yCorners[0] = -23;
xCorners[1] = -5;
yCorners[1] = -12;
xCorners[2] = -9;
yCorners[2] = -9;
xCorners[3] = -11;
yCorners[3] = -6;
xCorners[4] = -9;
yCorners[4] = 6;
xCorners[5] = -4;
yCorners[5] = 8;
xCorners[6] = 5;
yCorners[6] = 8;
xCorners[7] = 4;
yCorners[7] = -5;
xCorners[8] = 6;
yCorners[8] = -10;

myColor = color(156, 156, 156);
myCenterX = 0;
myCenterY = Math.random()*height;
myDirectionX = (Math.random()*3)-1.5;
myDirectionY = (Math.random()*3)-1.5;
myPointDirection = Math.random()*360;
rotSpeed = ((int)(Math.random()*5)-3);
 }
  public void show ()  //Draws the floater at the current position  
  {             
    noFill();   
    stroke(myColor);    
    //convert degrees to radians for sin and cos         
    double dRadians = myPointDirection*(Math.PI/180);                 
    int xRotatedTranslated, yRotatedTranslated;    
    beginShape();         
    for (int nI = 0; nI < corners; nI++)    
    {     
      //rotate and translate the coordinates of the floater using current direction 
      xRotatedTranslated = (int)((xCorners[nI]* Math.cos(dRadians)) - (yCorners[nI] * Math.sin(dRadians))+myCenterX);     
      yRotatedTranslated = (int)((xCorners[nI]* Math.sin(dRadians)) + (yCorners[nI] * Math.cos(dRadians))+myCenterY);      
      vertex(xRotatedTranslated, yRotatedTranslated);
    }   
    endShape(CLOSE);
  } 
 
public void move()
 {
 rotate((int)(rotSpeed));
 super.move();
 }
  public void setX(int x) {myCenterX=x;}  
  public int getX(){return (int)myCenterX;}   
  public void setY(int y){myCenterY=y; }   
  public int getY(){return(int)myCenterY;}   
  public void setDirectionX(double x){myDirectionX=x;}   
  public double getDirectionX(){return(double)myDirectionX;}   
  public void setDirectionY(double y){myDirectionY=y;}   
  public double getDirectionY(){return (double)myDirectionY;}   
  public void setPointDirection(int degrees){myPointDirection=degrees;}   
  public double getPointDirection(){return myPointDirection;}
}
class SpaceShip extends Floater  
{ 

  public SpaceShip()
  {
    corners= 4;
    xCorners = new int[corners];
    yCorners = new int[corners];
    xCorners[0] = -8;
    yCorners[0] = -8;
    xCorners[1] = 16;
    yCorners[1] = 0;
    xCorners[2] = -8;
    yCorners[2] = 8;
    xCorners[3]=-2;
    yCorners[3]=0;
    myColor = 255;
    myCenterX = 250;
    myCenterY = 250;
    myDirectionX = 0;
    myDirectionY = 0;
    myPointDirection = 0;
  }
  //your code here


  public void setX(int x) {myCenterX=x;}  
  public int getX(){return (int)myCenterX;}   
  public void setY(int y){myCenterY=y; }   
  public int getY(){return(int)myCenterY;}   
  public void setDirectionX(double x){myDirectionX=x;}   
  public double getDirectionX(){return(double)myDirectionX;}   
  public void setDirectionY(double y){myDirectionY=y;}   
  public double getDirectionY(){return (double)myDirectionY;}   
  public void setPointDirection(int degrees){myPointDirection=degrees;}   
  public double getPointDirection(){return myPointDirection;}
  
  
  public void hyperspace()
{
  setX((int)(Math.random()*501)+1);
  setY((int)(Math.random()*501)+1);
 // setDirectionX(0);
  //setDirectionY(0);
  setPointDirection((int)(Math.random()*361)+1);

}

}
abstract class Floater //Do NOT modify the Floater class! Make changes in the SpaceShip class 
{   
  protected int corners;  //the number of corners, a triangular floater has 3   
  protected int[] xCorners;   
  protected int[] yCorners;   
  protected int myColor;   
  protected double myCenterX, myCenterY; //holds center coordinates   
  protected double myDirectionX, myDirectionY; //holds x and y coordinates of the vector for direction of travel   
  protected double myPointDirection; //holds current direction the ship is pointing in degrees    
  abstract public void setX(int x);  
  abstract public int getX();   
  abstract public void setY(int y);   
  abstract public int getY();   
  abstract public void setDirectionX(double x);   
  abstract public double getDirectionX();   
  abstract public void setDirectionY(double y);   
  abstract public double getDirectionY();   
  abstract public void setPointDirection(int degrees);   
  abstract public double getPointDirection(); 

  //Accelerates the floater in the direction it is pointing (myPointDirection)   
  public void accelerate (double dAmount)   
  {          
    //convert the current direction the floater is pointing to radians    
    double dRadians =myPointDirection*(Math.PI/180);     
    //change coordinates of direction of travel    
    myDirectionX += ((dAmount) * Math.cos(dRadians));    
    myDirectionY += ((dAmount) * Math.sin(dRadians));
  }   
  public void rotate (int nDegreesOfRotation)   
  {     
    //rotates the floater by a given number of degrees    
    myPointDirection+=nDegreesOfRotation;
  }   
  public void move ()   //move the floater in the current direction of travel
  {      
    //change the x and y coordinates by myDirectionX and myDirectionY       
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;     

    //wrap around screen    
    if (myCenterX >width)
    {     
      myCenterX = 0;
    } else if (myCenterX<0)
    {     
      myCenterX = width;
    }    
    if (myCenterY >height)
    {    
      myCenterY = 0;
    } else if (myCenterY < 0)
    {     
      myCenterY = height;
    }
  }   
  public void show ()  //Draws the floater at the current position  
  {             
    fill(myColor);   
    stroke(myColor);    
    //convert degrees to radians for sin and cos         
    double dRadians = myPointDirection*(Math.PI/180);                 
    int xRotatedTranslated, yRotatedTranslated;    
    beginShape();         
    for (int nI = 0; nI < corners; nI++)    
    {     
      //rotate and translate the coordinates of the floater using current direction 
      xRotatedTranslated = (int)((xCorners[nI]* Math.cos(dRadians)) - (yCorners[nI] * Math.sin(dRadians))+myCenterX);     
      yRotatedTranslated = (int)((xCorners[nI]* Math.sin(dRadians)) + (yCorners[nI] * Math.cos(dRadians))+myCenterY);      
      vertex(xRotatedTranslated, yRotatedTranslated);
    }   
    endShape(CLOSE);
  }
}
public class Star
{
  private int posX, posY, mySize;
  public Star()
  {  
    posX=((int)(Math.random()*601)+1);
    posY=((int)(Math.random()*601)+1);
    mySize=((int)(Math.random()*5)+1);
  } 
  public void show()
  {
    noStroke();
    fill(105, 88, 91);
    ellipse(posX, posY, mySize, mySize);
  }
} 