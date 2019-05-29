class Dinosaur extends Enemy {
	// Requirement #4: Complete Dinosaur Class
 
  float speed = 1f;
	final float TRIGGERED_SPEED_MULTIPLIER = 5;
  Dinosaur (float x, float y){
  super(x,y);
  }
  
  void update(){
      x += speed;
    if(x+w >= width){
    speed=-speed;
    x += speed;}
    if(x<= 0) {
     speed=-speed;
     x +=speed;
   }
   if(player.y==y&&((speed>0&&player.x>x)||(speed<0&&player.x<x))){
   x+=(speed*TRIGGERED_SPEED_MULTIPLIER);
   }
  }
 void display(){
    if(speed>0){
   image(dinosaur,x,y);
 }
   else{
   
   pushMatrix();
   
   translate(x+w,y);
   scale(-1,1);
   image(dinosaur,0,0);
   popMatrix();
   }
  
  }
	// HINT: Player Detection in update()
	/*
	float currentSpeed = speed
	If player is on the same row with me AND (it's on my right side when I'm going right OR on my left side when I'm going left){
		currentSpeed *= TRIGGERED_SPEED_MULTIPLIER
	}
	*/
}
