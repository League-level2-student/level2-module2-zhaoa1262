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
ArrayList<Segment> snakeTails = new ArrayList<Segment>();

//*
// ***** SETUP METHODS *****
// These methods are called at the start of the game.
//*

void setup() {
size(500, 500);
head = new Segment(250, 250);
frameRate(5);
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
  eat();
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
  manageTail();
}


//*
// ***** TAIL MANAGEMENT METHODS *****
// These methods make sure the tail is the correct length.
//*

void drawTail() {
  //Draw each segment of the tail 
for(int i = 0; i < snakeTails.size(); i++) {
rect(snakeTails.get(i).snakeX, snakeTails.get(i).snakeY, 10, 10);
}
}

void manageTail() {
  //After drawing the tail, add a new segment at the "start" of the tail and remove the one at the "end" 
  //This produces the illusion of the snake tail moving.
  checkTailCollision();
  drawTail();
  snakeTails.add(new Segment(head.snakeX, head.snakeY));
  snakeTails.remove(0);
}

void checkTailCollision() {
  //If the snake crosses its own tail, shrink the tail back to one segment 
  for(int i = 0; i < snakeTails.size(); i++) {
  if(head.snakeX == snakeTails.get(i).snakeX && head.snakeY == snakeTails.get(i).snakeY) {
    foodEaten=1;
    snakeTails = new ArrayList<Segment>();
    snakeTails.add(new Segment(head.snakeX, head.snakeY));
  }
  }
}



//*
// ***** CONTROL METHODS *****
// These methods are used to change what is happening to the snake
//*

void keyPressed() {
  //Set the direction of the snake according to the arrow keys pressed
  if(key == CODED) {
    if(keyCode==UP && snakeDirection!=DOWN) {
    snakeDirection = UP;
    }
    
     if(keyCode==DOWN && snakeDirection!=UP) {
    snakeDirection = DOWN;
    }
    
     if(keyCode==LEFT && snakeDirection!=RIGHT) {
    snakeDirection = LEFT;
    }
    
     if(keyCode==RIGHT && snakeDirection!=LEFT) {
    snakeDirection = RIGHT;
    }
    
   
  
  }
}

void move() {
  //Change the location of the Snake head based on the direction it is moving.
  
    
  switch(snakeDirection) {
  case UP:
    // move head up here 
    head.snakeY-=10;
    break;
  case DOWN:
    // move head down here 
    head.snakeY+=10;
    break;
  case LEFT:
   // figure it out 
   head.snakeX-=10;
    break;
  case RIGHT:
    // mystery code goes here 
    head.snakeX+=10;
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
foodEaten = foodEaten + 1;
dropFood();
drawFood();
snakeTails.add(new Segment (head.snakeX, head.snakeY));
}
}
