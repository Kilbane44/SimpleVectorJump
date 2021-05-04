class Platform
{
  PVector pos;
  float w;
  float h;
  
  
  Platform(float x, float y, float _w, float _h)
  {
    pos = new PVector(x,y);
    w = _w;
    h = _h;
  }
  
  void Render()
  {
    fill(100);
    rect(pos.x,pos.y,w,h);
  }
  
  boolean isTouchingTop(PVector player)
  {
    if(player.x > pos.x && player.x < pos.x + w)
    {
      if(abs(player.y - pos.y) < size/2)
      {
        return true;
      }
    }
    
    return false;
  }
}
