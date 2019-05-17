
import java.util.*;

ChoiceHandler choiceHandler;
String promptString = "";
String choiceOneString = "";
String choiceTwoString = "";
String choiceThreeString = "";

int decisionCircleY = 0;
int currentDecisionInt = 0;
int currentDecisionAmount = 0;
ArrayList<Integer> availableChoiceInts = new ArrayList();
boolean keyPressed = false;


// setup() runs once  
void setup() 
{  
  //Size() can only take ints passed in, so we define the width and size here, and then pull them to store
  //in the global variables width and height for later use
  size(600, 400);
  choiceHandler = new ChoiceHandler();
  decisionCircleY = height*1/4 + 90;
  updateChoiceDisplay(1);
  
}//End setup()


// draw() loops forever, until stopped
void draw() 
{  
  background(204);
  
  
  //Defining the area to print out text to the user
  textSize(10);
  textAlign(CENTER, BOTTOM);
  fill(50);
  text(promptString, width/2, height*1/4);  // Text wraps within text box
  text(choiceOneString, width/2, height*2/4);  // Text wraps within text box
  text(choiceTwoString, width/2, height*3/4);  // Text wraps within text box
  text(choiceThreeString, width/2, height);  // Text wraps within text box
  
  //Drawing a circle to choose something
  if(keyPressed == true){
      keyPressed = false;
  }
  ellipse(width/3, decisionCircleY, width / 100, width / 100);
  
 
}//End draw()

void keyPressed() {
  if (key == CODED && keyPressed == false) {
    if (keyCode == UP && currentDecisionInt > 0)
    {
      currentDecisionInt -= 1;
      decisionCircleY = decisionCircleY - (100);
      keyPressed = true;
    }
    else if (keyCode == DOWN && currentDecisionInt < currentDecisionAmount - 1)
    {
      currentDecisionInt += 1;
      decisionCircleY = decisionCircleY + (100);
      keyPressed = true;
    }
  }
     if (key == ENTER){
      updateChoiceDisplay(availableChoiceInts.get(currentDecisionInt));
      keyPressed = true;
    }
}

void updateChoiceDisplay(int choiceId){
  currentDecisionInt = 0;
  decisionCircleY = height*1/4 + 90;
  availableChoiceInts.clear();
  
  Choice currentChoice = choiceHandler.getChoice(choiceId);
  ArrayList<String> choiceStrings = new ArrayList(); 
  ArrayList<Integer> choiceIds = new ArrayList();
  
  try{
  choiceStrings = currentChoice.getChoiceStrings();
  choiceIds = currentChoice.getNewChoiceIds();
  currentDecisionAmount = choiceStrings.size();
  promptString = currentChoice.getPrompt();
  }
  catch(Exception e){
    println("Had an exception: " + e);
    exit();
  }
  
  try{
    choiceOneString = choiceStrings.get(0);
  }catch(Exception e)
  {
    choiceOneString = "";
  }
  try{
    choiceTwoString = choiceStrings.get(1);
  }catch(Exception e)
  {
    choiceTwoString = "";
  }
  try{
    choiceThreeString = choiceStrings.get(2);
  }catch(Exception e)
  {
    choiceThreeString = "";
  }
  
  for(int id : choiceIds){
    availableChoiceInts.add(id);
  }
}