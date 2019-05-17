import java.util.Map;

class ChoiceHandler {
  HashMap<Integer,Choice> allChoicesHashMap;
  
  
  //Constructor for the Class
  ChoiceHandler()
  {
    allChoicesHashMap = new HashMap<Integer,Choice>();
    loadChoicesFromTxtFile();
    
    for(int i = 0; i < allChoicesHashMap.size(); i++)
    {
      println(allChoicesHashMap.get(i));
    }
    
  }//end ChoiceHandler()
  
  void loadChoicesFromTxtFile()
  {
    //Creating a new array of arrays to store prompts/paths
    String[] lines = loadStrings("gameChoicesMapping.txt");
    String[][] newLinesArray = new String[lines.length][];
  
    for (int i = 0 ; i < lines.length; i++) 
    {
      newLinesArray[i] = lines[i].split("~");
    }
    
    for (int i = 0 ; i < newLinesArray.length; i++) 
    {
      HashMap<Integer, String> newChoiceHashMap = new HashMap();
      ArrayList<String> choiceStrings = new ArrayList();
      ArrayList<Integer> choiceIds = new ArrayList();
      //Variable currentAction is used to track what action we should be doing in the parsing
      String currentAction = "";
      Choice newChoiceObject;
      //Variables used to initialize the Choice Object and store data from text file
      int choiceIdNumber = 0;
      String prompt = "";
      
      //Pulling object parameters from text file
      for (int x = 0 ; x < newLinesArray[i].length; x++) 
        {
          String currentItem = newLinesArray[i][x];
          if(currentItem.startsWith("["))
          {
            currentAction = currentItem;
          }
          
          else if(currentAction.equals("[choiceId]"))
          {
            try
            {
            choiceIdNumber = Integer.parseInt(currentItem);
            }
            catch(Exception e)
            {
            println(e);
            }
          }
          else if(currentAction.equals("[prompt]"))
          {
            prompt = currentItem;
          }
          else if(currentAction.equals("[choices]"))
          {
            choiceStrings.add(currentItem);
          }
          else if(currentAction.equals("[newPrompts]"))
          {
            try
            {
            choiceIds.add(Integer.parseInt(currentItem));
            }
            catch(Exception e)
            {
            println(e);
            }
          }
        }//End for loop checking the items for each choice
      
      newChoiceObject = new Choice(choiceIdNumber, prompt, choiceStrings, choiceIds);
      allChoicesHashMap.put(choiceIdNumber, newChoiceObject);
      }//End for loop checking each choice
  }//end loadChoicesFromTxtFile()
  
  Choice getChoice(int choiceId){
    return allChoicesHashMap.get(choiceId);
  }
  
}//end Class ChoiceHandler