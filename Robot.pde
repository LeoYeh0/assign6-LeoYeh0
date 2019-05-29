class Robot extends Enemy {
	// Requirement #5: Complete Dinosaur Class
float speed = 2f;
Laser laser;
boolean cooldown;
	final int PLAYER_DETECT_RANGE_ROW = 2;
	final int LASER_COOLDOWN = 180;
	final int HAND_OFFSET_Y = 37;
	final int HAND_OFFSET_X_FORWARD = 64;
	final int HAND_OFFSET_X_BACKWARD = 16;
  float timer=0;
  int framecount=0;
 
Robot(float x,float y){
  super(x,y);
  laser=new Laser();
  
}
void display(){
  laser.display();
    if(speed>0||(speed==0&&player.x+w/2>=x+HAND_OFFSET_X_FORWARD)){
   image(robot,x,y);
 }
   if(speed<0||(speed==0&&player.x+w/2 <=x-HAND_OFFSET_X_BACKWARD )){
   
   pushMatrix();
   
   translate(x+w,y);
   scale(-1,1);
   image(robot,0,0);
   popMatrix();
   }
  
  }


void update(){
 
    laser.update();
    
      x += speed;
     boolean checkX = (speed>0 && player.x+w/2>=x+HAND_OFFSET_X_FORWARD)||
          ( speed<0 && player.x+w/2 <=x-HAND_OFFSET_X_BACKWARD );
    boolean checkY = (player.y>=y-h*2)&&(player.y<=y+h*2);
     boolean cooldown=timer++%180==0;
    if(checkY&& checkX){
     
      speed=0;
    
    
      laser.fire(x, y, player.x+w/2, player.y+w/2);
    
   
   }else{
   
    if(x+w >= width){
    speed=-speed;
    x += speed;}
    if(x<= 0) {
     speed=-speed;
     x +=speed;
   }
   }
   
   
   
   
   
   }
  
 
    
	// HINT: Player Detection in update()
	/*

	boolean checkX = ( Is facing forward AND player's center point is in front of my hand point )
					OR ( Is facing backward AND player's center point (x + w/2) is in front of my hand point )

	boolean checkY = player is less than (or equal to) 2 rows higher or lower than me

	if(checkX AND checkY){
		Is laser's cooldown ready?
			True  > Fire laser from my hand!
			False > Don't do anything
	}else{
		Keep moving!
	}

	*/
}
