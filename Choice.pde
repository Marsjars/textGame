import java.util.Map;

class Choice { 
  int choiceIdNumber;
  String prompt;
  ArrayList<Integer> newChoiceIds;
  ArrayList<String> choiceStrings;
  
  Choice (int choiceIdNumber, String prompt, ArrayList<String> choiceStrings, ArrayList<Integer> choiceIds) 
  { 
    this.newChoiceIds = choiceIds;
    this.choiceStrings = choiceStrings;
    this.choiceIdNumber = choiceIdNumber;
    this.prompt = prompt;
  }//End Choice()
  
  void setChoiceIds(ArrayList<Integer> choiceIds)
  {
    this.newChoiceIds = choiceIds;
  }
  
  ArrayList<Integer> getNewChoiceIds()
  {
    return this.newChoiceIds;
  }
  
  void setChoiceStrings(ArrayList<String> choiceStrings)
  {
    this.choiceStrings = choiceStrings;
  }
  
  ArrayList<String> getChoiceStrings()
  {
    return this.choiceStrings;
  }
  
  void setChoiceIdNumber(int choiceIdNumber)
  {
    this.choiceIdNumber = choiceIdNumber;
  }
  
  int getChoiceIdNumber()
  {
    return this.choiceIdNumber;
  }
  
  void setPrompt(String prompt)
  {
    this.prompt = prompt;
  }
  
  String getPrompt()
  {
    return this.prompt;
  }
  
  String toString(){
    return "\n\n*****\n[ID]: " + this.choiceIdNumber + "\n[Prompt]: " + prompt + "\n[Choices List]: " + choiceStrings.toString();
  }
  

} //End Class Choice