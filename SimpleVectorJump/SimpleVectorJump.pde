boolean left, right = false;
PVector pos;
PVector velocity;
PVector acceleration;
boolean onGround = false;
float size = 40;
float speed = 2;
float topspeed = 25;
float jumpForce = 8;
boolean jump = false;



float gravity = -.02;
float friction = .8;



Platform plat = new Platform(600, 730, 40, 20);
Platform theFloor = new Platform(0, 795, 800, 10);


ArrayList<Platform> platforms = new ArrayList<Platform>();
void setup()
{
  pos = new PVector(400, 200);
  velocity = new PVector(0, 0);
  acceleration = new PVector(0, 0);



  //for (int i=0; i < 10; i++)
  //{
  //  platforms.add(new Platform(200, i *80 + 20, 50, 20));
  //  platforms.add(new Platform(600, i *80 + 20, 50, 20));
  //}
  
  
  
  size(800, 800);
}

void draw()
{
  background(255);
  ellipse(pos.x, pos.y, size, size);


  if (jump)
  {
    onGround = false;
    jump = false;
  }

  if (onGround == false)
  {
    acceleration.y -= gravity;
  }



  velocity.add(acceleration);
 
    velocity.x *= friction;
  
  velocity.limit(topspeed);





  pos.add(velocity);



  Inputs();
  UpdatePlatforms();
}

void Inputs()
{

  if (left)
  {
    velocity.x -= speed;
  }
  if (right)
  {
    velocity.x += speed;
  }
}

void UpdatePlatforms()
{
  int touchCount =0;


  theFloor.Render();
  plat.Render();

  //for (Platform p : platforms)
  //{
  //  p.Render();
  //  if (p.isTouchingTop(pos))
  //  {
  //    pos.y = p.pos.y-size/2;
  //    onGround = true;
  //    acceleration.y=0;
  //    // acceleration.x=0;
  //    velocity.y=0;
  //    //velocity.x=0;
  //    touchCount++;
  //  }
  //}

  if (plat.isTouchingTop(pos))
  {
    pos.y = plat.pos.y-size/2;
    onGround = true;
    acceleration.y=0;
    // acceleration.x=0;
    velocity.y=0;
    //velocity.x=0;
    touchCount++;
  }

  if (theFloor.isTouchingTop(pos))
  {
    pos.y = theFloor.pos.y-size/2;
    onGround = true;
    acceleration.y=0;
    // acceleration.x=0;
    velocity.y=0;
    // velocity.x=0;
    touchCount++;
  }

  if (touchCount == 0)
  {
    onGround = false;
  }
}


void keyPressed()
{
  if (key == ' ')
  {
    velocity.y = -jumpForce;
    onGround = false;
    jump = true;
  }
  if (key == 'a')
  {
    left = true;
  }
  if (key == 'd')
  {
    right = true;
  }
}

void keyReleased()
{
  if (key == 'a')
  {
    left = false;
  }
  if (key == 'd')
  {
    right = false;
  }
}
