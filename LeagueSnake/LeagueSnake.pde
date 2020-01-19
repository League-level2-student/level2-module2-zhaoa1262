//*
// ***** SEGMENT CLASS *****
// This class will be used to represent each part of the moving snake.
//*

class Segment {

//Add x and y member variables. They will hold the corner location of each segment of the snake.
int snakeX;
int snakeY;

// Add a constructor with parameters to initialize each variable.
public Segment(int snakeX , int snakeY) {
  this.snakeX = snakeX;
  this.snakeY = snakeY;
}


}


//*
// ***** GAME VARIABLES *****
// All the game variables that will be shared by the game methods are here
//*

Segment head;
int foodX;
int foodY;
int snakeDirection = UP;
int foodEaten = 0;


//*
// ***** SETUP METHODS *****
// These methods are called at the start of the game.
//*

void setup() {
size(500, 500);
head = new Segment(364, 232);
frameRate(20);
dropFood();
}

void dropFood() {
  //Set the food in a new random location
    foodX = ((int)random(50)*10);
    foodY = ((int)random(50)*10);
}



//*
// ***** DRAW METHODS *****
// These methods are used to draw the snake and its food 
//*

void draw() {
  background(214, 234, 248);
  drawFood();
  move();
  drawSnake();
}

void drawFood() {
  //Draw the food
  noStroke();
  fill(236, 112, 99);
  rect(foodX, foodY, 10, 10);
}

void drawSnake() {
  //Draw the head of the snake followed by its tail
  fill(49, 204, 113);
  rect(head.snakeX, head.snakeY, 10, 10);
}


//*
// ***** TAIL MANAGEMENT METHODS *****
// These methods make sure the tail is the correct length.
//*

void drawTail() {
  //Draw each segment of the tail 

}

void manageTail() {
  //After drawing the tail, add a new segment at the "start" of the tail and remove the one at the "end" 
  //This produces the illusion of the snake tail moving.
  
}

void checkTailCollision() {
  //If the snake crosses its own tail, shrink the tail back to one segment
  
}



//*
// ***** CONTROL METHODS *****
// These methods are used to change what is happening to the snake
//*

void keyPressed() {
  //Set the direction of the snake according to the arrow keys pressed
  if(key == CODED) {
    if(keyCode==UP) {
    snakeDirection = UP;
    }
    
     if(keyCode==DOWN) {
    snakeDirection = DOWN;
    }
    
     if(keyCode==LEFT) {
    snakeDirection = LEFT;
    }
    
     if(keyCode==RIGHT) {
    snakeDirection = RIGHT;
    }
    
 
  
  }
}

void move() {
  //Change the location of the Snake head based on the direction it is moving.
  
    
  switch(snakeDirection) {
  case UP:
    // move head up here 
    head.snakeY-=2;
    break;
  case DOWN:
    // move head down here 
    head.snakeY+=2;
    break;
  case LEFT:
   // figure it out 
   head.snakeX-=2;
    break;
  case RIGHT:
    // mystery code goes here 
    head.snakeX+=2;
    break;
  }
  checkBoundaries();
}

void checkBoundaries() {
 //If the snake leaves the frame, make it reappear on the other side
 if(head.snakeX <= 0) {
 head.snakeX = 490;
 }
 
 if( head.snakeX >= 500 ) {
 head.snakeX = 10;
 }
 
 if(head.snakeY<=0) {
 head.snakeY = 490;
 }
 
 if(head.snakeY>=500) {
 head.snakeY = 10;
 }
 
}



void eat() {
  //When the snake eats the food, its tail should grow and more food appear
if(head.snakeX == foodX && head.snakeY == foodY) {
foodEaten++;
dropFood();
fill(236, 112, 99);
  rect(foodX, foodY, 10, 10);
}
}
